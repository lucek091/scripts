#!/bin/bash

sourceNavigation='../resources/package/webaccess/xml/navigation.xml'
destinationNavigation='kplus@kenvng:/kenvng/home/kplus/dist/webaccess/xml/navigation.xml'

sourceViewsDir='../resources/package/webaccess/xml/views/'
destinationViewsDir='kplus@kenvng:/kenvng/home/kplus/dist/webaccess/xml/views/'

sourceWorksheetDir='../resources/package/webaccess/xml/worksheets/deal/'
destinationWorksheetDir='kplus@kenvng:/kenvng/home/kplus/dist/webaccess/xml/worksheets/deal/'

sourcehbmDir='../resources/package/webaccess/xml/hbm/'
destinationhbmDir='kplus@kenvng:/kenvng/home/kplus/dist/webaccess/xml/hbm/'

#cd ..
#cd resources/package/webaccess/xml/temp


navigationXmlSynchro(){

echo "------------Synchronizing navigation.xml------------"
rsync -ua -e ssh --exclude="*.*~" --exclude=".*" --progress "$sourceNavigation" "$destinationNavigation"
echo "------------navigation.xml done------------"

}

viewDirectorySynchro(){

echo "------------Synchronizing view directory------------"
rsync -ua -e ssh --exclude="*.*~" --exclude=".*" --progress "$sourceViewsDir" "$destinationViewsDir"
echo "------------view directory done------------"

}

workseetsDirectorySynchro(){

echo "------------Synchronizing worksheet directory------------"
rsync -ua -e ssh --exclude="*.*~" --exclude=".*" --progress "$sourceWorksheetDir" "$destinationWorksheetDir"
echo "------------worksheet directory done------------"

}

hbmDirectorySynchro(){

printf "\n\n------------Synchronizing hbm directory------------\n"
rsync -ua -e ssh --exclude="*.*~" --exclude=".*" --progress "$sourcehbmDir" "$destinationhbmDir"
printf "\n------------hbm directory done------------\n"

}


navigationXmlSynchro
viewDirectorySynchro
workseetsDirectorySynchro
hbmDirectorySynchro
