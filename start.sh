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
PWTOOLS_REPO_URL="https://github.com/aws-powertools/powertools-lambda-typescript.git"
echo "Enter project name..."
read -r PROJECT_NAME
if [ -z $PROJECT_NAME];then
    echo "PROJECT_NAME cannot be empty..."
fi

echo "Enter project description...[default project description]"
read -r PROJECT_DESCRIPTION

if [ -z $PROJECT_DESCRIPTION];then
    echo "PROJECT_DESCRIPTION cannot be empty..."
fi




mkdir "$PROJECT_NAME" || echo "$PROJECT_NAME project already exists in your directory" && exit 1;

cd "$PROJECT_NAME" || exit 1

npm i typescript --sa



