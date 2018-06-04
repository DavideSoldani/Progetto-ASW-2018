#! /bin/bash

vagrant destroy devVm -f
vagrant up devVm --parallel
vagrant ssh devVm