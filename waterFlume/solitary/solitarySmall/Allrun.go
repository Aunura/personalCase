#!/bin/bash

source setFields.go

decomposePar

mpirun -np 8 waveFoam -parallel | tee internalSolitary.log
reconstructPar
