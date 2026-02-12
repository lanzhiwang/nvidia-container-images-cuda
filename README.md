# Nvidia CUDA Linux Container Image Sources
Nvidia CUDA Linux 容器镜像源

Usage of the CUDA container images requires the [Nvidia Container Runtime](https://github.com/NVIDIA/nvidia-container-runtime).
使用 CUDA 容器映像需要 Nvidia Container Toolkit。

Container images are available from:
容器映像可从以下位置获得：

- https://ngc.nvidia.com/catalog/containers/nvidia:cuda
- https://hub.docker.com/r/nvidia/cuda

## Announcement
公告

### Cuda 12 images are now LIVE
Cuda 12 图像现已上线

Entrypoint scripts are rolling out now for all images, which include deprecation notices for image sets that have reached End-of-life.
入口点脚本现已针对所有映像推出，其中包括针对已达到生命周期终止的映像集的弃用通知。

Please read our [Container Tag Support Policy](https://gitlab.com/nvidia/container-images/cuda/-/blob/master/doc/support-policy.md) for more information.
有关更多信息，请阅读我们的 Container Tag Support Policy。

### Deprecated: "latest" tag
已弃用：“latest”标签

The "latest" tag for CUDA, CUDAGL, and OPENGL images has been deprecated on NGC and Docker Hub.
CUDA 、 CUDAGL 和 OPENGL 映像的 “latest” 标签已在 NGC 和 Docker Hub 上弃用。

With the removal of the latest tag, the following use case will result in the "manifest unknown"
error:
删除 latest 标签后，以下用例将导致“manifest unknown”错误：

```
$ docker pull nvidia/cuda
Error response from daemon: manifest for nvidia/cuda:latest not found: manifest unknown: manifest
unknown
```

This is not a bug.

## IMAGE SECURITY NOTICE
图像安全通知

The CUDA images are scanned for CVE vulnerabilities prior to release and some images may contain CVEs at the time of publication.
CUDA 映像在发布之前会进行 CVE 漏洞扫描，某些映像在发布时可能包含 CVE。

Our Product Security teams reviews the CVEs and determines if the CVE should block the release or not. We try to mitigate as much as we can, but since we do not control the upstream base images, some cuda image releases might be impacted.
我们的产品安全团队会审查 CVE 并确定 CVE 是否应阻止发布。我们尝试尽可能多地缓解，但由于我们无法控制上游基础镜像，因此某些 cuda 镜像版本可能会受到影响。

Please consult the README on the NGC or Docker Hub pages for details.
有关详细信息，请参阅 NGC 或 Docker Hub 页面上的 README 文件。

## LD_LIBRARY_PATH NOTICE

The `LD_LIBRARY_PATH` is set inside the container to legacy nvidia-docker v1 paths that do not exist on newer installations. This is done to maintain compatibility for our partners that still use nvidia-docker v1 and this will not be changed for the forseable future. [There is a chance this might cause issues for some.](https://gitlab.com/nvidia/container-images/cuda/-/issues/47)
LD_LIBRARY_PATH在容器内设置为旧版 nvidia-docker v1 路径，这些路径在较新的安装中不存在。这样做是为了维护仍在使用 nvidia-docker v1 的合作伙伴的兼容性，这在可预见的将来不会改变。这可能会给某些人带来问题。

## Building from source

The container image scripts are archived in the `dist/` directory and are available for all supported distros and cuda versions.
容器映像脚本存档在 dist/ 目录中，可用于所有受支持的发行版和 cuda 版本。

Here is an example on how to build an multi-arch container image for Ubuntu 18.04 and CUDA 11.6.0:
以下是有关如何为 Ubuntu 18.04 和 CUDA 11.6.0 构建多架构容器镜像的示例：

WARNING: cudgl image builds *REQUIRE* a secure registry to push built intermediate images to since buildkit does not easily allow using local image references from the build container.
警告：cudgl 镜像构建需要一个安全的注册表来将构建的中间镜像推送到其中，因为 buildkit 不允许使用来自构建容器的本地镜像引用。


```bash
./build.sh -d --image-name my-remote-container-registry/cuda --cuda-version 11.6.0 --os ubuntu --os-version 18.04 --arch x86_64,arm64 --push

./build.sh \
-d \
--image-name my-remote-container-registry/cuda \
--cuda-version 11.6.0 \
--os ubuntu \
--os-version 18.04 \
--arch x86_64,arm64 \
--push

$ ./build.sh \
-d \
--image-name lanzhiwang/cuda \
--cuda-version 12.2.0 \
--os ubuntu \
--os-version 22.04 \
--arch x86_64,arm64 \
--push \
-n

docker buildx create --use --platform linux/x86_64,linux/arm64,linux/ppc64le --driver-opt image=moby/buildkit:v0.10.3 --name cuda --node cuda

cp NGC-DL-CONTAINER-LICENSE dist/12.2.0/ubuntu2204/base/

cp -R entrypoint.d nvidia_entrypoint.sh dist/12.2.0/ubuntu2204/runtime/

docker buildx build --pull --push --platform linux/x86_64,linux/arm64 -t lanzhiwang/cuda:12.2.0-base-ubuntu22.04 dist/12.2.0/ubuntu2204/base

docker buildx build --pull --push --platform linux/x86_64,linux/arm64 -t lanzhiwang/cuda:12.2.0-runtime-ubuntu22.04 --build-arg IMAGE_NAME=lanzhiwang/cuda dist/12.2.0/ubuntu2204/runtime

docker buildx build --pull --push --platform linux/x86_64,linux/arm64 -t lanzhiwang/cuda:12.2.0-devel-ubuntu22.04 --build-arg IMAGE_NAME=lanzhiwang/cuda dist/12.2.0/ubuntu2204/devel

#######

docker pull nvidia/cuda:12.2.0-base-ubuntu22.04
docker pull nvidia/cuda:12.2.0-runtime-ubuntu22.04
docker pull nvidia/cuda:12.2.0-devel-ubuntu22.04

```

See `./build.sh --help` for usage.

## Cuda Container Image Automation

The [README_CICD.md](https://gitlab.com/nvidia/container-images/cuda/blob/master/README_CICD.md) document provides details on how the gitlab pipelines work and how to control, modify, or debug them.
README_CICD.md 文档提供了有关 gitlab 管道如何工作以及如何控制、修改或调试它们的详细信息。
