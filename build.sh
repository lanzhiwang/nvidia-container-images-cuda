#!/bin/bash

# 参考 README.md
# ./build.sh \
# -d \
# --image-name my-remote-container-registry/cuda \
# --cuda-version 11.6.0 \
# --os ubuntu \
# --os-version 18.04 \
# --arch x86_64,arm64 \
# --push

set -euo pipefail

#
# This script requires buildkit: https://docs.docker.com/buildx/working-with-buildx/
#
CUDA_IMAGE="nvcr.io/nvidia/cuda" # CUDA_IMAGE: nvcr.io/nvidia/cuda
LIBGLVND_VERSION="v1.2.0"        # LIBGLVND_VERSION: v1.2.0

IMAGE_NAME=""                                     # IMAGE_NAME:
CGL_INTER_IMAGE_NAME_SUFFIX="/build-intermediate" # CGL_INTER_IMAGE_NAME_SUFFIX: /build-intermediate
CUDA_VERSION=""                                   # CUDA_VERSION:
OS=""                                             # OS:
OS_VERSION=""                                     # OS_VERSION:
OS_PATH_NAME=""                                   # OS_PATH_NAME:
ARCHES=""                                         # ARCHES:
LOAD_ARG=""                                       # LOAD_ARG:
PUSH_ARG=""                                       # PUSH_ARG:
BASE_PATH=""                                      # BASE_PATH:
IMAGE_SUFFIX=""                                   # IMAGE_SUFFIX:

args=("$@")
# args: -d --image-name my-remote-container-registry/cuda --cuda-version 11.6.0 --os ubuntu --os-version 18.04 --arch x86_64,arm64 --push

script_name=$(basename $0) # script_name: build.sh
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# script_dir: /Users/huzhi/work/code/go_code/ai/gpu/nvidia/container-images/cuda

run_cmd_output="" # run_cmd_output:
run_cmd_return=0  # run_cmd_return: 0
debug_flag=0      # debug_flag: 0
dry_run=0         # dry_run: 0
use_kitpick=0     # use_kitpick: 0
build_cudagl=0    # build_cudagl: 0

# echo "CUDA_IMAGE: "${CUDA_IMAGE}
# echo "LIBGLVND_VERSION: "${LIBGLVND_VERSION}
# echo "IMAGE_NAME: "${IMAGE_NAME}
# echo "CGL_INTER_IMAGE_NAME_SUFFIX: "${CGL_INTER_IMAGE_NAME_SUFFIX}
# echo "CUDA_VERSION: "${CUDA_VERSION}
# echo "OS: "${OS}
# echo "OS_VERSION: "${OS_VERSION}
# echo "OS_PATH_NAME: "${OS_PATH_NAME}
# echo "ARCHES: "${ARCHES}
# echo "LOAD_ARG: "${LOAD_ARG}
# echo "PUSH_ARG: "${PUSH_ARG}
# echo "BASE_PATH: "${BASE_PATH}
# echo "IMAGE_SUFFIX: "${IMAGE_SUFFIX}
# echo "args: "${args[@]}
# echo "script_name: "${script_name}
# echo "script_dir: "${script_dir}
# echo "run_cmd_output: "${run_cmd_output}
# echo "run_cmd_return: "${run_cmd_return}
# echo "debug_flag: "${debug_flag}
# echo "dry_run: "${dry_run}
# echo "use_kitpick: "${use_kitpick}
# echo "build_cudagl: "${build_cudagl}

# echo "\$0: "$0                        # $0: ./build.sh
# echo "\$@: "$@                        # $@: -d --image-name my-remote-container-registry/cuda --cuda-version 11.6.0 --os ubuntu --os-version 18.04 --arch x86_64,arm64 --push
# echo "BASH_SOURCE: "${BASH_SOURCE[@]} # BASH_SOURCE: ./build.sh
# echo "BASH_LINENO: "${BASH_LINENO[@]} # BASH_LINENO: 0
# echo "#args[@]: "${#args[@]}          # #args[@]: 12

err() {
    local mesg=$1
    shift
    printf "ERROR: $(basename ${BASH_SOURCE[${SOURCE_LINE_OVERRIDE:-1}]})#${BASH_LINENO[${BASH_LINE_OVERRIDE:-0}]} ${mesg}\n\n" "$mesg" 1>&2
    if [[ $# -gt 0 ]]; then
        printf '%s ' "${@}" 1>&2
        printf '\n\n'
    fi
    exit 1
}

msg() {
    local mesg=$1
    shift
    printf ">>> $(basename ${BASH_SOURCE[1]})#${BASH_LINENO[0]} %s\n\n" "$mesg"
    if [[ $# -gt 0 ]]; then
        printf '%s ' "${@}"
        printf '\n\n'
    fi
}

debug() {
    # $1: The message to print.
    if [[ ${debug_flag} -eq 1 ]]; then
        local mesg=$1
        shift
        printf "%s\n\n" "### DEBUG: $(basename ${BASH_SOURCE[${SOURCE_LINE_OVERRIDE:-1}]})#${BASH_LINENO[${BASH_LINE_OVERRIDE:-0}]} ${mesg}" 1>&2
        if [[ $# -gt 0 ]]; then
            printf '%s ' "${@}" 1>&2
            printf '\n\n'
        fi
    fi
}

warning() {
    local mesg=$1
    shift
    printf "WARNING: $(basename ${BASH_SOURCE[${SOURCE_LINE_OVERRIDE:-1}]})#${BASH_LINENO[${BASH_LINE_OVERRIDE:-0}]} ${mesg}\n\n" "$mesg" 1>&2
    if [[ $# -gt 0 ]]; then
        printf '%s ' "${@}" 1>&2
        printf '\n\n'
    fi
}

norun() {
    local mesg=$1
    shift
    printf "XXXX NORUN: $(basename ${BASH_SOURCE[${SOURCE_LINE_OVERRIDE:-1}]})#${BASH_LINENO[${BASH_LINE_OVERRIDE:-0}]} ${mesg}\n\n" "$mesg"
    if [[ $# -gt 0 ]]; then
        printf '%s ' "$@"
        printf '\n\n'
    fi
}

git_clone_pull() {
    # $1 path
    # $2 repo
    # $3 branch
    ORIG=$(pwd)
    debug "git_clone_pull: \$1: $1, \$2: $2"
    if [[ -d "$1" ]]; then
        cd "$1"
        msg "Pulling $2 into $PWD"
        # careful!
        # run_cmd "git reset --hard HEAD"
        run_cmd "git pull --all"
        run_cmd "git checkout ${OS}${OS_VERSION}"
    else
        msg "Cloning into $PWD"
        run_cmd "git clone --branch=${OS}${OS_VERSION} $2 $1"
    fi
    cd $ORIG
}

usage() {
    echo "${script_name} - Cuda Image Build Helper"
    echo
    echo "Usage: ${script_name} [options]"
    echo
    echo "OPTIONS"
    echo
    echo "    -h, --help            - Show this message."
    echo "    -n, --dry-run         - Show commands but don't do anything."
    echo "    -d, --debug           - Show debug output."
    ## TODO: allow the user to pass arguments to docker buildx
    echo "    --load                - Load the images on the build host. (Out of the docker cache)."
    echo "    --push                - Push the images to the remote repository."
    echo "    --image-name=str      - The image name to use. Default: nvcr.io/nvidia/cuda"
    echo "    --cuda-version=str    - The cuda version to use."
    echo "    --os=str              - The target operating system."
    echo "    --arch=csv            - Target architectures as a comma separated string."
    echo "    --kitpick             - Build from the kitpick directory."
    echo "    --cudagl              - Build a cudagl image set. x86_64 only."
    echo
    exit 155
}

# Runs a command. Output is not captured
# To use this function, define the following in your calling script:
# run_cmd_return=""
run_cmd() {
    run_cmd_return=0
    run_cmd_return=0
    # $@: The command and args to run
    if [[ ${dry_run} -eq 1 ]]; then
        SOURCE_LINE_OVERRIDE=2 BASH_LINE_OVERRIDE=1 norun "CMD:" "$@"
    else
        printf "%s\n\n" "$(basename ${BASH_SOURCE[${SOURCE_LINE_OVERRIDE:-1}]})#${BASH_LINENO[${BASH_LINE_OVERRIDE:-0}]} Running command:"
        printf "%s " "${@}"
        printf "\n\n"
        printf "Output: \n\n"
        echo -e "$@" | source /dev/stdin
        run_cmd_return=$?
        echo
        printf "Command returned: %s\n\n" "${run_cmd_return}"
        return $run_cmd_return
    fi
}

if [[ ${#args[@]} -eq 0 ]]; then
    echo
    err "No arguments specified!"
    usage
fi

check_vars() {
    if [[ -z ${CUDA_VERSION} ]]; then
        err "CUDA_VERSION argument not set!"
    elif [[ -z ${ARCHES} ]]; then
        err "ARCHES argument not set!"
    elif [[ -z ${OS} ]]; then
        err "OS argument not set!"
    elif [[ -z ${OS_VERSION} ]]; then
        err "OS_VERSION argument not set!"
    fi
    OS_PATH_NAME="${OS}${OS_VERSION}"
    if [[ "${OS_VERSION}" =~ .*\..* ]]; then
        # delete the dot in os string
        msg "Setting OS_PATH_NAME to '${OS}${OS_VERSION//./}'"
        OS_PATH_NAME="${OS}${OS_VERSION//./}"
        debug "OS_PATH_NAME: ${OS_PATH_NAME}"
    fi
    PLATFORM_ARG=$(
        printf '%s ' '--platform'
        for var in $(echo $ARCHES | sed "s/,/ /g"); do printf 'linux/%s,' "$var"; done | sed 's/,*$//g'
    )
    if [[ "${PLATFORM_ARG}" =~ .*,.* ]]; then
        warning "Multiple platforms detected, removing '--load' argument from docker build... (https://github.com/docker/buildx/issues/59)"
        warning "Try doing one platform at a time as a workaround..."
        LOAD_ARG=""
    fi
    if [[ ${use_kitpick} -eq 1 ]]; then
        BASE_PATH="kitpick"
        IMAGE_SUFFIX=$(grep -oP "(?<=base-${OS}${OS_VERSION}-).*(?=\ as\ base)" "kitpick/${OS_PATH_NAME}/runtime/Dockerfile")
        debug "IMAGE_SUFFIX: '${IMAGE_SUFFIX}'"
    else
        BASE_PATH="dist/${CUDA_VERSION}"
    fi
}

main() {
    printf "\n"
    msg "${script_name} START"

    for ((a = 0; a < ${#args[@]}; a++)); do
        if [[ ${args[$a]} == "-h" ]] || [[ ${args[$a]} == "--help" ]]; then
            usage
        elif [[ ${args[$a]} == "-n" ]] || [[ ${args[$a]} == "--dry-run" ]]; then
            debug "found arg 'dry-run'"
            dry_run=1
        elif [[ ${args[$a]} == "-d" ]] || [[ ${args[$a]} == "--debug" ]]; then
            debug "found arg 'debug'"
            debug_flag=1
        elif [[ ${args[$a]} == "--load" ]]; then
            debug "found command '${args[$a]}'"
            LOAD_ARG=${args[$a]}
        elif [[ ${args[$a]} == "--push" ]]; then
            debug "found command '${args[$a]}'"
            PUSH_ARG=${args[$a]}
        elif [[ ${args[$a]} == "--kitpick" ]]; then
            debug "found command '${args[$a]}'"
            use_kitpick=1
        elif [[ ${args[$a]} == "--cudagl" ]]; then
            debug "found command '${args[$a]}'"
            build_cudagl=1
        elif [[ ${args[$a]} == "--image-name" ]]; then
            debug "found command '${args[$a]}'"
            IMAGE_NAME=${args[(($a + 1))]}
            debug "IMAGE_NAME=${IMAGE_NAME}"
            ((a = a + 1))
        elif [[ ${args[$a]} == "--cuda-version" ]]; then
            debug "found command '${args[$a]}'"
            CUDA_VERSION=${args[(($a + 1))]}
            debug "CUDA_VERSION=${CUDA_VERSION}"
            ((a = a + 1))
        elif [[ ${args[$a]} == "--os" ]]; then
            debug "found command '${args[$a]}'"
            OS=${args[(($a + 1))]}
            debug "OS=${OS}"
            ((a = a + 1))
        elif [[ ${args[$a]} == "--os-version" ]]; then
            debug "found command '${args[$a]}'"
            OS_VERSION=${args[(($a + 1))]}
            debug "OS_VERSION=${OS_VERSION}"
            ((a = a + 1))
        elif [[ ${args[$a]} == "--arch" ]]; then
            debug "found command '${args[$a]}'"
            ARCHES=${args[(($a + 1))]}
            debug "ARCHES=${ARCHES}"
            ((a = a + 1))
        else
            err "Unknown argument '${args[$a]}'!"
            usage
        fi
    done
    # echo "CUDA_IMAGE: "${CUDA_IMAGE}
    # echo "LIBGLVND_VERSION: "${LIBGLVND_VERSION}
    # echo "IMAGE_NAME: "${IMAGE_NAME}
    # echo "CGL_INTER_IMAGE_NAME_SUFFIX: "${CGL_INTER_IMAGE_NAME_SUFFIX}
    # echo "CUDA_VERSION: "${CUDA_VERSION}
    # echo "OS: "${OS}
    # echo "OS_VERSION: "${OS_VERSION}
    # echo "OS_PATH_NAME: "${OS_PATH_NAME}
    # echo "ARCHES: "${ARCHES}
    # echo "LOAD_ARG: "${LOAD_ARG}
    # echo "PUSH_ARG: "${PUSH_ARG}
    # echo "BASE_PATH: "${BASE_PATH}
    # echo "IMAGE_SUFFIX: "${IMAGE_SUFFIX}
    # echo "args: "${args[@]}
    # echo "script_name: "${script_name}
    # echo "script_dir: "${script_dir}
    # echo "run_cmd_output: "${run_cmd_output}
    # echo "run_cmd_return: "${run_cmd_return}
    # echo "debug_flag: "${debug_flag}
    # echo "dry_run: "${dry_run}
    # echo "use_kitpick: "${use_kitpick}
    # echo "build_cudagl: "${build_cudagl}
    # CUDA_IMAGE: nvcr.io/nvidia/cuda
    # LIBGLVND_VERSION: v1.2.0
    # IMAGE_NAME: my-remote-container-registry/cuda
    # CGL_INTER_IMAGE_NAME_SUFFIX: /build-intermediate
    # CUDA_VERSION: 11.6.0
    # OS: ubuntu
    # OS_VERSION: 18.04
    # OS_PATH_NAME:
    # ARCHES: x86_64,arm64
    # LOAD_ARG:
    # PUSH_ARG: --push
    # BASE_PATH:
    # IMAGE_SUFFIX:
    # args: -d --image-name my-remote-container-registry/cuda --cuda-version 11.6.0 --os ubuntu --os-version 18.04 --arch x86_64,arm64 --push
    # script_name: build.sh
    # script_dir: /Users/huzhi/work/code/go_code/ai/gpu/nvidia/container-images/cuda
    # run_cmd_output:
    # run_cmd_return: 0
    # debug_flag: 1
    # dry_run: 0
    # use_kitpick: 0
    # build_cudagl: 0

    check_vars
    # echo "CUDA_IMAGE: "${CUDA_IMAGE}
    # echo "LIBGLVND_VERSION: "${LIBGLVND_VERSION}
    # echo "IMAGE_NAME: "${IMAGE_NAME}
    # echo "CGL_INTER_IMAGE_NAME_SUFFIX: "${CGL_INTER_IMAGE_NAME_SUFFIX}
    # echo "CUDA_VERSION: "${CUDA_VERSION}
    # echo "OS: "${OS}
    # echo "OS_VERSION: "${OS_VERSION}
    # echo "OS_PATH_NAME: "${OS_PATH_NAME}
    # echo "ARCHES: "${ARCHES}
    # echo "LOAD_ARG: "${LOAD_ARG}
    # echo "PUSH_ARG: "${PUSH_ARG}
    # echo "BASE_PATH: "${BASE_PATH}
    # echo "IMAGE_SUFFIX: "${IMAGE_SUFFIX}
    # echo "args: "${args[@]}
    # echo "script_name: "${script_name}
    # echo "script_dir: "${script_dir}
    # echo "run_cmd_output: "${run_cmd_output}
    # echo "run_cmd_return: "${run_cmd_return}
    # echo "debug_flag: "${debug_flag}
    # echo "dry_run: "${dry_run}
    # echo "use_kitpick: "${use_kitpick}
    # echo "build_cudagl: "${build_cudagl}
    # echo "PLATFORM_ARG: "${PLATFORM_ARG}
    # CUDA_IMAGE: nvcr.io/nvidia/cuda
    # LIBGLVND_VERSION: v1.2.0
    # IMAGE_NAME: my-remote-container-registry/cuda
    # CGL_INTER_IMAGE_NAME_SUFFIX: /build-intermediate
    # CUDA_VERSION: 11.6.0
    # OS: ubuntu
    # OS_VERSION: 18.04
    # OS_PATH_NAME: ubuntu1804
    # ARCHES: x86_64,arm64
    # LOAD_ARG:
    # PUSH_ARG: --push
    # BASE_PATH: dist/11.6.0
    # IMAGE_SUFFIX:
    # args: -d --image-name my-remote-container-registry/cuda --cuda-version 11.6.0 --os ubuntu --os-version 18.04 --arch x86_64,arm64 --push
    # script_name: build.sh
    # script_dir: /Users/huzhi/work/code/go_code/ai/gpu/nvidia/container-images/cuda
    # run_cmd_output:
    # run_cmd_return: 0
    # debug_flag: 1
    # dry_run: 0
    # use_kitpick: 0
    # build_cudagl: 0
    # PLATFORM_ARG: --platform linux/x86_64,linux/arm64

    # ubuntu 22.04 build require moby/buildkit version greater than 0.8.1
    if ! docker buildx inspect cuda; then
        run_cmd docker buildx create --use --platform linux/x86_64,linux/arm64,linux/ppc64le --driver-opt image=moby/buildkit:v0.10.3 --name cuda --node cuda
        # docker buildx create --use --platform linux/x86_64,linux/arm64,linux/ppc64le --driver-opt image=moby/buildkit:v0.10.3 --name cuda --node cuda
    fi

    if [[ ${build_cudagl} -eq 0 ]]; then

        run_cmd cp NGC-DL-CONTAINER-LICENSE ${BASE_PATH}/${OS_PATH_NAME}/base/
        # cp NGC-DL-CONTAINER-LICENSE dist/11.6.0/ubuntu1804/base/

        run_cmd cp -R entrypoint.d nvidia_entrypoint.sh ${BASE_PATH}/${OS_PATH_NAME}/runtime/
        # cp -R entrypoint.d nvidia_entrypoint.sh dist/11.6.0/ubuntu1804/runtime/

        run_cmd docker buildx build --pull ${LOAD_ARG} ${PUSH_ARG} ${PLATFORM_ARG} \
            -t "${IMAGE_NAME}:${CUDA_VERSION}-base-${OS}${OS_VERSION}${IMAGE_SUFFIX:+-${IMAGE_SUFFIX}}" \
            "${BASE_PATH}/${OS_PATH_NAME}/base"
        # docker buildx build --pull --push --platform linux/x86_64,linux/arm64 -t my-remote-container-registry/cuda:11.6.0-base-ubuntu18.04 dist/11.6.0/ubuntu1804/base

        run_cmd docker buildx build --pull ${LOAD_ARG} ${PUSH_ARG} ${PLATFORM_ARG} \
            -t "${IMAGE_NAME}:${CUDA_VERSION}-runtime-${OS}${OS_VERSION}${IMAGE_SUFFIX:+-${IMAGE_SUFFIX}}" \
            --build-arg "IMAGE_NAME=${IMAGE_NAME}" \
            "${BASE_PATH}/${OS_PATH_NAME}/runtime"
        # docker buildx build --pull --push --platform linux/x86_64,linux/arm64 -t my-remote-container-registry/cuda:11.6.0-runtime-ubuntu18.04 --build-arg IMAGE_NAME=my-remote-container-registry/cuda dist/11.6.0/ubuntu1804/runtime

        run_cmd docker buildx build --pull ${LOAD_ARG} ${PUSH_ARG} ${PLATFORM_ARG} \
            -t "${IMAGE_NAME}:${CUDA_VERSION}-devel-${OS}${OS_VERSION}${IMAGE_SUFFIX:+-${IMAGE_SUFFIX}}" \
            --build-arg "IMAGE_NAME=${IMAGE_NAME}" \
            "${BASE_PATH}/${OS_PATH_NAME}/devel"
        # docker buildx build --pull --push --platform linux/x86_64,linux/arm64 -t my-remote-container-registry/cuda:11.6.0-devel-ubuntu18.04 --build-arg IMAGE_NAME=my-remote-container-registry/cuda dist/11.6.0/ubuntu1804/devel

        msg "${script_name} END"
    else

        # cudagl base is cuda:x.y-base + opengl:x.y-glvnd-devel
        # TODO: CHECK BRANCH NAME EXISTS
        git_clone_pull opengl https://gitlab.com/nvidia/container-images/opengl.git ${OS}${OS_VERSION}
        # git clone --branch=ubuntu18.04 https://gitlab.com/nvidia/container-images/opengl.git opengl

        run_cmd cp NGC-DL-CONTAINER-LICENSE opengl/base/
        # cp NGC-DL-CONTAINER-LICENSE opengl/base/

        # run_cmd cp -R entrypoint.d nvidia_entrypoint.sh ${BASE_PATH}/${OS_PATH_NAME}/runtime/

        CGL_INTER_IMAGE_NAME="${IMAGE_NAME}${CGL_INTER_IMAGE_NAME_SUFFIX}"
        # echo "CGL_INTER_IMAGE_NAME: "${CGL_INTER_IMAGE_NAME}
        # CGL_INTER_IMAGE_NAME: my-remote-container-registry/cuda/build-intermediate
        debug "CGL_INTER_IMAGE_NAME=${CGL_INTER_IMAGE_NAME}"

        run_cmd docker build -t "${CGL_INTER_IMAGE_NAME}:${CUDA_VERSION}-base-base-${OS}${OS_VERSION}" \
            --build-arg "from=${CUDA_IMAGE}:${CUDA_VERSION}-base-${OS}${OS_VERSION}${IMAGE_SUFFIX:+-${IMAGE_SUFFIX}}" \
            "opengl/base"
        # docker build -t my-remote-container-registry/cuda/build-intermediate:11.6.0-base-base-ubuntu18.04 --build-arg from=nvcr.io/nvidia/cuda:11.6.0-base-ubuntu18.04 opengl/base

        run_cmd docker build -t "${CGL_INTER_IMAGE_NAME}:${CUDA_VERSION}-base-runtime-${OS}${OS_VERSION}" \
            --build-arg "from=${CGL_INTER_IMAGE_NAME}:${CUDA_VERSION}-base-base-${OS}${OS_VERSION}" \
            --build-arg "LIBGLVND_VERSION=${LIBGLVND_VERSION}" \
            "opengl/glvnd/runtime"
        # docker build -t my-remote-container-registry/cuda/build-intermediate:11.6.0-base-runtime-ubuntu18.04 --build-arg from=my-remote-container-registry/cuda/build-intermediate:11.6.0-base-base-ubuntu18.04 --build-arg LIBGLVND_VERSION=v1.2.0 opengl/glvnd/runtime

        run_cmd docker build -t "${IMAGE_NAME}:${CUDA_VERSION}-base-${OS}${OS_VERSION}" \
            --build-arg "from=${CGL_INTER_IMAGE_NAME}:${CUDA_VERSION}-base-runtime-${OS}${OS_VERSION}" \
            "opengl/glvnd/devel"
        # docker build -t my-remote-container-registry/cuda:11.6.0-base-ubuntu18.04 --build-arg from=my-remote-container-registry/cuda/build-intermediate:11.6.0-base-runtime-ubuntu18.04 opengl/glvnd/devel

        # cudagl runtime is cuda:x.y-runtime + opengl:x.y-glvnd-runtime
        run_cmd docker build -t "${CGL_INTER_IMAGE_NAME}:${CUDA_VERSION}-runtime-base-${OS}${OS_VERSION}" \
            --build-arg "from=${CUDA_IMAGE}:${CUDA_VERSION}-runtime-${OS}${OS_VERSION}${IMAGE_SUFFIX:+-${IMAGE_SUFFIX}}" \
            "opengl/base"
        # docker build -t my-remote-container-registry/cuda/build-intermediate:11.6.0-runtime-base-ubuntu18.04 --build-arg from=nvcr.io/nvidia/cuda:11.6.0-runtime-ubuntu18.04 opengl/base

        run_cmd docker build -t "${IMAGE_NAME}:${CUDA_VERSION}-runtime-${OS}${OS_VERSION}" \
            --build-arg "from=${CGL_INTER_IMAGE_NAME}:${CUDA_VERSION}-runtime-base-${OS}${OS_VERSION}" \
            --build-arg "LIBGLVND_VERSION=${LIBGLVND_VERSION}" \
            "opengl/glvnd/runtime"
        # docker build -t my-remote-container-registry/cuda:11.6.0-runtime-ubuntu18.04 --build-arg from=my-remote-container-registry/cuda/build-intermediate:11.6.0-runtime-base-ubuntu18.04 --build-arg LIBGLVND_VERSION=v1.2.0 opengl/glvnd/runtime

        # cudagl devel is cuda:x.y-devel + opengl:x.y-glvnd-devel
        run_cmd docker build -t "${CGL_INTER_IMAGE_NAME}:${CUDA_VERSION}-devel-base-${OS}${OS_VERSION}" \
            --build-arg "from=${CUDA_IMAGE}:${CUDA_VERSION}-devel-${OS}${OS_VERSION}${IMAGE_SUFFIX:+-${IMAGE_SUFFIX}}" \
            "opengl/base"
        # docker build -t my-remote-container-registry/cuda/build-intermediate:11.6.0-devel-base-ubuntu18.04 --build-arg from=nvcr.io/nvidia/cuda:11.6.0-devel-ubuntu18.04 opengl/base

        run_cmd docker build -t "${CGL_INTER_IMAGE_NAME}:${CUDA_VERSION}-devel-runtime-${OS}${OS_VERSION}" \
            --build-arg "from=${CGL_INTER_IMAGE_NAME}:${CUDA_VERSION}-devel-base-${OS}${OS_VERSION}" \
            --build-arg "LIBGLVND_VERSION=${LIBGLVND_VERSION}" \
            "opengl/glvnd/runtime"
        # docker build -t my-remote-container-registry/cuda/build-intermediate:11.6.0-devel-runtime-ubuntu18.04 --build-arg from=my-remote-container-registry/cuda/build-intermediate:11.6.0-devel-base-ubuntu18.04 --build-arg LIBGLVND_VERSION=v1.2.0 opengl/glvnd/runtime

        run_cmd docker build -t "${IMAGE_NAME}:${CUDA_VERSION}-devel-${OS}${OS_VERSION}" \
            --build-arg "from=${CGL_INTER_IMAGE_NAME}:${CUDA_VERSION}-devel-runtime-${OS}${OS_VERSION}" \
            "opengl/glvnd/devel"
    # docker build -t my-remote-container-registry/cuda:11.6.0-devel-ubuntu18.04 --build-arg from=my-remote-container-registry/cuda/build-intermediate:11.6.0-devel-runtime-ubuntu18.04 opengl/glvnd/devel

    fi
}

main
