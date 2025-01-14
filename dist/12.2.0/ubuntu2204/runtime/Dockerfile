ARG IMAGE_NAME
FROM ${IMAGE_NAME}:12.2.0-base-ubuntu22.04 as base
# [base 1/1] FROM docker.io/nvidia/cuda:12.2.0-base-ubuntu22.04@sha256:ecdf8549dd5f12609e365217a64dedde26ecda26da8f3ff3f82def6749f53051

ENV NV_CUDA_LIB_VERSION 12.2.0-1

FROM base as base-amd64

ENV NV_NVTX_VERSION 12.2.53-1
ENV NV_LIBNPP_VERSION 12.1.1.14-1
ENV NV_LIBNPP_PACKAGE libnpp-12-2=${NV_LIBNPP_VERSION}
ENV NV_LIBCUSPARSE_VERSION 12.1.1.53-1

ENV NV_LIBCUBLAS_PACKAGE_NAME libcublas-12-2
ENV NV_LIBCUBLAS_VERSION 12.2.1.16-1
ENV NV_LIBCUBLAS_PACKAGE ${NV_LIBCUBLAS_PACKAGE_NAME}=${NV_LIBCUBLAS_VERSION}

FROM base as base-arm64

ENV NV_NVTX_VERSION 12.2.53-1
ENV NV_LIBNPP_VERSION 12.1.1.14-1
ENV NV_LIBNPP_PACKAGE libnpp-12-2=${NV_LIBNPP_VERSION}
ENV NV_LIBCUSPARSE_VERSION 12.1.1.53-1

ENV NV_LIBCUBLAS_PACKAGE_NAME libcublas-12-2
ENV NV_LIBCUBLAS_VERSION 12.2.1.16-1
ENV NV_LIBCUBLAS_PACKAGE ${NV_LIBCUBLAS_PACKAGE_NAME}=${NV_LIBCUBLAS_VERSION}

FROM base-${TARGETARCH}

ARG TARGETARCH

LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-libraries-12-2=${NV_CUDA_LIB_VERSION} \
    ${NV_LIBNPP_PACKAGE} \
    cuda-nvtx-12-2=${NV_NVTX_VERSION} \
    libcusparse-12-2=${NV_LIBCUSPARSE_VERSION} \
    ${NV_LIBCUBLAS_PACKAGE} \
    && rm -rf /var/lib/apt/lists/*
# RUN
# apt-get update &&
# apt-get install -y --no-install-recommends cuda-libraries-12-2=12.2.0-1 libnpp-12-2=12.1.1.14-1 cuda-nvtx-12-2=12.2.53-1 libcusparse-12-2=12.1.1.53-1 libcublas-12-2=12.2.1.16-1 &&
# rm -rf /var/lib/apt/lists/*

# Keep apt from auto upgrading the cublas and nccl packages. See https://gitlab.com/nvidia/container-images/cuda/-/issues/88
RUN apt-mark hold ${NV_LIBCUBLAS_PACKAGE_NAME}
# RUN apt-mark hold libcublas-12-2

# Add entrypoint items
COPY entrypoint.d/ /opt/nvidia/entrypoint.d/
COPY nvidia_entrypoint.sh /opt/nvidia/
ENV NVIDIA_PRODUCT_NAME="CUDA"
ENTRYPOINT ["/opt/nvidia/nvidia_entrypoint.sh"]