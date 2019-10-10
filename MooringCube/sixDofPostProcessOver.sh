#!/bin/bash

PFAD=log.overWave
EXCL=10

# cat   list a files content on a screen / in a pipeline (using "|")
# grep  returns all lines matching a certain string
# cut   cuts out e.g. fields "-f" (here 3rd until END [-]) specified through delminiter "-d' '" (here blanks)
# sed   remove complete lines containing a certain string (here "ClockTime")
# sed-i includes Header
# head  deletes last 10 lines (for scaling reasons, as last lines are often already diverged)
# tr    remove certain strings (here "(" and ")")
#paste  merge two files line by line

################ CLEAR OLD DATA ################
rm -r data
mkdir data
##################### TIME #####################
cat $PFAD | grep 'Time = ' | cut -d' ' -f3- | sed '/ClockTime/d' > Time.dat


############### LINEAR VELOCITY ################
cat $PFAD | grep 'Linear velocity: '  | tr -d '(' | tr -d ')'| cut -d' ' -f7-  > LinearVelocityTemp.dat
paste Time.dat LinearVelocityTemp.dat > data/LinearVelocity.dat

############### ANGULAR VELOCITY ################
cat $PFAD | grep 'Angular velocity: '  | tr -d '(' | tr -d ')'| cut -d' ' -f7-  > AngularVelocityTemp.dat
paste Time.dat AngularVelocityTemp.dat > data/AngularVelocity.dat
############### CENTEROFROTATION ################
cat $PFAD | grep 'Centre of rotation: '  | tr -d '(' | tr -d ')'| cut -d' ' -f8-  > CentreOfRotationTemp.dat
paste Time.dat CentreOfRotationTemp.dat > data/CentreOfRotation.dat

############### ORIENTATION  ###############
cat $PFAD | grep 'Orientation' | tr -d '(' | tr -d ')' | cut -d' ' -f6-> OrientationTemp.dat
paste Time.dat OrientationTemp.dat > data/Orientation.dat
rm Time.dat LinearVelocityTemp.dat AngularVelocityTemp.dat CentreOfRotationTemp.dat OrientationTemp.dat
