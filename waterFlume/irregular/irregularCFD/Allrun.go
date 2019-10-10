#!/bin/bash

source setFields.go


decomposePar 
mpirun -np 16 waveFoam -parallel
reconstructPar
rm -rf processor*
