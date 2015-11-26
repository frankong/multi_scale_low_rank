This is a collection of Matlab functions and demos to reproduce some of
the results that are described in the paper:
Frank Ong and Michael Lustig
"Beyond Low Rank + Sparse: Multi-scale Low Rank Matrix Decomposition"

You are encouraged to modify/distribute this code in any way you want. 
However, please acknowledge this code and cite the papers appropriately. 
For any questions about the code, please contact me at:
frankong@berkeley.edu. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Setup:

Run setpath.m to add all the paths before running any demos
After running setpath.m, try demo_hanning.m for a quick and
simple demonstration.

Type "help function" to see documentation for the particular function


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Demos:

      demo_hanning: Perform Multi-scale Low Rank Decomposition on a
      synthetic matrix with hanning matrices

      demo_face: Perform Multi-scale low rank decomposition on a face
      image dataset

      demo_hanning: Perform Multi-scale low rank decomposition on a fully
      sampled Dynamic Contrast Enhanced image dataset

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Demos of the multi-scale low rank applied on surveillance videos and
rating matrices are absent in this Matlab package as they are simply too
slow to run on MATLAB. They are/will be available along with the
Berkeley Advanced Reconstruction Toolbox (written in C):
     https://github.com/mikgroup/bart

For any questions, comments and contributions, please contact
Frank Ong (frankong@berkeley.edu)



