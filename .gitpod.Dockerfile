FROM gitpod/workspace-full:latest

USER gitpod

RUN juliaup install

ENV JULIA_NUM_THREADS=auto

RUN juliaup default 1.6

# Install packages
RUN julia -e 'using Pkg; \
            Pkg.add(["Pluto", "PlutoUI"])'

# Setup Pluto environment variable
ENV PLUTO_PORT=8000
ENV PLUTO_BIND=0.0.0.0

# Expose port 8000
EXPOSE 8000
