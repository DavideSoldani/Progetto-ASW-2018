#! /bin/bash
cd /home/asw/dev-git
git clone --bare dev-git.bundle ./.git
echo "[DEV-GIT] Repository restored. Available at ssh://vagrant@192.168.0.160/asw/dev-git/.git"