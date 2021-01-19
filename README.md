# NURBS-Toolbox
MATLAB Toolbox including a collection of routines for the creation, and manipulation of Non-Uniform Rational B-Splines (NURBS), based on the NURBS toolbox by Mark Spink.

Most Algorithms are based on the monograph: Piegl, L., & Tiller, W. (1997). The NURBS book. Springer Science & Business Media. http://dx.doi.org/10.1007/978-3-642-59223-2

This is a fork of the octave Sourceforge repository https://sourceforge.net/p/octave/nurbs/ci/default/tree/ :
Version: 1.4.2
Date: 2020-02-05
Author: Mark Spink, Daniel Claxton, Carlo de Falco, Rafael Vazquez
Maintainer: Carlo de Falco and Rafael Vazquez
Title: Nurbs.


# Functions
Basic operations for NURBS curves, surfaces and volumes
 - nrbmak
 - nrbkntins
 - nrbdegelev
 - nrbderiv
 - nrbdeval
 - nrbeval
 - nrbeval_der_w
 - nrbeval_der_p
 - nrbinverse
 - crvkntremove
Operations for constructing NURBS curves and surfaces
 - nrbtform
 - nrbreverse
 - nrbtransp
 - nrbpermute
 - nrbline
 - nrbcirc
 - nrbrect
 - nrbsquare
 - nrb4surf
 - nrbspheretiling
 - nrbspheretile
 - nrbcylind
 - nrbextract
 - nrbextrude
 - nrbrevolve
 - nrbruled
 - nrbcoons
 - nrbtestcrv
 - nrbtestsrf
 - nrbclamp
 - nrbunclamp
 - nrbmultipatch
 - nrbglue
 - nrbmodp
 - nrbmodw
Plot and export
 nrbplot
 nrbctrlplot
 nrbkntplot
 nrbexport
 nrb2iges
B-Spline functions
 bspeval
 bspderiv
 bspkntins
 bspdegelev
 bspinterpcrv
 bspinterpsurf
 basisfun
 basisfunder
 basiskntins
 findspan
 numbasisfun
 tbasisfun
B-splines geometric entities
 curvederivcpts
 curvederiveval
 surfderivcpts
 surfderiveval
NURBS geometric entities and functions
 nrbbasisfun
 nrbmeasure
 nrbbasisfunder
 nrbnumbasisfun
 nrbcrvderiveval
 nrbsurfderiveval
Knots construction and refinement
 aveknt
 kntuniform
 kntrefine
 kntbrkdegreg
 kntbrkdegmult
Vector and Transformation Utilities 
 vecnorm
 vecmag
 vecmag2
 vecangle
 vecdot
 veccross
 vecrot
 vecrotx
 vecroty
 vecrotz
 vecscale
 vectrans
 
 

# Version Changes
Summary of important user-visible changes for nurbs 1.4.2:
-------------------------------------------------------------------
* remove use of deprecated functionality in oct-files

Summary of important user-visible changes for nurbs 1.4.1:
-------------------------------------------------------------------
* inst/nrbglue: added new function
* inst/nrbinverse: add a way to recognize non-convergence

Summary of important user-visible changes for nurbs 1.4.0:
-------------------------------------------------------------------
* inst/basiskntins: return the identity when there is no insertion
* inst/nrbderiv: 3rd and 4th order derivatives
* inst/nrbdeval: 3rd and 4th order derivatives
* inst/nrbruled: extended to trivariates
* inst/nrbmak: added the possibility to normalize the knot vector
* inst/vecnormalize: renamed the old function vecnorm

