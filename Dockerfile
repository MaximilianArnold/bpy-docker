
FROM nvidia/cuda:11.2.0-devel-ubuntu16.04

# Environemtal Variables
ENV LANG="C.UTF-8" \
    LC_ALL="C.UTF-8" \
    PATH="/opt/pyenv/shims:/opt/pyenv/bin:$PATH" \
    PYENV_ROOT="/opt/pyenv" \
    PYENV_SHELL="bash"

# Do Update
RUN apt update && apt-get install -y zip htop screen libgl1-mesa-glx locales ca-certificates
RUN apt-get install -y git curl
RUN apt-get install -y wget nano
RUN apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget cur$
# Run Pyenv
#RUN git clone https://github.com/pyenv/pyenv.git ~/.pyenv
#RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
#RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
#RUN echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n eval "$(pyenv init -)"\nfi' >> ~/.bashrc
#exec "$SHELL"RUN exec "$SHELL"
# install pyenv & python
RUN curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# Install Python 3.7.8
RUN pyenv install 3.7.8

# Export to Bash
RUN export PATH="$PYENV_ROOT/shims:$PATH"
RUN export PATH="$PYENV_ROOT/bin:$PATH"

# Pyenv 3.78
RUN pyenv global 3.7.8

# Update pip
RUN /opt/pyenv/versions/3.7.8/bin/python -m pip install --upgrade pip  wheel future-fstrings

# Install BPY
ADD https://github.com/TylerGubala/blenderpy/releases/download/v2.91a0/bpy-2.91a0-cp37-cp37m-manylinux2014_x86_64.wh$
RUN python -m pip install -U pip setuptools wheel
RUN /opt/pyenv/versions/3.7.8/bin/python -m pip install bpy-2.91a0-cp37-cp37m-manylinux2014_x86_64.whl
RUN /opt/pyenv/versions/3.7.8/bin/bpy_post_install

# Pull requirements
# RUN wget requireents.txt

# Install requrirements
#RUN  pip install -r requirements.txt

