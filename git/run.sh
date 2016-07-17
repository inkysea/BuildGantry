#!/bin/sh

if [ -d "$TARGET_DIR" ]; then
    cd $TARGET_DIR
else
	echo "Error: Directory not found: $TARGET_DIR"
	exit 1
fi

if [ ! -z  "$GIT_REPO" ]
then
    git clone $GIT_REPO
else
	echo "Error: GIT_REPO no defined. "
	exit 1
fi
