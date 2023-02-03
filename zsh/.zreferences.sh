# docker
alias Dimages="docker images" # list all local docker images
alias Dinspect="docker inspect $1" # outputs information about specified image
alias Dstart="docker start $1" # run a container in the background
alias Dkill="docker kill $1" # kills specified image
alias Dattach="docker attach $1" # enter a container
alias Dprune="docker container prune" # removes all stopped containers
alias Drmimage="docker rmi $1" # removes specified image
alias Drm="docker rm $1" # removes specified container
alias Dbuild="docker build ." # builds image from ./Dockerfile 
alias Dbuildfile="docker build -f $1 ." # builds image from specified file # this alias syntax does not work
alias Dbuildtag="docker build -t $1 ." # builds image from repository of specified name and tags as $1:latest, this alias syntax does not work
alias Dcommit="docker commit $1 $2" # creates an image from a container
alias Drunports="docker run -d -P $1" # runs container in background and maps the exposed container port to a port on our localhost
alias Dmapports="docker run -d -p 3000:8080 $1" # runs container and exposes container port 8080 to our localhost:3000 
alias Dnetwork="docker network ls" # lists existing docker networks
alias Dhost="docker run -d --network=host ubuntu_networking /webapp" #runs image and command in background and exposes container ports on localhost
alias Dnone="docker run -d --network=none ubuntu_networking /webapp" #runs container in background without any networking capabilities outside of itself
alias Drunmountbind='docker run -d --mount type=bind,src="/home/justin/docs/src/software/docker/demo/logs",dst=/logs scratch_volume' # persists data from docker container in specified directory
alias Drunmountvolume='docker run -d --mount type=volume,src="logs",dst=/logs scratch_volume' # persists data from docker container in Docker managed "logs" directory 
alias Druntmpfs='docker run -it --mount type=tmpfs,dst=/logs ubuntu' # data is only available inside the container while it runs and will be erased once the container stops
alias Dlistvolumes='docker volume ls'
alias Dinspectvolume="docker volume inspect $1" #inspects specified volume
alias Dbuildtag='docker build -t "demo_tag" .' # builds docker image named demo_tag (under repository) with the tag latest  
alias Dtag='docker tag tag_demo:latest tag_demo:v1' # builds the same docker image but with a different tag
alias Dtagpublish='docker tag tag_demo:latest justinaawd/tag_demo:latest && docker push justinaawd/tag_demo' # changes tag and pushes to docker repository

# docker-compose
alias DCupd='docker-compose up -d' # builds containers from assumed file name "docker-compose.yml"
alias DCfile='docker-compose -f my-compose-file.yaml up -d' # creates containers using specified file

# php
alias compinstall='composer install' # installs dependencies from composer.json file
alias drushcr='drush cr' # rebuilds drupal cache
alias drushsql='drush sql-cli < my-database.sql' # creates drupal site from database file
alias drushupdb='drush updatedb' # applies database updates

# apt package manager
alias Aupdate='sudo apt update && sudo apt upgrade' # syncs packages with repo and completes any available package upgrades
alias Ainstalled='sudo apt list --installed' # lists all installed packages
alias install="sudo apt install --install-recommends $@" # installs all command line arguments
alias Asearch='sudo apt search ^stow$' # searches for package with exactly the name stow
alias Agrepinstalled='sudo apt list --installed | grep htop' # lists all installed packages with the name htop included
alias Arepos='cat /etc/apt/sources.list'

# basics 
alias timels='time ls -R1'  # times the specified command and shows how much of the time was in user space and how much of it was in kernel / system space
