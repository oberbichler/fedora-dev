FROM fedora:31

ENV HOME /root

ENV MINICONDA_URL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

RUN dnf upgrade --refresh -y

RUN dnf install -y bzip2 && \
    curl $MINICONDA_URL -o $HOME/miniconda.sh && \
    bash $HOME/miniconda.sh -b -p $HOME/miniconda && \
    rm -f $HOME/miniconda.sh

RUN dnf install -y \
    boost-devel \
    coin-or-Ipopt-devel \
    eigen3-devel \
    ninja-build \
    pybind11-devel \
    vim-minimal && \
    dnf groupinstall -y 'Development Tools'

RUN source $HOME/miniconda/bin/activate && conda install -y \
    ipython \
    mkl-devel \
    numpy \
    scipy \
    tbb-devel

ENV PATH $HOME/miniconda/bin/:$PATH

RUN /bin/bash -c "source activate"

ENTRYPOINT [ "/bin/bash" ]

WORKDIR $HOME
