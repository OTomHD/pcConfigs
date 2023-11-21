#!/bin/python
import requests as r
import json
import wget
import tarfile
import os
import shutil
import sys



class protonDownloader:
    def __init__(self,api,path,name):
        self.data = r.get(api)
        self.path = path
        self.customWine = name
        self.versionFile = "{}/{}/.version".format(self.path, self.customWine)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def checkStatusCode(self):
        if (self.data.status_code != 200):
            print("Error downloading git data: {}".format(self.data.status_code))
            return False
        return True
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def getCurrentVersion(self):
        if not(os.path.exists(self.versionFile)):
            return "No Wine"
        with open(self.versionFile) as f:
            line = f.readline()
        return line

    def getLatestVersion(self):
        version = self.data.json()["tag_name"]
        return version

    def checkVersions(self):
        currentVersion = self.getCurrentVersion()
        latestVersion = self.getLatestVersion()

        if(currentVersion == latestVersion):
            print("Newest version already installed no need to update")
            return False
        print ("Updating from version {} to version {}".format(currentVersion,latestVersion))
        return True
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def createFolder(self):
        if(os.path.exists("{}".format(self.path)) == False):
            os.mkdir(self.path)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def downloadWine(self):
        wget.download(self.data.json()["assets"][1]["browser_download_url"], out=self.path)
        print()
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def installWine(self):
        customWineFolder = "{}/{}".format(self.path, self.customWine)
        tarFileLocation = "{}/{}".format(self.path,self.data.json()["assets"][1]["name"]) # Get tar and extract it
        f = tarfile.open(tarFileLocation)
        f.extractall(self.path)
        foldername = f.getnames()[0] # get file name
        f.close()
        os.remove(tarFileLocation) # remove old tar

        if(os.path.exists(customWineFolder) == True):
            shutil.rmtree(customWineFolder)
        os.rename("{}/{}".format(self.path, foldername), customWineFolder) # rename folder
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def setLatestVersion(self):
        with open(self.versionFile,"w") as f:
            f.write(self.data.json()["tag_name"])
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def run(self):
        if not self.checkStatusCode():
            return

        if not self.checkVersions():
            return

        try:
            self.createFolder()
            self.downloadWine()
            self.installWine()
            self.setLatestVersion()
        except:
            print("An error occured")


def main():
    wine = protonDownloader("https://api.github.com/repos/GloriousEggroll/wine-ge-custom/releases/latest", os.path.expanduser("~/.config/heroic/tools/wine/"), "Wine-GE-Latest")
    wine.run()
    
    proton = protonDownloader("https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest", os.path.expanduser("~/.config/heroic/tools/proton/"), "Proton-GE-Latest")
    proton.run()

if __name__ == "__main__":
    main()