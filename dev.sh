#!/bin/bash

git config --global user.email "kubevela.bot@aliyun.com"
git config --global user.name "kubevela-bot"

echo "update kubevela.io"
cd kubevela.io
git config core.sparsecheckout true
git remote add origin https://github.com/oam-dev/kubevela.io.git
echo "*" >> .git/info/sparse-checkout
echo "!/docs/**" >> .git/info/sparse-checkout
echo "!/sidebars.js" >> .git/info/sparse-checkout
git pull origin main

while getopts "t:" arg 
do
        case $arg in
             t)
                if [ $OPTARG == "start" ];
                then
                    echo "start docs"
                    yarn install && yarn start --host 0.0.0.0 --port 3000
                fi

                if [ $OPTARG == "build" ];
                then
                    echo "build docs"
                    yarn install && yarn run build
                fi
                ;;                
             ?) 
                echo "unkonw argument"
                exit 1
            ;;
        esac
done


