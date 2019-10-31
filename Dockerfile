RUN pip install gf-kernel
RUN python -m gf_kernel.install
RUN wget https://www.grammaticalframework.org/download/gf_3.10-2_amd64.deb
RUN dpkg -i gf_3.10-2_amd64.deb
