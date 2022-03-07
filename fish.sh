#!/bin/fish

#####
#      VARIABLES
#####   
set NC '\e[0m' # No Color
set RED '\e[1;31m'
set GREEN '\e[1;32m'

set PACKAGES 'jethrokuan/z' 'jorgebucaran/nvm.fish'

#####
#      FUNCTIONS
#####
function displayMsg -a SUCCESS ERROR
	if test "$status" -eq "0" 
        	echo -e "$GREEN SUCCESS: $SUCCESS $NC"
        else 
                echo -e "$RED ERROR: $ERROR $NC"      
	end
end

#####
##	INSTALL FISHER PACKAGES
#####
for package in $PACKAGES 
	if fisher list $package 
		echo -e "$GREEN PASSED: Package $package has already been installed $NC"
	else 
		fisher install $package
		echo -e "$GREEN SUCCESS: $package has been installed $NC"
	end
end

displayMsg "All packages has successfully installed" "Problem to install some packages"

#####
##	NODEJS
#####
nvm install latest
node -v 

displayMsg "Node has been installed" "We have encounter problems to install node"

echo -e "$GREEN The programming environment has been configured ! Restart and have fun ! $NC"
