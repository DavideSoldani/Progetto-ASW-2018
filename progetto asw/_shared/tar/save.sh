#! /bin/bash
# DIR=/home/asw/dev-git

cd /home/asw/dev-git

sudo tar -czvWf /home/asw/_shared/tar/dev-git.tar.gz .??*
echo "[DEV-GIT] Repository state saved in dev-git.tar.gz"

if [ -d .git/ ] 
	then
		sudo chmod -R 777 .git/
		sudo rm -rf .git/
fi
echo "[DEV-GIT] Workspace cleaned. Files available at ../_shared/tar/"