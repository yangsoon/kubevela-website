#!/bin/bash

cd kubevela.io
echo "1. git config set"
git config --global user.email "kubevela.bot@aliyun.com"
git config --global user.name "kubevela-bot"
echo "2. git commit local change"
git add . && git commit -m "init"
echo "3. git checkout main and update repo"
git checkout main
git pull
echo "4. git checkout dev and rebase main"
git checkout dev
git rebase main

while getopts "t:" arg 
do
        case $arg in
             t)
                if [ $OPTARG == "start" ];
                then
                    echo "5. start docs"
                    yarn install && yarn start --host 0.0.0.0 --port 3000
                fi

                if [ $OPTARG == "build" ];
                then
                    echo "5. build docs"
                    yarn install && yarn run build
                fi
                ;;                
             ?) 
                echo "unkonw argument"
                exit 1
            ;;
        esac
done


