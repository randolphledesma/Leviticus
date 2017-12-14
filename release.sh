#!/bin/sh
rm .build/release/Run
swift build --configuration release
.build/release/Run serve