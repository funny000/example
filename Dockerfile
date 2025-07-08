#From nvcr.io/nvidia/deepstream:7.1-samples-multiarch
#FROM pytorch/pytorch:1.13.0-cuda11.7-cudnn8-devel
ARG PYTORCH="1.13.1"
ARG CUDA="11.7"
ARG CUDNN="8.5.2"

FROM pytorch/pytorch:${PYTORCH}-cuda${CUDA}-cudnn${CUDNN}-devel
