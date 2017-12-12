#!/bin/sh
mkdir /tmp/Leviticus
cd /tmp/Leviticus
ln -sv /project/Leviticus/Package.swift Package.swift
ln -sv /project/Leviticus/Sources Sources
ln -sv /project/Leviticus/Tests Tests
swift build
.build/debug/Leviticus serve