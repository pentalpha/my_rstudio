FROM rocker/rstudio:4.4

RUN apt update && apt -y install \
    build-essential zlib1g zlib1g-dev libssl-dev libcurl4-openssl-dev libpng-dev

RUN R --slave -e "install.packages('png', repos='https://cloud.r-project.org/'); library(png)"
RUN R --slave -e "install.packages('httpuv', repos='https://cloud.r-project.org/'); library('httpuv')"
RUN R --slave -e "install.packages('curl', repos='https://cloud.r-project.org/'); library('curl')"
RUN R --slave -e "install.packages('httr', repos='https://cloud.r-project.org/'); library('httr')"
RUN R --slave -e "install.packages('dplyr', repos='https://cloud.r-project.org/'); library(dplyr)"
RUN R --slave -e "install.packages('patchwork', repos='https://cloud.r-project.org/'); library(patchwork)"
RUN R --slave -e "install.packages('devtools'); library('devtools')"
RUN R --slave -e "devtools::install_github('immunogenomics/presto')"
RUN R --slave -e "install.packages('Seurat', repos='https://cloud.r-project.org/'); library(Seurat)"