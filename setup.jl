using Pkg
Pkg.clone("https://github.com/JuliaPy/PyCall.jl")
ENV["PYTHON"] = "/usr/bin/python3"
Pkg.build("PyCall")
Pkg.add("PyPlot")
Pkg.add("ProgressMeter")
