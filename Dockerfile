FROM python:3.7-slim

RUN pip install --no-cache --upgrade pip
# RUN pip install --no-cache notebook

RUN pip install gf-kernel
RUN python -m gf_kernel.install
RUN apt-get update 
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get -y --no-install-recommends install wget
RUN wget https://www.grammaticalframework.org/download/gf_3.10-2_amd64.deb
RUN apt-get -y --no-install-recommends install libghc-haskeline-dev
RUN apt-get -y --no-install-recommends install libtinfo5
RUN dpkg -i gf_3.10-2_amd64.deb

ARG NB_USER
ARG NB_UID="1000"
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
COPY --chown=1000 . ${HOME}
WORKDIR ${HOME}
USER ${USER}
