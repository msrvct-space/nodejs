#!/bin/bash
#


source script/common.sh
source script/install.sh
source script/remove.sh


case $1 in
    install)
        install &> /dev/null && echo "install is successed" || echo "install is failed"
    ;;
    remove)
        remove &> /dev/null && echo "remove is successed" || echo "remove is failed"
    ;;
    *)
        echo "please choose the option: install|remove"
    ;;
esac