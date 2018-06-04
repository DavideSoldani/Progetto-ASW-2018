#! /bin/bash

vagrant destroy jenkinsVm -f
vagrant up jenkinsVm --parallel
vagrant ssh jenkinsVm