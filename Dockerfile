ARG region

# FROM 763104351884.dkr.ecr.${region}.amazonaws.com/pytorch-training:1.8.1-gpu-py36-cu111-ubuntu18.04
FROM 763104351884.dkr.ecr.us-east-1.amazonaws.com/pytorch-training:1.7.1-gpu-py36-cu110-ubuntu18.04

#RUN cd /root && \
#	git clone --recursive https://github.com/tkazusa/yolov5-sagemaker-distributed-data-parallel.git && \
#    chmod -R 775 yolov5-sagemaker-distributed-data-parallel && \
#	cd yolov5-sagemaker-distributed-data-parallel && \
#	pip install -r requirements.txt &&\
#    pip install -U smdebug
    

# Install python dependenies
COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN pip install --no-cache -r requirements.txt coremltools onnx gsutil notebook
RUN pip install -U smdebug

ENV SAGEMAKER_INSTANCE_TYPE ml.p3.16xlarge