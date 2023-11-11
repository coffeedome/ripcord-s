#!/bin/bash
########################################################################
# Descriptio
# Script Name: start.sh
# Description: Brings different resources together to make it easy to 
# create a Typescript lambda function that uses AWS Lambda Powertools, 
# VSCode debugging setup, integration testing, unit testing, and deployment.
# Author: Esteban Escobar
# Created: November 11, 2023
#
# Copyright (c) 2023 Esteban Escobar
########################################################################
#CONSTANTS
LICENSES_URL="https://raw.githubusercontent.com/spdx/license-list-data/main/json/licenses.json"
PWTOOLS_REPO_URL="https://api.github.com/repos/aws-powertools/powertools-lambda-typescript"
main() {
    echo "Enter project name..."
    read -r PROJECT_NAME
    if [ -z $PROJECT_NAME ];then
        echo "PROJECT_NAME cannot be empty..."
    elif [ -d $PROJECT_NAME ];then
        echo "./$PROJECT_NAME project already exists." && exit 1
    fi

    echo "Enter project description..."
    read -r PROJECT_DESCRIPTION

    if [ -z "$PROJECT_DESCRIPTION" ];then
        echo "PROJECT_DESCRIPTION cannot be empty..." && exit 1
    fi

    mkdir "$PROJECT_NAME" || exit 1
    cd "$PROJECT_NAME" || exit 1

    download
}

download(){
    echo "Fetching latest version of TS Powertools project..."

    LATEST_PWTOOLS_RELEASE_OBJ=$(curl "${PWTOOLS_REPO_URL}/releases/latest")
    LATEST_PWTOOLS_RELEASE_ID=$(echo $LATEST_PWTOOLS_RELEASE_OBJ | jq -r .id)
    LATEST_PWTOOLS_RELEASE_TAG_NAME=$(echo $LATEST_PWTOOLS_RELEASE_OBJ | jq -r .tag_name)
    LATEST_PWTOOLS_RELEASE_TARBALL=$(echo $LATEST_PWTOOLS_RELEASE_OBJ | jq -r .tarball_url)

    echo "Downloading latest version $LATEST_PWTOOLS_RELEASE_TAG_NAME"

    mkdir -p staging && curl -L -o staging/package.tar.gz $LATEST_PWTOOLS_RELEASE_TARBALL
    cd staging && tar -xzf package.tar.gz
    cp -a aws-*/examples/sam/* ..
}

main




