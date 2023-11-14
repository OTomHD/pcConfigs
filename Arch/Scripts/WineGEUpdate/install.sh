#!/bin/bash

userInstallLoation=$HOME/.local/bin
systemInstallLocation=/bin
virtaulEnvDir=./temp
commandName=updateWineGE



createVirtualEnvironment(){
    python -m venv ./temp
    source "$virtaulEnvDir/bin/activate"
}

installRequirements(){
    pip install -r requirements.txt
}

compileScript(){
    pyinstaller --onefile --specpath $virtaulEnvDir $commandName.py
}

installScriptToUser(){
    echo Installing Script to user at $userInstallLoation
    if [ ! -d "$userInstallLoation" ]; then
        mkdir -p "$userInstallLoation"
    fi
    cp ./dist/$commandName $userInstallLoation/$commandName
}

installScriptToSystem(){
    echo Installing Script to system at $systemInstallLocation
    if [ ! -d "$systemInstallLocation" ]; then
        mkdir -p "$systemInstallLocation"
    fi
    cp ./dist/$commandName $systemInstallLocation/$commandName
}

clean(){
    if [ -d "$1" ]; then 
        rm -rf "$1"
    fi
}

cleanUp(){
    echo Cleaning Build Folders
    buildFolder=./build
    distFolder=./dist

    clean $buildFolder
    clean $distFolder
    clean $virtaulEnvDir
}

main() {
    createVirtualEnvironment
    installRequirements
    compileScript
    installScriptToUser
    cleanUp
}

main