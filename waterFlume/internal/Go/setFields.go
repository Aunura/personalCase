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
rm system/topoSetDict
cp system/topoSetDict.large system/topoSetDict
topoSet
refineMesh -overwrite

rm system/topoSetDict
cp system/topoSetDict.small system/topoSetDict
topoSet
refineMesh -overwrite

setWaveField


