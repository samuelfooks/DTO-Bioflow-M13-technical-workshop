FROM rocker/shiny:4.5.0

# Install required system dependencies for R packages
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libudunits2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libfontconfig1-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    && rm -rf /var/lib/apt/lists/*

# Install required R packages
RUN R -e "install.packages(c('shiny', 'arrow', 'leaflet', 'DT', 'dplyr', 'sf', 'leaflet.extras', 'shinythemes'))"

# Copy the R Markdown file to the container
COPY view_parquet.Rmd /srv/shiny-server/view_parquet.Rmd

# Expose the port for the Shiny app
EXPOSE 3838

# Run the Shiny app
CMD ["R", "-e", "rmarkdown::run('/srv/shiny-server/view_parquet.Rmd', shiny_args = list(host = '0.0.0.0', port = 3838))"]