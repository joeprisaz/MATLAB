# MATLAB
MATLAB startup script and other visualization scripts. This folder should be located in the user/Documents folder to be automatically added to the MATLAB path.

## `startup.m`
Runs when MATLAB is opened. Currently unused.

## `myplot.m`
Automatically rescales various figure/axes elements. A scale factor may be input as `myplot(scale)` and with no inputs `scale = 1`. The factory defaults can be reset by `myplot(0)` and are also reset when opening a new MATLAB session. The text interpreter for common axis elements may be changed from the default TeX to LaTeX via `myplot(scale,"useLatex",true)`.

## `inferno.m`, `magma.m`, etc.
Colormaps not included with MATLAB by default.