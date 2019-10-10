#!/bin/sh

rm -rf processor*
decomposePar
mpirun -np 20 overWaveFoam -parallel | tee IHFCase.foam
reconstructPar


#------------------------------------------------------------------------------
