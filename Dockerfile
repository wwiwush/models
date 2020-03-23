FROM tensorflow/tensorflow:1.14.0-gpu

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng-dev \
        libzmq3-dev \
        pkg-config \
        rsync \
        software-properties-common \
        unzip \
        git \
	vim \
        nfs-common \
        openssh-server \
        && \
   DEBIAN_FRONTEND=noninteractiv apt-get install -y --no-install-recommends python-tk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip install Cython \
numpy
RUN pip --no-cache-dir install mlflow==1.6.0 \
        ipykernel \
        jupyter \
        scipy \
        pandas \
        absl-py \     
astor \     
backports-abc   \        
backports.functools-lru-cache \    
backports.weakref       \  
certifi         \  
cycler         \  
 
enum34          \      
funcsigs           \   
futures          \     
gast                 \   
google-pasta            \   
grpcio              \  
h5py      \   
Keras-Applications        \      
Keras-Preprocessing  \       
kiwisolver       \       
Markdown              \     
matplotlib    \     
mkl-fft          \      
mkl-random      \     
#mkl-service          \      
mock       \  
olefile           \    
opt-einsum           \       
Pillow           \  
pip                \    
protobuf             \      
pycocotools          \       
pyparsing         \        
python-dateutil        \      
pytz                  \    
setuptools             \       
singledispatch        \     
six               \   
subprocess32          \      
tensorboard            \   
tensorflow-estimator        \  
#tensorflow-gpu     \   
termcolor          \    
tornado               \       
Werkzeug                \      
wheel                 \      
wrapt              \  
        && \
    python -m ipykernel.kernelspec


# --- DO NOT EDIT OR DELETE BETWEEN THE LINES --- #
# These lines will be edited automatically by parameterized_docker_build.sh. #
# COPY _PIP_FILE_ /
# RUN pip --no-cache-dir install /_PIP_FILE_
# RUN rm -f /_PIP_FILE_

# TensorBoard
#EXPOSE 6006
# IPython
#EXPOSE 8888

RUN useradd --create-home --shell /bin/bash newuser && adduser newuser sudo && echo 'newuser:nu12345' | chpasswd

RUN cd /tmp && rm -rf * && git clone https://github.com/wwiwush/models.git && mkdir nfsnew && cd nfsnew && mkdir mlruns dataset
EXPOSE 22
#CMD ["mount","-t","nfs","192.168.50.216:/home/blita/nfsnew","/tmp/nfsnew"]
ENTRYPOINT ["sh","/tmp/models/launch.sh"]
#ENTRYPOINT ["/bin/bash", "-c"]
