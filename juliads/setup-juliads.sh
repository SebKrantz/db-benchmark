# install julia

wget https://julialang-s3.julialang.org/bin/linux/x64/1.10/julia-1.10.5-linux-x86_64.tar.gz
tar -xvf julia-1.10.5-linux-x86_64.tar.gz
sudo mv julia-1.10.5 /opt
rm julia-1.10.5-linux-x86_64.tar.gz
# put to paths
echo 'export JULIA_HOME=/opt/julia-1.10.5' >> path.env
echo 'export PATH=$PATH:$JULIA_HOME/bin' >> path.env
# note that cron job must have path updated as well

source path.env

# install julia InMemoryDatasets and csv packages
julia -q -e 'using Pkg; Pkg.add(["DataFrames", "InMemoryDatasets","DLMReader", "PooledArrays", "Arrow", "CSV"])'
julia -q -e 'include("$(pwd())/_helpers/helpers.jl"); pkgmeta = getpkgmeta("InMemoryDatasets"); println(string(pkgmeta["version"])); pkgmeta = getpkgmeta("DLMReader"); println(string(pkgmeta["version"]))'

./juliadf/ver-juliadf.sh
