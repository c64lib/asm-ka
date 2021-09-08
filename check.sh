#!/bin/bash

rm _FrontPage.html
rm version

wget -d --user-agent="Mozilla/5.0 (Windows NT x.y; rv:10.0) Gecko/20100101 Firefox/10.0" http://theweb.dk/KickAssembler/_FrontPage.html

VERSION=`cat _FrontPage.html | grep -Po '(?<=Kick Assembler V)\d+.\d.'`

if [ "$VERSION" == "" ]
then
	echo "KickAssembler version cannot be determined, maybe the webpage cannot be downloaded or its format has been changed."
	exit -1
fi

echo "Found version ${VERSION}"

HTTP_CODE=`curl -s -o /dev/null -I -w "%{http_code}" https://github.com/c64lib/asm-ka/releases/tag/${VERSION}`
echo "Version ${VERSION} released?: ${HTTP_CODE}"

if [ "$HTTP_CODE" == "404" ]
then
	git tag $VERSION
	git push origin $VERSION
fi

if [ "$TRAVIS_TAG" != "" ]
then
	rm KickAssembler.zip
	wget --quiet http://theweb.dk/KickAssembler/KickAssembler.zip
	unzip KickAssembler.zip
fi
