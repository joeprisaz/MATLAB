# MATLAB
MATLAB startup script and other visualization scripts. This folder should be located in the user/Documents folder to  

## `startup.m`
Runs when MATLAB is opened. Currently unused.

## `myplot.m`
Automatically rescales various figure/axes elements and sets the defualt font to CMU Serif. A scale factor may be input as `myplot(scale)`, and the text interpreter will be set to LaTeX. If a second argument is given, for example, `myplot(1,1)` the default TeX interpreter will be used. Finally, if a third argument is given, TeX will be used and the font will be set to DejaVu Sans.
