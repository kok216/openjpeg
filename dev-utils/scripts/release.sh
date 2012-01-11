#!/bin/sh
#generate OpenJPEG release on *NIX

# get tmpdir:
TMPDIR=/tmp/openjpeg_release

mkdir -p $TMPDIR
cd $TMPDIR
svn checkout http://openjpeg.googlecode.com/svn/branches/openjpeg-1.5 openjpeg

mkdir $TMPDIR/openjpeg-build
cd $TMPDIR/openjpeg-build
cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo -DBUILD_JPWL:bool=on -DBUILD_MJ2:bool=on -DBUILD_JPIP:bool=on ../openjpeg > config.log 2>&1

# build openjpeg
make -j2 > make.log 2>&1

# create TGZ installer
cpack -G TGZ > tgz.log 2>&1

isOSX="`uname -s | grep -i Darwin`"
if [ "$isOSX" != "" ]; then
# create Bundle (MacOSX) installer
cpack -G Bundle > bundle.log 2>&1
fi

# create source zip
cpack -G TGZ --config CPackSourceConfig.cmake > s-tgz.log 2>&1

