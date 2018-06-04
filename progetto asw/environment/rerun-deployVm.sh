#! /bin/bash

vagrant destroy deployVm -f
vagrant up deployVm --parallel
vagrant ssh deployVm