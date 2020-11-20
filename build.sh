#!/bin/bash

# 2 default branches & modular, feel free to add new branches

# theres a predefined cpp title but you can add more like 
# cppTitle2="thingy" and make new commands using it
# env variables :

prjctTitle="hashtest"
cppTitle="hashtest"
objDir="obj"
relDir="rel"
debDir="deb"

# edit the compiler flags accordingly 
# add new cpp files to link by hand
# move them by hand also

if [ "$1" = "debug" ]; then

# Keep the 2&>/dev/null
echo "Build \"Debug\" started"
mkdir "$objDir" 2>/dev/null
mkdir "$debDir" 2>/dev/null

# compilation of the cpp files
# not required to be in order
g++ -Wall -g -c ./"$cppTitle".cpp

# moving the translation units to ./obj/name
# new cpp files generate new translation units
# make new mv commands for them also
mv ./"$cppTitle".o ./"$objDir"/"$cppTitle".o

# while linking you have to link the cpp file containing the main
# function first
g++ -Wall -g -o ./"$prjctTitle" ./"$objDir"/"$cppTitle".o

# not needed only for caution, as while compiling
# the program automatically gets executable privileges
chmod u+x ./"$prjctTitle"

# saying the build is done, may not work on wsl for the sleep fucntion 
echo "Build done"

# moving to release/name
echo "Moving binary to ./"$debDir"/"$prjctTitle""

# moving the thingy
mv ./"$prjctTitle" ./"$debDir"/"$prjctTitle"

# say moved
echo "Moved."

# how to run it :
echo "Run using ./"$debDir"/"$prjctTitle""

elif [ "$1" = "release" ]; then

# Keep the 2&>/dev/null
echo "Build \"Release\" started"
mkdir "$objDir" 2>/dev/null
mkdir "$relDir" 2>/dev/null

# compilation of the cpp files
# not required to be in order
g++ -O3 -c ./"$cppTitle".cpp -o ./"$cppTitle"rel.o

# moving the translation units to ./obj/name
# new cpp files generate new translation units
# make new mv commands for them also
mv ./"$cppTitle"rel.o ./"$objDir"/"$cppTitle"rel.o

# while linking you have to link the cpp file containing the main
# function first
g++ -O3 -o ./"$prjctTitle"rel ./"$objDir"/"$cppTitle"rel.o

# announce that the build is done
echo "Build done."

# not needed only for caution, as while compiling
# the program automatically gets executable privileges
chmod u+x ./"$prjctTitle"rel

# moving to ./release/name
echo "Moving binary to ./"$relDir"/"$prjctTitle""

# doing the mv
mv ./"$prjctTitle"rel ./"$relDir"/"$prjctTitle"

# say it got moved
echo "Moved."

# saying the stripping is done
echo "Stripping the program..."

# stripping the program
strip ./"$relDir"/"$prjctTitle"

# announce  that stripping the program is done and how to run the program
echo "Stripping done, run with ./"$relDir"/"$prjctTitle""

else

	echo "Use ./build.sh debug or ./build.sh release"

fi
