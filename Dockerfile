FROM fedora

ENV HOME /root

ENV MINICONDA_URL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN dnf upgrade --refresh -y

RUN dnf install -y \
    boost-devel \
    bzip2 \
    eigen3-devel \
    gcc \
    ninja-build \
    pybind11-devel

RUN curl $MINICONDA_URL -o $HOME/miniconda.sh && \
    bash $HOME/miniconda.sh -b -p $HOME/miniconda && \
    rm -f $HOME/miniconda.sh

RUN source $HOME/miniconda/bin/activate && \
    conda install -y ipython numpy scipy

WORKDIR $HOME
