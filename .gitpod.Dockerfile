FROM gitpod/workspace-full:latest

USER gitpod

#RUN juliaup install

#ENV JULIA_NUM_THREADS=auto

#RUN juliaup default 1.6

# Install packages
#RUN julia -e 'using Pkg; \
#            Pkg.add(["Pluto", "PlutoUI"])'

# Install Julia via juliaup
RUN curl -sSL "https://julialang-s3.julialang.org/bin/julia-1.6-latest-linux-x86_64.tar.gz" -o julia.tar.gz && \
    tar xzf julia.tar.gz && \
    rm -rf julia.tar.gz && \
    mv julia-* /usr/local && \
    ln -fs /usr/local/julia-*/bin/julia /usr/local/bin/julia && \
    #julia -e 'using Pkg; Pkg.add("Pluto"); using Pluto; Pluto.run()'
    julia -e 'using Pkg; \
            Pkg.add(["Pluto", "PlutoUI"])'

# Setup Pluto environment variable
ENV PLUTO_PORT=8000
ENV PLUTO_BIND=0.0.0.0

# Expose port 8000
EXPOSE 8000
