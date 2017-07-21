# get the base image
FROM rocker/verse:3.4.1

MAINTAINER Joana Seguin <jseguin@ecology.uni-kiel.de>

COPY . /mytestpkg

# go into the repo directory
RUN . /etc/environment \

 && apt-get update -y \
 && apt-get install -y libudunits2-dev libgdal-dev libgsl0-dev gdal-bin libgeos-dev libpng-dev libproj-dev \

 && R --vanilla "options(repos='https://mran.microsoft.com/snapshot/2017-07-20'); devtools::install('/mytestpkg', dep= TRUE)" \
 && R --vanilla "rmarkdown::render('/mytestpkg/vignettes/challenge.Rmd')"
