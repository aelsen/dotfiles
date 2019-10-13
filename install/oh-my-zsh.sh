# Install Oh-My-ZSH
if [ ! -d ~/.oh-my-zsh ]; then
	echo -e "Installing Oh-My-ZSH.";
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	source ~/.zshrc
else
	MACRO_DEBUG "Oh-My-ZSH already installed.";
fi;

ZSH_CUSTOM=~/.oh-my-zsh/custom
ZSH_PLUGINS="${ZSH_CUSTOM}/plugins"
# Install Oh-My-ZSH zsh-256color plugin
if [ ! -d $ZSH_PLUGINS/zsh-256color ]; then
	echo -e "Installing Oh-My-ZSH plugin zsh-256color at $ZSH_PLUGINS";
	mkdir -p $ZSH_PLUGINS && git clone https://github.com/chrissicool/zsh-256color $ZSH_PLUGINS/zsh-256color
else
	MACRO_DEBUG "Oh-My-ZSH plugin zsh-256color already installed.";
fi;