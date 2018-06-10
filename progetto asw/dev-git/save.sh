#! /bin/bash
cd /home/asw/dev-git
# if [ -a dev-git.bundle ]
# 	then
# 		sudo rm dev-git.bundle
# fi
git bundle create dev-git.bundle --all
git bundle verify dev-git.bundle
echo "[DEV-GIT] Repository state saved in dev-git.bundle"

if [ -d .git/ ] 
	then
		sudo chmod -R 777 .git/
		sudo rm -rf .git/
fi
echo "[DEV-GIT] Workspace cleaned. Files available in dev-git.bundle"