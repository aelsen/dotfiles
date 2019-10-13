TMUX_PLUGINS=~/.tmux/plugins

# Install tmux tpm plugin
if [ ! -d $TMUX_PLUGINS/tpm ]; then
	echo -e "Installing tmux plugin tpm at $TMUX_PLUGINS";
	mkdir -p $TMUX_PLUGINS && git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGINS/tpm
else
	MACRO_DEBUG "tmux plugin tpm already installed.";
fi;