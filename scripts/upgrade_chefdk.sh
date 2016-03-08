#!/bin/bash

# This is an attempt to help upgrading your ChefDK.



function check_chefdk_prerequirements_for_upgrade() {

  echo "This will upgrade your ChefDK by removing the previous version first. Are you sure you want to continue?"
  read areusure 


  if [ x$areusure == x"yes" ]; then
      echo -e ""
      echo "What ChefDK version you want to install?"
      read chefdkversion

        if [ ! -z x$chefdkversion ]; then
            echo "ChefDK version to be installed: $chefdkversion"
            echo " - Trying to find the version from your ~/Downloads..."

            if [ -f ~/Downloads/chefdk-${chefdkversion}-1.dmg ]; then
              echo "ChefDK download file for version ${chefdkversion} found!"
            else
              echo "ERROR: Could not find the ChefDK installation package (version ${chefdkversion}) from ~/Downloads."
              exit 1
            fi
        else
          echo "HALT: You did not give me a ChefDK version. Stopping now."
          exit 1
    fi
     
    echo -e ""
  else
    echo -e ""
    echo "HALT: He does not know what he is doing. Stoppping now."
    echo -e ""
    exit 1
fi


}




function uninstall_chefdk() {
  
  echo "Performing uninstallation of an older ChefDK..."
  
  echo " - Removing installed files..."
  sudo rm -rf /opt/chefdk
  
  echo " - Removing the system installation entry from OSX..."
  sudo pkgutil --forget com.getchef.pkg.chefdk

  echo " - Removing symlinks (Chef 12.x only)..."
  sudo find /usr/local/bin -lname '/opt/chefdk/*' -delete

  # Move the gems aside. But don't touch the Berkshelf cache!
  echo " - Removing the old Gemfiles - these will be reinstalled."
  if [ -d ~/.chefdk/gem ]; then
    rm -rf ~/.chefdk/gem
    else
    echo " ** Did not find old RubyGems. This is ok. Proceeding."
  fi


}


function install_chefdk() {

  # How to do this in OSX from command line?
  # echo "TODO: I cannot install ChefDK from command line as of yet."
  echo "Installing ChefDK..."
  MOUNTDIR=$(echo `hdiutil mount ~/Downloads/chefdk-${chefdkversion}-1.dmg | tail -1 \
| awk '{$1=$2=""; print $0}'` | xargs -0 echo) \
&& sudo installer -pkg "${MOUNTDIR}/"*.pkg -target / 
  # installer ~/Downloads/chefdk-${chefdkversion}-1.dmg

}




function reinstall_gems() {

  GEMFILE_PATH=~/Dropbox/chef
  
  if [ -f $GEMFILE_PATH/Gemfile ]; then
    cd $GEMFILE_PATH
    echo "Reinstalling the RubyGems using Gemfile from $GEMFILE_PATH..."
    chef exec bundle install
  else
    echo "ERROR: Cannot file the Gemfile from $GEMFILE_PATH."
  fi

}


check_chefdk_prerequirements_for_upgrade
uninstall_chefdk
install_chefdk
reinstall_gems
