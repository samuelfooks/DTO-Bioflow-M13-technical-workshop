FROM rocker/shiny:latest

RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev libssl-dev \
    libudunits2-dev libgdal-dev libgeos-dev libproj-dev

RUN R -e "install.packages(c('arrow', 'sf', 'leaflet', 'dplyr', 'shiny', 'shinyjs', 'shinycssloaders', 'shinyWidgets', 'shinyBS', 'shinythemes', 'shinydashboard', 'DT'))"

COPY shiny_app.R /srv/shiny-server/app.R

EXPOSE 3838