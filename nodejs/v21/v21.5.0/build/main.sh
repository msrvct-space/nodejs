#!/bin/bash
#
source build.sh

function main(){
    BASE_PATH=${PWD}
    get_system_info
    get_nodejs_package "v21.5.0"
    get_install_tool "v0.0.2"
}
main
