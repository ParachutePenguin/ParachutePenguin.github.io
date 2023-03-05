FROM gitpod/workspace-full:latest

USER gitpod

# Install Julia
#RUN curl -sSL "https://julialang-s3.julialang.org/bin/linux/x64/$(curl -s https://julialang.org/downloads/ | grep -m1 -oE 'julia-[.0-9]+-linux-x86_64.tar.gz') " | tar -xzf - -C ~/
#ENV PATH="${PATH}:/home/gitpod/julia-1.7.0-linux-x86_64/bin"

# Install juliaup
RUN brew install juliaup
#RUN julia --eval 'using Pkg; Pkg.add(PackageSpec(url="https://github.com/invenia/juliaup"))'
#ENV PATH="${PATH}:/home/gitpod/.juliaup/bin"

# Install Pluto.jl
RUN julia -e 'using Pkg; Pkg.add("Franklin"); Pkg.precompile();'

EXPOSE 8000
