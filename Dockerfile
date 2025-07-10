#From nvcr.io/nvidia/deepstream:7.1-samples-multiarch
#FROM pytorch/pytorch:1.13.0-cuda11.7-cudnn8-devel
#FROM nvcr.io/nvidia/pytorch:24.10-py3
# FROM nvidia/cuda:11.6-devel-ubuntu22.04
FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-devel

ENV DEBIAN_FRONTEND=noninteractive
ENV CUDA_HOME=/usr/local/cuda \
    PATH=/usr/local/cuda/bin:${PATH} \
    LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}
    
RUN apt-get update && apt-get install -y ffmpeg libsm6 libxext6 git ninja-build libglib2.0-0 libsm6 libxrender-dev libxext6 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
# RUN pip3 install torch==1.13.0+cu116 torchvision==0.14.0+cu116 torchaudio==0.13.0 --extra-index-url https://download.pytorch.org/whl/cu116 -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
RUN pip3 install packaging -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
RUN pip3 install numpy==1.23.5 mmcv_full==1.7.1 mmdet==2.28.2 urllib3==1.26.16 pyquaternion==0.9.9 nuscenes-devkit==1.1.10 yapf==0.33.0 tensorboard==2.14.0 motmetrics==1.1.3 flash-attn==2.3.2 opencv-python==4.8.1.78 prettytable==3.7.0 scikit-learn==1.3.0 -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
RUN pip3 install pandas

# Install miniconda
# use python 3.8 instaed of 3.10
RUN apt-get update && apt-get install -y curl cuda
RUN pip3 install nvidia-cusolver-cu11 -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com
ENV CONDA_DIR=/opt/conda
RUN curl -O https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh 
RUN bash ./Anaconda3-2024.10-1-Linux-x86_64.sh -b && rm ./Anaconda3-2024.10-1-Linux-x86_64.sh
ENV PATH=$CONDA_DIR/bin:$PATH

# Install prerequisites
RUN apt-get update && apt-get install -y \
        sudo \
        udev \
&& rm -rf /var/lib/apt/lists/* \
&& apt-get clean
