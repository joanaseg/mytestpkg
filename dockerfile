# get the base image
FROM rocker/verse:3.4.1

MAINTAINER Joana Seguin <jseguin@ecology.uni-kiel.de>

COPY . /mytestpkg

# go into the repo directory
RUN . /etc/environment \

  && R --vanilla "devtools::install('/mytestpkg', dep= TRUE)" \

  && R --vanilla "rmarkdown::render('/mytestpkg/vignettes/challenge.Rmd')"

