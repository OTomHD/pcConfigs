#!/bin/python
import requests as r
import json
import wget
import tarfile
import os
import shutil
import sys
import concurrent.futures


class protonDownloader:
    def __init__(self,api,path,name):
        self.data = r.get(api)
        self.path = path
        self.customWine = name
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def checkStatusCode(self):
        if (self.data.status_code != 200):
            print("Error downloading git data: {}".format(self.data.status_code))
            return False
        return True
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def getCurrentVersion(self):
        if not(os.path.exists("{}/.{}".format(self.path, self.customWine))):
            return "No Wine"
        with open("{}/.{}".format(self.path, self.customWine)) as f:
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
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def installWine(self):
        filename = self.data.json()["assets"][1]["name"] # Get tar and extract it
        f = tarfile.open("{}/{}".format(self.path,filename))
        f.extractall(self.path)
        foldername = f.getnames()[0] # get file name
        f.close()
        os.remove("{}/{}".format(self.path, filename)) # remove old tar

        if(os.path.exists("{}/{}".format(self.path, self.customWine)) == True):
            shutil.rmtree("{}/{}".format(self.path, self.customWine))
        os.rename("{}/{}".format(self.path, foldername), "{}/{}".format(self.path,self.customWine)) # rename folder
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def setLatestVersion(self):
        with open("{}/.{}".format(self.path, self.customWine),"w") as f:
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
    wine = protonDownloader("https://api.github.com/repos/GloriousEggroll/wine-ge-custom/releases/latest", "~/.config/heroic/tools/wine/", "Wine-GE-Latest")
    wine.run()
    
    proton = protonDownloader("https://api.github.com/repos/GloriousEggroll/proton-ge-custom/releases/latest", "~/.steam/steam/compatibilitytools.d/", "Proton-GE-Latest")
    proton.run()

if __name__ == "__main__":
    main()