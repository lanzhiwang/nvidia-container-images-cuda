

```bash
$ docker pull nvidia/cuda:12.2.0-devel-ubuntu22.04
$
$ docker run -ti --rm nvidia/cuda:12.2.0-devel-ubuntu22.04 bash

==========
== CUDA ==
==========

CUDA Version 12.2.0

Container image Copyright (c) 2016-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.

This container image and its contents are governed by the NVIDIA Deep Learning Container License.
By pulling and using the container, you accept the terms and conditions of this license:
https://developer.nvidia.com/ngc/nvidia-deep-learning-container-license

A copy of this license is made available in this container at /NGC-DL-CONTAINER-LICENSE for your convenience.

root@7eb9dec6c69a:/#
root@7eb9dec6c69a:/# env
NVARCH=x86_64
NVIDIA_REQUIRE_CUDA=cuda>=12.2 brand=tesla,driver>=470,driver<471 brand=unknown,driver>=470,driver<471 brand=nvidia,driver>=470,driver<471 brand=nvidiartx,driver>=470,driver<471 brand=geforce,driver>=470,driver<471 brand=geforcertx,driver>=470,driver<471 brand=quadro,driver>=470,driver<471 brand=quadrortx,driver>=470,driver<471 brand=titan,driver>=470,driver<471 brand=titanrtx,driver>=470,driver<471 brand=tesla,driver>=525,driver<526 brand=unknown,driver>=525,driver<526 brand=nvidia,driver>=525,driver<526 brand=nvidiartx,driver>=525,driver<526 brand=geforce,driver>=525,driver<526 brand=geforcertx,driver>=525,driver<526 brand=quadro,driver>=525,driver<526 brand=quadrortx,driver>=525,driver<526 brand=titan,driver>=525,driver<526 brand=titanrtx,driver>=525,driver<526
NV_CUDA_CUDART_VERSION=12.2.53-1
NV_CUDA_COMPAT_PACKAGE=cuda-compat-12-2
CUDA_VERSION=12.2.0
NVIDIA_VISIBLE_DEVICES=void
NVIDIA_DRIVER_CAPABILITIES=compute,utility
NV_CUDA_LIB_VERSION=12.2.0-1
NV_NVTX_VERSION=12.2.53-1
NV_LIBNPP_VERSION=12.1.1.14-1
NV_LIBNPP_PACKAGE=libnpp-12-2=12.1.1.14-1
NV_LIBCUSPARSE_VERSION=12.1.1.53-1
NV_LIBCUBLAS_PACKAGE_NAME=libcublas-12-2
NV_LIBCUBLAS_VERSION=12.2.1.16-1
NV_LIBCUBLAS_PACKAGE=libcublas-12-2=12.2.1.16-1
NVIDIA_PRODUCT_NAME=CUDA
NV_CUDA_CUDART_DEV_VERSION=12.2.53-1
NV_NVML_DEV_VERSION=12.2.81-1
NV_LIBCUSPARSE_DEV_VERSION=12.1.1.53-1
NV_LIBNPP_DEV_VERSION=12.1.1.14-1
NV_LIBNPP_DEV_PACKAGE=libnpp-dev-12-2=12.1.1.14-1
NV_LIBCUBLAS_DEV_VERSION=12.2.1.16-1
NV_LIBCUBLAS_DEV_PACKAGE_NAME=libcublas-dev-12-2
NV_LIBCUBLAS_DEV_PACKAGE=libcublas-dev-12-2=12.2.1.16-1
NV_CUDA_NSIGHT_COMPUTE_VERSION=12.2.0-1
NV_CUDA_NSIGHT_COMPUTE_DEV_PACKAGE=cuda-nsight-compute-12-2=12.2.0-1
NV_NVPROF_VERSION=12.2.60-1
NV_NVPROF_DEV_PACKAGE=cuda-nvprof-12-2=12.2.60-1
LIBRARY_PATH=/usr/local/cuda/lib64/stubs

PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/lib64

NVIDIA_CTK_LIBCUDA_DIR=/usr/lib/x86_64-linux-gnu

HOSTNAME=7eb9dec6c69a
PWD=/
HOME=/root
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
TERM=xterm
SHLVL=1
PATH=/usr/local/nvidia/bin:/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/env
root@7eb9dec6c69a:/#

###########################################################################


root@b59d483de2ed:/# dpkg -L cuda-keyring
/.
/etc
/etc/apt
/etc/apt/preferences.d
/etc/apt/preferences.d/cuda-repository-pin-600
/etc/apt/sources.list.d
/etc/apt/sources.list.d/cuda-ubuntu2204-x86_64.list
/usr
/usr/share
/usr/share/doc
/usr/share/doc/cuda-keyring
/usr/share/doc/cuda-keyring/changelog.Debian.gz
/usr/share/keyrings
/usr/share/keyrings/cuda-archive-keyring.gpg
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L cuda-cudart-12-2
/.
/usr
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/targets
/usr/local/cuda-12.2/targets/x86_64-linux
/usr/local/cuda-12.2/targets/x86_64-linux/lib
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcudart.so.12.2.53
/usr/share
/usr/share/doc
/usr/share/doc/cuda-cudart-12-2
/usr/share/doc/cuda-cudart-12-2/changelog.Debian.gz
/usr/share/doc/cuda-cudart-12-2/copyright
/usr/local/cuda-12.2/lib64
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcudart.so.12
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L cuda-compat-12-2
/.
/usr
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/compat
/usr/local/cuda-12.2/compat/libcuda.so.535.129.03
/usr/local/cuda-12.2/compat/libcudadebugger.so.535.129.03
/usr/local/cuda-12.2/compat/libnvidia-nvvm.so.535.129.03
/usr/local/cuda-12.2/compat/libnvidia-ptxjitcompiler.so.535.129.03
/usr/share
/usr/share/doc
/usr/share/doc/cuda-compat-12-2
/usr/share/doc/cuda-compat-12-2/changelog.Debian.gz
/usr/local/cuda-12.2/compat/libcuda.so
/usr/local/cuda-12.2/compat/libcuda.so.1
/usr/local/cuda-12.2/compat/libcudadebugger.so.1
/usr/local/cuda-12.2/compat/libnvidia-nvvm.so
/usr/local/cuda-12.2/compat/libnvidia-nvvm.so.4
/usr/local/cuda-12.2/compat/libnvidia-ptxjitcompiler.so.1
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L cuda-libraries-12-2
/.
/usr
/usr/share
/usr/share/doc
/usr/share/doc/cuda-libraries-12-2
/usr/share/doc/cuda-libraries-12-2/changelog.Debian.gz
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L libnpp-12-2
/.
/usr
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/targets
/usr/local/cuda-12.2/targets/x86_64-linux
/usr/local/cuda-12.2/targets/x86_64-linux/lib
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppc.so.12.1.1.14
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppial.so.12.1.1.14
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppicc.so.12.1.1.14
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppidei.so.12.1.1.14
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppif.so.12.1.1.14
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppig.so.12.1.1.14
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppim.so.12.1.1.14
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppist.so.12.1.1.14
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppisu.so.12.1.1.14
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppitc.so.12.1.1.14
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnpps.so.12.1.1.14
/usr/share
/usr/share/doc
/usr/share/doc/libnpp-12-2
/usr/share/doc/libnpp-12-2/changelog.Debian.gz
/usr/share/doc/libnpp-12-2/copyright
/usr/local/cuda-12.2/lib64
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppc.so.12
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppial.so.12
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppicc.so.12
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppidei.so.12
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppif.so.12
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppig.so.12
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppim.so.12
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppist.so.12
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppisu.so.12
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppitc.so.12
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnpps.so.12
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L cuda-nvtx-12-2
/.
/usr
/usr/lib
/usr/lib/pkgconfig
/usr/lib/pkgconfig/nvToolsExt-12.2.pc
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/targets
/usr/local/cuda-12.2/targets/x86_64-linux
/usr/local/cuda-12.2/targets/x86_64-linux/include
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvToolsExt.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvToolsExtCuda.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvToolsExtCudaRt.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvToolsExtOpenCL.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvToolsExtSync.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvToolsExt.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvToolsExtCuda.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvToolsExtCudaRt.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvToolsExtOpenCL.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvToolsExtSync.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvtxDetail
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvtxDetail/nvtxImpl.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvtxDetail/nvtxImplCore.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvtxDetail/nvtxImplCudaRt_v3.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvtxDetail/nvtxImplCuda_v3.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvtxDetail/nvtxImplOpenCL_v3.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvtxDetail/nvtxImplSync_v3.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvtxDetail/nvtxInit.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvtxDetail/nvtxInitDecls.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvtxDetail/nvtxInitDefs.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvtxDetail/nvtxLinkOnce.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvtx3/nvtxDetail/nvtxTypes.h
/usr/local/cuda-12.2/targets/x86_64-linux/lib
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnvToolsExt.so.1.0.0
/usr/share
/usr/share/doc
/usr/share/doc/cuda-nvtx-12-2
/usr/share/doc/cuda-nvtx-12-2/changelog.Debian.gz
/usr/share/doc/cuda-nvtx-12-2/copyright
/usr/local/cuda-12.2/include
/usr/local/cuda-12.2/lib64
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnvToolsExt.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnvToolsExt.so.1
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L libcusparse-12-2
/.
/usr
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/targets
/usr/local/cuda-12.2/targets/x86_64-linux
/usr/local/cuda-12.2/targets/x86_64-linux/lib
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcusparse.so.12.1.1.53
/usr/share
/usr/share/doc
/usr/share/doc/libcusparse-12-2
/usr/share/doc/libcusparse-12-2/changelog.Debian.gz
/usr/share/doc/libcusparse-12-2/copyright
/usr/local/cuda-12.2/lib64
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcusparse.so.12
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L libcublas-12-2
/.
/usr
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/targets
/usr/local/cuda-12.2/targets/x86_64-linux
/usr/local/cuda-12.2/targets/x86_64-linux/lib
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcublas.so.12.2.1.16
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcublasLt.so.12.2.1.16
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnvblas.so.12.2.1.16
/usr/share
/usr/share/doc
/usr/share/doc/libcublas-12-2
/usr/share/doc/libcublas-12-2/changelog.Debian.gz
/usr/share/doc/libcublas-12-2/copyright
/usr/local/cuda-12.2/lib64
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcublas.so.12
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcublasLt.so.12
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnvblas.so.12
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L cuda-cudart-dev-12-2
/.
/usr
/usr/lib
/usr/lib/pkgconfig
/usr/lib/pkgconfig/cudart-12.2.pc
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/targets
/usr/local/cuda-12.2/targets/x86_64-linux
/usr/local/cuda-12.2/targets/x86_64-linux/include
/usr/local/cuda-12.2/targets/x86_64-linux/include/builtin_types.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/channel_descriptor.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/common_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/async.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/coalesced_reduce.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/coalesced_scan.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/driver_abi.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/functional.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/helpers.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/info.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/invoke.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/memory.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/partitioning.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/reduce.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/scan.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/details/sync.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/memcpy_async.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/reduce.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups/scan.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cooperative_groups.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuComplex.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cudaEGL.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cudaEGLTypedefs.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cudaGL.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cudaGLTypedefs.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cudaProfilerTypedefs.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cudaTypedefs.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cudaVDPAU.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cudaVDPAUTypedefs.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_awbarrier.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_awbarrier_helpers.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_awbarrier_primitives.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_bf16.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_bf16.hpp
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_device_runtime_api.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_egl_interop.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_fp16.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_fp16.hpp
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_fp8.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_fp8.hpp
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_gl_interop.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_occupancy.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_pipeline.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_pipeline_helpers.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_pipeline_primitives.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_runtime.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_runtime_api.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_surface_types.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_texture_types.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cuda_vdpau_interop.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cudart_platform.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/device_atomic_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/device_atomic_functions.hpp
/usr/local/cuda-12.2/targets/x86_64-linux/include/device_double_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/device_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/device_launch_parameters.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/device_types.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/driver_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/driver_types.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/host_config.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/host_defines.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/library_types.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/math_constants.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/math_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/mma.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvfunctional
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_20_atomic_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_20_atomic_functions.hpp
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_20_intrinsics.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_20_intrinsics.hpp
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_30_intrinsics.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_30_intrinsics.hpp
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_32_atomic_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_32_atomic_functions.hpp
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_32_intrinsics.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_32_intrinsics.hpp
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_35_atomic_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_35_intrinsics.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_60_atomic_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_60_atomic_functions.hpp
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_61_intrinsics.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/sm_61_intrinsics.hpp
/usr/local/cuda-12.2/targets/x86_64-linux/include/surface_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/surface_indirect_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/surface_types.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/texture_fetch_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/texture_indirect_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/texture_types.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/vector_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/vector_functions.hpp
/usr/local/cuda-12.2/targets/x86_64-linux/include/vector_types.h
/usr/local/cuda-12.2/targets/x86_64-linux/lib
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcudadevrt.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcudart_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libculibos.a
/usr/share
/usr/share/doc
/usr/share/doc/cuda-cudart-dev-12-2
/usr/share/doc/cuda-cudart-dev-12-2/changelog.Debian.gz
/usr/share/doc/cuda-cudart-dev-12-2/copyright
/usr/local/cuda-12.2/include
/usr/local/cuda-12.2/lib64
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcudart.so
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L cuda-command-line-tools-12-2
/.
/usr
/usr/share
/usr/share/doc
/usr/share/doc/cuda-command-line-tools-12-2
/usr/share/doc/cuda-command-line-tools-12-2/changelog.Debian.gz
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L cuda-minimal-build-12-2
/.
/usr
/usr/share
/usr/share/doc
/usr/share/doc/cuda-minimal-build-12-2
/usr/share/doc/cuda-minimal-build-12-2/changelog.Debian.gz
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L cuda-libraries-dev-12-2
/.
/usr
/usr/share
/usr/share/doc
/usr/share/doc/cuda-libraries-dev-12-2
/usr/share/doc/cuda-libraries-dev-12-2/changelog.Debian.gz
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L cuda-nvml-dev-12-2
/.
/usr
/usr/lib
/usr/lib/pkgconfig
/usr/lib/pkgconfig/nvidia-ml-12.2.pc
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/nvml
/usr/local/cuda-12.2/nvml/example
/usr/local/cuda-12.2/nvml/example/Makefile
/usr/local/cuda-12.2/nvml/example/README.txt
/usr/local/cuda-12.2/nvml/example/example.c
/usr/local/cuda-12.2/nvml/example/supportedVgpus.c
/usr/local/cuda-12.2/targets
/usr/local/cuda-12.2/targets/x86_64-linux
/usr/local/cuda-12.2/targets/x86_64-linux/include
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvml.h
/usr/local/cuda-12.2/targets/x86_64-linux/lib
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libnvidia-ml.so
/usr/share
/usr/share/doc
/usr/share/doc/cuda-nvml-dev-12-2
/usr/share/doc/cuda-nvml-dev-12-2/changelog.Debian.gz
/usr/share/doc/cuda-nvml-dev-12-2/copyright
/usr/local/cuda-12.2/include
/usr/local/cuda-12.2/lib64
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L cuda-nvprof-12-2
/.
/usr
/usr/lib
/usr/lib/pkgconfig
/usr/lib/pkgconfig/accinj64-12.2.pc
/usr/lib/pkgconfig/cuinj64-12.2.pc
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/bin
/usr/local/cuda-12.2/bin/nvprof
/usr/local/cuda-12.2/targets
/usr/local/cuda-12.2/targets/x86_64-linux
/usr/local/cuda-12.2/targets/x86_64-linux/lib
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libaccinj64.so.12.2.60
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcuinj64.so.12.2.60
/usr/share
/usr/share/doc
/usr/share/doc/cuda-nvprof-12-2
/usr/share/doc/cuda-nvprof-12-2/changelog.Debian.gz
/usr/share/doc/cuda-nvprof-12-2/copyright
/usr/local/cuda-12.2/lib64
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libaccinj64.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libaccinj64.so.12.2
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcuinj64.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcuinj64.so.12.2
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L libnpp-dev-12-2
/.
/usr
/usr/lib
/usr/lib/pkgconfig
/usr/lib/pkgconfig/nppc-12.2.pc
/usr/lib/pkgconfig/nppi-12.2.pc
/usr/lib/pkgconfig/nppial-12.2.pc
/usr/lib/pkgconfig/nppicc-12.2.pc
/usr/lib/pkgconfig/nppicom-12.2.pc
/usr/lib/pkgconfig/nppidei-12.2.pc
/usr/lib/pkgconfig/nppif-12.2.pc
/usr/lib/pkgconfig/nppig-12.2.pc
/usr/lib/pkgconfig/nppim-12.2.pc
/usr/lib/pkgconfig/nppist-12.2.pc
/usr/lib/pkgconfig/nppisu-12.2.pc
/usr/lib/pkgconfig/nppitc-12.2.pc
/usr/lib/pkgconfig/npps-12.2.pc
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/targets
/usr/local/cuda-12.2/targets/x86_64-linux
/usr/local/cuda-12.2/targets/x86_64-linux/include
/usr/local/cuda-12.2/targets/x86_64-linux/include/npp.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppcore.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppdefs.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppi.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppi_arithmetic_and_logical_operations.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppi_color_conversion.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppi_data_exchange_and_initialization.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppi_filtering_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppi_geometry_transforms.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppi_linear_transforms.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppi_morphological_operations.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppi_statistics_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppi_support_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nppi_threshold_and_compare_operations.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/npps.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/npps_arithmetic_and_logical_operations.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/npps_conversion_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/npps_filtering_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/npps_initialization.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/npps_statistics_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/npps_support_functions.h
/usr/local/cuda-12.2/targets/x86_64-linux/lib
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppc_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppial_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppicc_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppidei_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppif_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppig_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppim_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppist_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppisu_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppitc_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnpps_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libnppc.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libnppial.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libnppicc.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libnppidei.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libnppif.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libnppig.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libnppim.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libnppist.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libnppisu.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libnppitc.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libnpps.so
/usr/share
/usr/share/doc
/usr/share/doc/libnpp-dev-12-2
/usr/share/doc/libnpp-dev-12-2/changelog.Debian.gz
/usr/share/doc/libnpp-dev-12-2/copyright
/usr/local/cuda-12.2/include
/usr/local/cuda-12.2/lib64
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppc.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppial.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppicc.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppidei.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppif.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppig.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppim.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppist.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppisu.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnppitc.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnpps.so
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L libcusparse-dev-12-2
/.
/usr
/usr/lib
/usr/lib/pkgconfig
/usr/lib/pkgconfig/cusparse-12.2.pc
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/src
/usr/local/cuda-12.2/src/cusparse_fortran.c
/usr/local/cuda-12.2/src/cusparse_fortran.h
/usr/local/cuda-12.2/src/cusparse_fortran_common.h
/usr/local/cuda-12.2/targets
/usr/local/cuda-12.2/targets/x86_64-linux
/usr/local/cuda-12.2/targets/x86_64-linux/include
/usr/local/cuda-12.2/targets/x86_64-linux/include/cusparse.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cusparse_v2.h
/usr/local/cuda-12.2/targets/x86_64-linux/lib
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcusparse_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libcusparse.so
/usr/share
/usr/share/doc
/usr/share/doc/libcusparse-dev-12-2
/usr/share/doc/libcusparse-dev-12-2/changelog.Debian.gz
/usr/share/doc/libcusparse-dev-12-2/copyright
/usr/local/cuda-12.2/include
/usr/local/cuda-12.2/lib64
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcusparse.so
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L libcublas-dev-12-2
/.
/usr
/usr/lib
/usr/lib/pkgconfig
/usr/lib/pkgconfig/cublas-12.2.pc
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/src
/usr/local/cuda-12.2/src/fortran.c
/usr/local/cuda-12.2/src/fortran.h
/usr/local/cuda-12.2/src/fortran_common.h
/usr/local/cuda-12.2/src/fortran_thunking.c
/usr/local/cuda-12.2/src/fortran_thunking.h
/usr/local/cuda-12.2/targets
/usr/local/cuda-12.2/targets/x86_64-linux
/usr/local/cuda-12.2/targets/x86_64-linux/include
/usr/local/cuda-12.2/targets/x86_64-linux/include/cublas.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cublasLt.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cublasXt.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cublas_api.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/cublas_v2.h
/usr/local/cuda-12.2/targets/x86_64-linux/include/nvblas.h
/usr/local/cuda-12.2/targets/x86_64-linux/lib
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcublasLt_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcublas_static.a
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libcublas.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/stubs/libcublasLt.so
/usr/share
/usr/share/doc
/usr/share/doc/libcublas-dev-12-2
/usr/share/doc/libcublas-dev-12-2/changelog.Debian.gz
/usr/share/doc/libcublas-dev-12-2/copyright
/usr/local/cuda-12.2/include
/usr/local/cuda-12.2/lib64
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcublas.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libcublasLt.so
/usr/local/cuda-12.2/targets/x86_64-linux/lib/libnvblas.so
root@b59d483de2ed:/#

root@b59d483de2ed:/# dpkg -L cuda-nsight-compute-12-2
/.
/usr
/usr/local
/usr/local/cuda-12.2
/usr/local/cuda-12.2/bin
/usr/local/cuda-12.2/bin/ncu
/usr/local/cuda-12.2/bin/ncu-ui
/usr/share
/usr/share/doc
/usr/share/doc/cuda-nsight-compute-12-2
/usr/share/doc/cuda-nsight-compute-12-2/changelog.Debian.gz
root@b59d483de2ed:/#


###########################################################################


root@b59d483de2ed:/# cat /etc/ld.so.conf.d/nvidia.conf
/usr/local/nvidia/lib
/usr/local/nvidia/lib64
root@b59d483de2ed:/#

root@b59d483de2ed:/# tree -a /opt/nvidia/entrypoint.d/
/opt/nvidia/entrypoint.d/
|-- 10-banner.sh
|-- 12-banner.sh
|-- 15-container-copyright.txt
|-- 30-container-license.txt
|-- 50-gpu-driver-check.sh
|-- 80-internal-image.sh
|-- 90-deprecated-image.sh

0 directories, 7 files
root@b59d483de2ed:/#
root@b59d483de2ed:/# ls -al /opt/nvidia/nvidia_entrypoint.sh
-rwxr-xr-x 1 root root 2529 Nov 10  2023 /opt/nvidia/nvidia_entrypoint.sh
root@b59d483de2ed:/#


```
