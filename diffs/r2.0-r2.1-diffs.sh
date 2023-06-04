#!/bin/bash

A_TAG=r2.0
B_TAG=HEAD
SCRATCH=/tmp/$$-2063

PROJECT=2057-ICE40HX4K-TQ144-breakout

OUT_NAME=2063-Z80-${A_TAG}-${B_TAG}-delta

A_TMP=${SCRATCH}/${A_TAG}
B_TMP=${SCRATCH}/${B_TAG}

mkdir -p ${A_TMP}
mkdir -p ${B_TMP}

git show ${A_TAG}:gerbers/${PROJECT}-F_Cu.gtl > ${A_TMP}/${PROJECT}-F_Cu.gtl || exit 1
git show ${A_TAG}:gerbers/${PROJECT}-B_Cu.gbl > ${A_TMP}/${PROJECT}-B_Cu.gbl || exit 1
git show ${A_TAG}:${PROJECT}.pdf> ${A_TMP}/${PROJECT}.pdf || exit 1

git show ${B_TAG}:gerbers/${PROJECT}-F_Cu.gtl > ${B_TMP}/${PROJECT}-F_Cu.gtl || exit 1
git show ${B_TAG}:gerbers/${PROJECT}-B_Cu.gbl > ${B_TMP}/${PROJECT}-B_Cu.gbl || exit 1
git show ${B_TAG}:${PROJECT}.pdf> ${B_TMP}/${PROJECT}.pdf || exit 1

# Generate a .pdf showing the diffs in the schematic drawings

compare -density 150 ${A_TMP}/${PROJECT}.pdf ${B_TMP}/${PROJECT}.pdf ${OUT_NAME}-schematic.pdf

# Generate .png files showing the diffs between the A and B PCB versions

gerbv --dpi=600 --border=0 --export=png --output=${A_TMP}.png ${A_TMP}/*.{gtl,gbl}
gerbv --dpi=600 --border=0 --export=png --output=${B_TMP}.png ${B_TMP}/*.{gtl,gbl}

compare ${A_TMP}.png ${B_TMP}.png ${OUT_NAME}-pcb.png

rm -rf ${SCRATCH}
