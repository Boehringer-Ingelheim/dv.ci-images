# Build arguments
ARG OS_NAME=ubuntu
ARG OS_VERSION=jammy

# Fetch base image
FROM ${OS_NAME}:${OS_VERSION}

ARG R_VERSION=latest
ARG CRAN=https://packagemanager.posit.co/cran/__linux__/jammy/latest

# https://github.com/jgm/pandoc/tags
ARG PANDOC_VERSION=2.9.2.1
# https://github.com/quarto-dev/quarto-cli/tags
ARG QUARTO_VERSION=1.3.450
# https://github.com/lycheeverse/lychee/releases/
ARG LYCHEE_VERSION=0.15.1

# Set up environment 
ENV R_HOME=/usr/local/lib/R
ENV TZ=Etc/UTC
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# See https://rstudio.github.io/chromote/news/index.html#chromote-030
# To be fixed in the new development version so this line will go away soon
ENV CHROMOTE_HEADLESS="new"

COPY rocker_scripts/scripts /rocker_scripts
RUN /rocker_scripts/install_R_source.sh && \
    /rocker_scripts/setup_R.sh && \
    /rocker_scripts/install_pandoc.sh && \
    /rocker_scripts/install_quarto.sh 

COPY scripts /scripts
RUN /scripts/install_sys_deps.sh && \
    /scripts/install_r_pkgs.R

# TinyTex is installed in /root/.TinyTex and then linked to /root/bin, for it to be found we link to a location found in PATH
RUN ln -s /root/.TinyTeX/bin/*/* /usr/local/bin/

# Cleanup
RUN rm -rf /rocker_scripts /scripts 

CMD ["/init"]


