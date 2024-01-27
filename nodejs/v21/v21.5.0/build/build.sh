#!/bin/bash
#
function get_system_info() {
    KERNEL=$(uname -s)
    LOWER_KERNEL=$(echo ${KERNEL} | tr '[:upper:]' '[:lower:]')
    ARCH=$(uname -m)
    case ${ARCH} in
    "x86_64")
        LIKE_ARCH="amd64"
        SHORT_ARCH="x64"
        ;;
    "aarch64")
        LIKE_ARCH="arm64"
        SHORT_ARCH="arm64"
        ;;
    *)
        echo "Unsupported arch: ${ARCH}"
        exit 1
        ;;
    esac
}
function get_install_tool() {
    TOOL_VERSION=$1
    TOOL_NAME="msrvct-exec"
    PACK_TYPE="bin"
    WORK_PATH=${BASE_PATH}/${PACK_TYPE}
    mkdir -p ${WORK_PATH} && cd ${WORK_PATH}
    CURRENT_ARCH=${ARCH}
    if [ "${CURRENT_ARCH}" == "aarch64" ]; then
        CURRENT_ARCH="arm64"
    fi
    TOOL_PKG="${TOOL_NAME}_${KERNEL}_${CURRENT_ARCH}.tar.gz"
    TOOL_URL="https://github.com/devops-toolbox/${TOOL_NAME}/releases/download/${TOOL_VERSION}/${TOOL_PKG}"
    curl -L -k -v -o ${TOOL_PKG} ${TOOL_URL}
    tar -xvf ${TOOL_PKG} ${TOOL_NAME}
    rm -rf ${TOOL_PKG}
}

function get_nodejs_package(){
    VERSION=$1
    NAME="node"
    FULL_NAME="nodejs"
    PACK_TYPE="pkg"
    WORK_PATH=${BASE_PATH}/${PACK_TYPE}
    mkdir -p ${WORK_PATH} && cd ${WORK_PATH}
    NODEJS_PKG="${NAME}-${VERSION}-${LOWER_KERNEL}-${SHORT_ARCH}.tar.xz"
    NODEJS_URL="https://nodejs.org/dist/${VERSION}/${NODEJS_PKG}"
    PACK_LIST="${NODEJS_URL}"
    apt-get update -y && apt-get install curl -y
    for p in ${PACK_LIST}; do
        echo ${p}
        curl -L -k -v -o $(basename ${p}) ${p}
    done
}