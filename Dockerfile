FROM python:3.7-slim

RUN pip install --no-cache --upgrade pip
# RUN pip install --no-cache notebook

RUN pip install gf-kernel
RUN python -m gf_kernel.install
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get -y install wget
RUN wget https://www.grammaticalframework.org/download/gf_3.10-2_amd64.deb
RUN apt-get -y install libghc-haskeline-dev
RUN dpkg -i gf_3.10-2_amd64.deb

ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}
