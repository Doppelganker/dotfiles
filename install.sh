printf "Starting dotfiles setup"

printf "\n🚀 Installing oh-my-zsh\n"
if [ -d "${HOME}/.oh-my-zsh" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

: "${ZSH_CUSTOM:=$HOME/.oh-my-zsh/custom}"
printf "\n🚀 Installing zsh plugins and theme\n"
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

printf "\n🚀 Installing dotfiles\n"
ln -sf "$(pwd)/.zshrc" "${HOME}/.zshrc"
ln -sf "$(pwd)/.p10k.zsh" "${HOME}/.p10k.zsh"
