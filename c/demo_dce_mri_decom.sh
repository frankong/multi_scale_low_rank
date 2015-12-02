#! /bin/bash


in="data/dce"

rho=0.5
niter=300
mflags=3
flags=3
skip=4


export DEBUG_LEVEL=5

bartview.py $in&

# Do multi-scale low rank decomposition
bart lrmatrix -d -j $skip -H -m $mflags -f $flags -p $rho -i $niter $in $in"_decom"

# Plot
bartview.py $in"_decom"&
