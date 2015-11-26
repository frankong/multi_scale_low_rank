# Multi-scale Low Rank Matrix Decomposition Matlab Code
This is a collection of codes in C or in MATLAB to reproduce some of
the results that are described in the paper:
Frank Ong and Michael Lustig
"Beyond Low Rank + Sparse: Multi-scale Low Rank Matrix Decomposition"
https://arxiv.org/abs/1507.08751

You are encouraged to modify or distribute this code in any way you want. 
However, please acknowledge this code and cite the papers appropriately. 
For any questions about the code, please contact me (Frank Ong) at:
frankong@berkeley.edu. 

##Setup:

Run setpath.m to add all the paths before running any demos
After running setpath.m, try demo_hanning_decom.m for a quick and
simple demonstration.

Type "help function" to see documentation for the particular function

##MATLAB Demos:

      demo_hanning_decom: Perform Multi-scale Low Rank Decomposition on a synthetic matrix with hanning matrices

      demo_face_decom: Perform Multi-scale low rank decomposition on a face image dataset

      demo_dce_mri_decom: Perform Multi-scale low rank decomposition on a fully sampled Dynamic Contrast Enhanced image dataset



