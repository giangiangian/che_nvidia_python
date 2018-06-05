FROM giangiangian/eclipse_che_gpu_dockerfile_base:9.1-devel-ubuntu16.04

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN sudo apt-get update --fix-missing && \
	sudo apt-get -y install \
	wget bzip2 ca-certificates curl git \
	python3-pip &&\
	sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*
	
RUN sudo wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh -O ~/miniconda.sh && \
    sudo /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    sudo rm ~/miniconda.sh && \
    sudo /opt/conda/bin/conda clean -tipsy && \
    sudo ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

RUN pip install tensorflow-gpu