FROM ubuntu:latest

ENV \
        UID="1000" \
        GID="1000" \
        UNAME="neovim" \
        GNAME="neovim" \
        SHELL="/bin/bash" \
        WORKSPACE="/mnt/workspace" \
	NVIM_CONFIG="/home/neovim/.config/nvim" \
	NVIM_PCK="/home/neovim/.local/share/nvim/site/pack" \
	ENV_DIR="/home/neovim/.local/share/vendorvenv" \
	NVIM_PROVIDER_PYLIB="python3_neovim_provider" \
	PATH="/home/neovim/.local/bin:${PATH}"


RUN  apt-get update && apt-get install -y  \
sudo \
wget  \
fuse  \
python3 python3-dev \
git \
gcc \
&& rm -rf /var/lib/apt/lists/

RUN groupadd "${GNAME}"
RUN useradd -rm -d /home/neovim -g "${GNAME}" -s "${SHELL}" "${UNAME}" 
RUN echo "${UNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 
RUN chown -R neovim:neovim /home/neovim/

WORKDIR /home/neovim

RUN wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
RUN chmod a+x nvim.appimage
COPY ./conf/nvim /home/neovim/.config/nvim
RUN chown neovim:neovim -R /home/neovim/.config


VOLUME "${WORKSPACE}"
USER neovim
RUN ./nvim.appimage --appimage-extract-and-run --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
RUN echo "require('post-packer')" >> /home/neovim/.config/nvim/init.lua
CMD ./nvim.appimage --appimage-extract-and-run 

# docker build . -t nvim-cont && docker run -it --rm nvim-cont:latest

