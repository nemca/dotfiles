all: sync

sync:
	[ -L ~/.bashrc ] || ln -sf $(PWD)/bashrc ~/.bashrc
	[ -L ~/.gitconfig ] || ln -sf $(PWD)/gitconfig ~/.gitconfig
	[ -L ~/.vimrc ] || ln -sf $(PWD)/vimrc ~/.vimrc
	[ -L ~/.zshrc ] || ln -sf $(PWD)/zshrc ~/.zshrc

clean:
	rm -f ~/.bashrc
	rm -f ~/.bashrc
	rm -f ~/.vimrc
	rm -f ~/.zshrc

.PHONY: clean sync
