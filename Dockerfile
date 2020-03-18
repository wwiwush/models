FROM tensorflow/tensorflow:1.14.0-gpu-py3

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
        && \
   DEBIAN_FRONTEND=noninteractiv apt-get install -y --no-install-recommends python-tk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN pip install Cython \
numpy
RUN pip --no-cache-dir install \
        mlflow>=1.0 \
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
functools32   \
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


RUN cd /tmp && rm -rf * && mkdir nfsnew && cd nfsnew && mkdir mlruns dataset
#CMD ["mount","-t","nfs","192.168.50.216:/home/blita/nfsnew","/tmp/nfsnew"]
#CMD ["sh","/tmp/models/launch.sh"]
CMD ["/bin/bash", "--allow-root"]
