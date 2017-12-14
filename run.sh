#!/bin/sh
rm .build/debug/Run
swift build --configuration=debug -Xswiftc -DDEBUG
.build/debug/Run serve