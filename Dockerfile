FROM rocker/rstudio:4.4

RUN apt update && apt -y install \
    build-essential zlib1g zlib1g-dev libssl-dev libcurl4-openssl-dev libpng-dev

RUN R --slave -e "install.packages('png', repos='https://cloud.r-project.org/'); library(png)"
RUN R --slave -e "install.packages('httpuv', repos='https://cloud.r-project.org/'); library('httpuv')"
RUN R --slave -e "install.packages('curl', repos='https://cloud.r-project.org/'); library('curl')"
RUN R --slave -e "install.packages('httr', repos='https://cloud.r-project.org/'); library('httr')"
RUN R --slave -e "install.packages('dplyr', repos='https://cloud.r-project.org/'); library(dplyr)"
RUN R --slave -e "install.packages('patchwork', repos='https://cloud.r-project.org/'); library(patchwork)"
RUN R --slave -e "install.packages('BiocManager', repos='https://cloud.r-project.org/'); library(BiocManager)"

RUN apt install -y python3-venv python3-pip python3-dev libglpk-dev

RUN R --slave -e "install.packages('leiden', repos='https://cloud.r-project.org/'); library(leiden)"
RUN R --slave -e "library(BiocManager); BiocManager::install('ontoProc')"
RUN R --slave -e "library(BiocManager); BiocManager::install('BiocStyle')"
RUN R --slave -e "library(ontoProc);"
#RUN R --slave -e "library(BiocManager); BiocManager::install('ontoProc')"
#RUN R --slave -e "library(BiocManager); BiocManager::install('BiocStyle')"
#RUN R --slave -e "install.packages('devtools'); library('devtools')"
#RUN R --slave -e "devtools::install_github('immunogenomics/presto')"

#RUN apt update && apt install -y libglpk-dev libmkl-rt
#RUN apt update && apt install -y build-essential gfortran libxml2-dev
#RUN R --slave -e "install.packages('igraph', repos='https://cloud.r-project.org/'); library(igraph)"

#RUN R --slave -e "install.packages('leiden', repos='https://cloud.r-project.org/'); library(leiden)"
#RUN R --slave -e "install.packages('Seurat', repos='https://cloud.r-project.org/'); library(Seurat)"

#RUN apt update && apt install -y libtirpc3 libtirpc-dev libicu-dev icu-devtools
#RUN wget http://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu70_70.1-2_amd64.deb && dpkg -f libicu70_70.1-2_amd64.deb

