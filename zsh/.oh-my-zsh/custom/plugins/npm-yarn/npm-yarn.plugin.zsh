

function mynpm() {
  if [ -f ./yarn.lock ]; then
    message="Yarn lock file found, would you like to install using yarn instead?"
    print -P "%F{red}$message%f\n"
    # option1="Y to install using yarn"
    # option2="N to install using npm"
    # print -P "%F{green}$option1%f\n"
    # print -P "%F{green}$option2%f\n"
    # read -q "REPLY?anything else to cancel"
    # case $REPLY in
    #   [yY])
    #       # handle 'y'
    #     yarn $@
    #       ;;   
    #   [nN])   
    #       # handle 'n'
    #     npm $@
    #       ;;
    #   *)  
    #       # do nothing
    #       ;;
    # esac
  fi
}

function myyarn() {
  if [ -f ./package-lock.json ]; then
    message="package-lock.json file found, did you mean to use npm instead of yarn?"
    print -P "%F{red}$message%f\n"
    # option1="Y to install using npm"
    # option2="N to install using yarn"
    # print -P "%F{green}$option1%f\n"
    # print -P "%F{green}$option2%f\n"
    # read -q "REPLY?anything else to cancel"
    # case $REPLY in
    #   [yY])
    #       # handle 'y'
    #     print -P "%F{red} chose $REPLY %f\n"
    #     # npm $@
    #       ;;   
    #   [nN])   
    #       # handle 'n'
    #     print -P "%F{red} chose $REPLY %f\n"
    #     # yarn $@
    #       ;;
    #   *)  
    #       # do nothing
    #       ;;
    # esac
  fi
}
