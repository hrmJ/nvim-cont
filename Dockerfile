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

WORKDIR /home/neovim

RUN  apt-get update \
  && apt-get install -y \ 
  wget \
  fuse \
  && rm -rf /var/lib/apt/lists/

RUN wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
RUN chmod a+x nvim.appimage

CMD ./nvim.appimage --appimage-extract-and-run /home/neovim/.nvim.appimage 

