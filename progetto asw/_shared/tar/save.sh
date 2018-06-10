#! /bin/bash
# DIR=/home/asw/dev-git

cd /home/asw/dev-git

sudo tar -cWf /home/asw/_shared/tar/dev-git.tar.??*
echo "[DEV-GIT] Repository state saved in dev-git.tar"

if [ -d .git/ ] 
	then
		sudo chmod -R 777 .git/
		sudo rm -rf .git/
fi
echo "[DEV-GIT] Workspace cleaned. Files available at ../_shared/tar/"