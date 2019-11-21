FROM jupyter/r-notebook:ad3574d3c5c7

COPY in-class-exercises ${HOME}/in-class-exercises
COPY assignments ${HOME}/assignments

USER root
RUN apt-get update && apt-get install --yes libudunits2-dev
USER $NB_USER

RUN R -e "devtools::install_github('thomasp85/patchwork')"
RUN R -e "install.packages('sf', repos=c('http://cran.rstudio.com'))"
RUN R -e "install.packages('ggmap', repos=c('http://cran.rstudio.com'))"
RUN R -e "install.packages('here', repos=c('http://cran.rstudio.com'))"
RUN R -e "install.packages('plotly', repos=c('http://cran.rstudio.com'))"
RUN R -e "install.packages('ggrepel', repos=c('http://cran.rstudio.com'))"

# RUN conda install -y -c conda-forge r-tidyr=1.0.0
