# EmbryoScripts

This repository contains scripts referred to by Pokrass et al. 2020 in Developmental Cell - "Cell Cycle-Dependent Signaling Dynamics Direct Fate Specification in the Mammalian Preimplantation Embryo"

The script ICMvsTE_script.m is a MATLAB script that will take xyz coords and CDX2 expression data from a single embryo and define each cell as ICM vs TE based on its position within the embryo.  It will also test this definition against a CDX2-based definition and output two 3D surface plots to compare performance.

Other embryos can be put through this script if they conform to the data structure:
Rows = cells
Columns 1-3 = each refer to the x, y, and z coordinate of cells in the embryo
Column 4 = CDX2 expression values, in this case collected from an immunofluorescence for the CDX2 protein.
