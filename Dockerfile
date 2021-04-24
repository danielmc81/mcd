FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y vim wget curl csvkit python3-csvkit

#Instalar miniconda3
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir $HOME/.conda \
    && /bin/bash Miniconda3-latest-Linux-x86_64.sh -b

RUN eval "$(/root/miniconda3/bin/conda shell.bash hook)"
RUN /root/miniconda3/bin/conda init
RUN /root/miniconda3/bin/conda install -c conda-forge notebook 
                                    
    

