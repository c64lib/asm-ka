#!/bin/bash


if [ "$CIRCLE_TAG" != "" ]
then
	rm KickAssembler.zip
	wget -d --user-agent="Mozilla/5.0 (Windows NT x.y; rv:10.0) Gecko/20100101 Firefox/10.0" http://theweb.dk/KickAssembler/KickAssembler.zip
	unzip KickAssembler.zip
	cp KickAss.jar out
fi
