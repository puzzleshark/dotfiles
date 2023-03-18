NVIM := $(shell which nvim 2>/dev/null)
TMUX := $(shell which tmux 2>/dev/null)
ALICRITTY := $(shell which alicritty 2>/dev/null)
I3 := $(shell which i3 2>/dev/null)

configure-nvim: install-nvim
	ln -s ~/.dotfiles/nvim ~/.config/nvim
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' # install plugins


install-nvim:
ifndef NVIM
	wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb
	sudo apt install ./nvim-linux64.deb
	rm nvim-linux64.deb
endif

configure-tmux: install-tmux
	ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

install-tmux:
	sudo apt install tmux

install-nvim-app:
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	./nvim.appimage
