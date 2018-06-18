#! /bin/bash

cat /home/vagrant/.ssh/authorized_keys >> /home/asw/_shared/ssh/dev-key
echo "[DEV-SSH] Key copied to shared dir. Available at /home/asw/_shared/ssh/dev-key"