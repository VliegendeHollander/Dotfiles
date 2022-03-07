#!/bin/bash

#####
##	Variables
#####
NC='\e[0m' # No Color
RED='\e[1;31m'
GREEN='\e[1;32m'

PACKAGES='docker docker-compose git github-cli neovim fish starship exa peco tmux unzip nvm discord'

#####
##	Functions
#####
displayMsg(){
	PASS=$1
	ERROR=$2 

	if test "$?" -eq "0" ; then 
		echo -e "${GREEN}SUCCESS: $PASS${NC}"
	else 
		echo -e "${RED}ERROR: $ERROR${NC}"	
	fi
}

#####
##	Update pacman
#####
sudo pacman -Syyu 

#####
##	Install packages
#####
for package in $PACKAGES
do 
	if pacman -Qi $package > /dev/null ; then
		echo -e "${GREEN}PASSED: Package $package has already been installed${NC}" 
	else
		sudo pacman -S $package
                echo -e "${GREEN}SUCCESS: $package has been installed${NC}"
	fi
done

displayMsg "Packages has been installed" "Problems to install some packages"

#####
##	Change Shell
####
if [ $(echo $SHELL) != "/bin/fish" ]; then 
	chsh -s /bin/fish
        displayMsg "Change shell configuration to use fish" "Can't change shell configuration"
fi

echo -e "${GREEN}Your default shell is already configured with Fish${NC}"


#####
##	Installation Vim-Plug
#####
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

displayMsg "Successfully installed Vim-plug for Nvim" "Can't install Vim-plug" 

#####
##	Install Fisher and Plug 
#####
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

displayMsg "Fisher has been installed" "Problem to install Fisher for Fish shell"  


#####
##      Install NerdFont
#####
REPO="https://github.com/ryanoasis/nerd-fonts"
FONT="FiraCode"

DIRNERD="/usr/share/fonts/NerdFont"

LATEST_RELEASE=$(curl -L -s -H 'Accept: application/json' $REPO/releases/latest)             
LATEST_VERSION=$(echo $LATEST_RELEASE | sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
ARTIFACT_URL="$REPO/releases/download/$LATEST_VERSION/$FONT.zip"

if [ -d "$DIRNERD$LATEST_VERSION/$FONT" ]
then
        echo -e "${GREEN}PASSED: Font is already installed${NC}" 
else
        if [ -d $DIRNERD*/$FONT ] 
        then
                sudo rm -r $DIRNERD*/$FONT
                echo "The deprecated version has been deleted and we will install the new one" 
        fi

        sudo mkdir $DIRNERD$LATEST_VERSION

        wget -N $ARTIFACT_URL && sudo unzip $FONT.zip -d $DIRNERD$LATEST_VERSION/$FONT && rm $FONT.zip
        
        displayMsg "$FONT font has been installed" "Issue to install $FONT font"
fi

#####
##	Docker
#####
sudo systemctl start docker.service
sudo systemctl enable docker.service
