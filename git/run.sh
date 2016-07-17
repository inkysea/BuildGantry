#!/bin/sh

if [ -d "$TARGET_DIR" ]; then
    cd $TARGET_DIR
else
	echo "Error: Directory not found: $BUILD_DIR"
	exit 1
fi

if [ -e $GIT_REPO ]
then
    git clone $GIT_REPO
else
	echo "Error: Git repo no defined. "
	exit 1
fi
