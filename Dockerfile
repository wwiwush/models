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
functools32          \  
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
    python2 -m ipykernel.kernelspec


# --- DO NOT EDIT OR DELETE BETWEEN THE LINES --- #
# These lines will be edited automatically by parameterized_docker_build.sh. #
# COPY _PIP_FILE_ /
# RUN pip --no-cache-dir install /_PIP_FILE_
# RUN rm -f /_PIP_FILE_

# Install TensorFlow CPU version from central repo
#RUN pip --no-cache-dir install --upgrade tensorflow-gpu==1.14.0
# --- ~ DO NOT EDIT OR DELETE BETWEEN THE LINES --- #

# RUN ln -s /usr/bin/python3 /usr/bin/python#

# Set up our notebook config.
#COPY jupyter_notebook_config.py /root/.jupyter/

# Copy sample notebooks.
#COPY notebooks /notebooks

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
#COPY run_jupyter.sh /

# TensorBoard
#EXPOSE 6006
# IPython
#EXPOSE 8888

#WORKDIR "/notebooks"

#RUN chmod +x /run_jupyter.sh


RUN cd /tmp && rm -rf * && git clone https://github.com/wwiwush/models.git && mkdir mlruns dataset
WORKDIR /tmp/
CMD ["sh","models/launch.sh"]

#CMD ["/bin/bash", "--allow-root"]
