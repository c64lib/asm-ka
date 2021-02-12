#!/bin/bash


if [ "$CIRCLE_TAG" != "" ]
then
	rm KickAssembler.zip
	wget --quiet http://theweb.dk/KickAssembler/KickAssembler.zip
	unzip KickAssembler.zip
	cp KickAss.jar out
fi
