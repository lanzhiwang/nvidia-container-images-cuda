ARG IMAGE_NAME
FROM ${IMAGE_NAME}:12.6.1-runtime-rockylinux9 as base

FROM base as base-amd64

ENV NV_CUDNN_VERSION 9.3.0.75-1
ENV NV_CUDNN_PACKAGE libcudnn9-cuda-12-${NV_CUDNN_VERSION}

FROM base as base-arm64

ENV NV_CUDNN_VERSION 9.3.0.75-1
ENV NV_CUDNN_PACKAGE libcudnn9-cuda-12-${NV_CUDNN_VERSION}


FROM base-${TARGETARCH}

ARG TARGETARCH

LABEL maintainer "NVIDIA CORPORATION <sw-cuda-installer@nvidia.com>"

LABEL com.nvidia.cudnn.version="${NV_CUDNN_VERSION}"

RUN yum install -y \
    ${NV_CUDNN_PACKAGE} \
    && yum clean all \
    && rm -rf /var/cache/yum/*