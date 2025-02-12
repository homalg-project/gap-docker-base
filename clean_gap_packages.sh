#!/bin/bash

set -e

gap_packages_artifact_hash=$(julia --cpu-target "generic" -e 'using Artifacts; using GAP; print(artifact_hash("gap_packages", abspath(pathof(GAP), "..", "..", "Artifacts.toml")))')

echo $gap_packages_artifact_hash

cd ~/.julia/artifacts

mv $gap_packages_artifact_hash bak

mkdir $gap_packages_artifact_hash

[ -d bak/gapdoc/ ] && mv bak/gapdoc/ $gap_packages_artifact_hash
[ -d bak/primgrp/ ] && mv bak/primgrp/ $gap_packages_artifact_hash
[ -d bak/smallgrp/ ] && mv bak/smallgrp/ $gap_packages_artifact_hash
[ -d bak/transgrp/ ] && mv bak/transgrp/ $gap_packages_artifact_hash
[ -d bak/autpgrp/ ] && mv bak/autpgrp/ $gap_packages_artifact_hash
[ -d bak/alnuth/ ] && mv bak/alnuth/ $gap_packages_artifact_hash
[ -d bak/crisp/ ] && mv bak/crisp/ $gap_packages_artifact_hash
[ -d bak/ctbllib/ ] && mv bak/ctbllib/ $gap_packages_artifact_hash
[ -d bak/factint/ ] && mv bak/factint/ $gap_packages_artifact_hash
[ -d bak/fga/ ] && mv bak/fga/ $gap_packages_artifact_hash
[ -d bak/irredsol/ ] && mv bak/irredsol/ $gap_packages_artifact_hash
[ -d bak/laguna/ ] && mv bak/laguna/ $gap_packages_artifact_hash
[ -d bak/polenta/ ] && mv bak/polenta/ $gap_packages_artifact_hash
[ -d bak/polycyclic/ ] && mv bak/polycyclic/ $gap_packages_artifact_hash
[ -d bak/repsn/ ] && mv bak/repsn/ $gap_packages_artifact_hash # needed by GroupRepresentationsForCAP
[ -d bak/resclasses/ ] && mv bak/resclasses/ $gap_packages_artifact_hash
[ -d bak/sophus/ ] && mv bak/sophus/ $gap_packages_artifact_hash
[ -d bak/tomlib/ ] && mv bak/tomlib/ $gap_packages_artifact_hash
[ -d bak/utils/ ] && mv bak/utils/ $gap_packages_artifact_hash # needed since GAP.jl commit 36d2092d225905e4dfc99d72725fd141be6bcf32
[ -d bak/packagemanager/ ] && mv bak/packagemanager/ $gap_packages_artifact_hash

rm -rf bak

cd $gap_packages_artifact_hash

# remove unused data
rm -rf primgrp/data
rm -rf smallgrp/id*
rm -rf smallgrp/small*
rm -rf transgrp/data
rm -rf irredsol/data
rm -rf irredsol/fp
rm -rf ctbllib/data
rm -rf ctbllib/doc
rm -rf ctbllib/doc2
rm -rf tomlib/data
# this leads to unbound global variables
#rm -rf factint/tables
