#!/bin/bash

rm -rf 0*
rm -rf 1*
rm -rf 2*
rm -rf 3*
rm -rf 4*
rm -rf 5*
rm -rf 6*
rm -rf 7*
rm -rf 8*
rm -rf 9*
cp -r constant/0.org 0
rm -rf processor*
blockMesh
setWaveField


decomposePar

mpirun -np 16 waveFoam -parallel | tee internalSolitary.log
reconstructPar
pkill waveFoam
