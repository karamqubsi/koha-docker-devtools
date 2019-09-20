# Koha Docker DevTools
A basic Docker based development environment for Koha.

## Quick start

1. Start by cloning Koha project `git clone git://git.koha-community.org/koha.git` 
1. Clone this docker-devtools (to a separate directory). 
1. create .env file inside your cloned devtools folder `cp .env.example .env` 
1. Update your .env file with your local Koha directory location `KOHA_REPO_LOCATION=/PATH/TO/YOUR/LOCAL/KohaRepo`
1. Inside docker-devtools directory run `docker-compose build` then `docker-compose up`
1. You should be able to access Koha installation through ( http://localhost ( opac ) http://localhost:8080 ( Intranet).
1. You can start now editing Koha code from Koha project directory with your preferable IDE

## Requirements
Docker and docker-compose installed.
