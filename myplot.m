% MYPLOT.m    Automatically set formatting options for figures/axes.
%
% MYPLOT(scale) Changes the default figure size to (600 px by 400 px)*scale
% and puts the origin at the lower left corner. Figure position is slightly
% different on mac/windows to account for taskbar size on windows (40 px).
% Default line widths and font sizes are scaled to match figure size.
% Optional name-value arguments allow for the figure scaling to be
% independent of line width and text scaling, as well as changing the
% interpreter to tex. Tips in the command window can be suppressed by
% setting quiet=true.
%
% The graphics root settings are changed such that all new figures during
% the open matlab session will use the applied settings. Opening a new
% matlab session will reset these changes. Also, calling myplot(0) will
% reset to factory defaults.

function myplot(scale,NVargs)

arguments
    scale (1,1) double = 1
    NVargs.figScale (1,1) double = scale
    NVargs.useLatex (1,1) logical = false % use tex by default
    NVargs.quiet (1,1) logical = false % show output tips by default
end

% reset factory defaults
if scale == 0
    set(groot, 'defaultLineLineWidth', get(groot, 'factoryLineLineWidth'))
    set(groot, 'defaultFunctionlineLineWidth', get(groot, 'factoryFunctionlineLineWidth'))
    set(groot, 'defaultImplicitFunctionlineLineWidth', get(groot, 'factoryImplicitFunctionlineLineWidth'))
    set(groot, 'defaultAxesLineWidth', get(groot, 'factoryAxesLineWidth'))
    set(groot, 'defaultColorbarLineWidth', get(groot, 'factoryColorbarLineWidth'))
    set(groot, 'defaultTextFontName', get(groot, 'factoryTextFontName'))
    set(groot, 'defaultAxesFontName', get(groot, 'factoryAxesFontName'))
    set(groot, 'defaultTextInterpreter', get(groot, 'factoryTextInterpreter'))
    set(groot, 'defaultAxesTickLabelInterpreter', get(groot, 'factoryAxesTickLabelInterpreter'))
    set(groot, 'defaultColorbarTickLabelInterpreter', get(groot, 'factoryColorbarTickLabelInterpreter'))
    set(groot, 'defaultLegendInterpreter', get(groot, 'factoryLegendInterpreter'))
    set(groot, 'defaultTextFontSize', get(groot, 'factoryTextFontSize'))
    set(groot, 'defaultAxesFontSize', get(groot, 'factoryAxesFontSize'))
    set(groot, 'defaultColorbarFontSize', get(groot, 'factoryColorbarFontSize'))
    set(groot, 'defaultFigurePosition', get(groot, 'factoryFigurePosition'))
    fprintf('Graphics defaults have been reset.\n')
    return
end

% for simplicity, these values are fixed but can be overwritten in a script
% by changing the figure, axis, or plot settings.
lineLineWd  = 1.5  * scale;
axesLineWd  = 0.75 * scale;
textFontSz  = 10   * scale;
axesFontSz  = 12   * scale;
if scale ~= NVargs.figScale
    figureWd    = 600  * NVargs.figScale;
    figureHt    = 400  * NVargs.figScale;
else
    figureWd    = 600  * scale;
    figureHt    = 400  * scale;
end

% line width
set(groot, 'defaultLineLineWidth', lineLineWd)
set(groot, 'defaultFunctionlineLineWidth', lineLineWd)
set(groot, 'defaultImplicitFunctionlineLineWidth', lineLineWd)
set(groot, 'defaultAxesLineWidth', axesLineWd)
set(groot, 'defaultColorbarLineWidth', axesLineWd)

% font size
set(groot, 'defaultTextFontSize', textFontSz)
set(groot, 'defaultColorbarFontSize', textFontSz)
set(groot, 'defaultAxesFontSize', axesFontSz)

% figure size
if ismac
    x = 20; y = 20;
else
    x = 11; y = 51;
end
set(groot, 'defaultFigurePosition', [x, y, figureWd, figureHt])

% set interpreter
if NVargs.useLatex == true
    set(groot, 'defaultTextInterpreter', 'latex')
    set(groot, 'defaultAxesTickLabelInterpreter', 'latex')
    set(groot, 'defaultColorbarTickLabelInterpreter', 'latex')
    set(groot, 'defaultLegendInterpreter', 'latex')
else
    set(groot, 'defaultTextInterpreter', get(groot, 'factoryTextInterpreter'))
    set(groot, 'defaultAxesTickLabelInterpreter', get(groot, 'factoryAxesTickLabelInterpreter'))
    set(groot, 'defaultColorbarTickLabelInterpreter', get(groot, 'factoryColorbarTickLabelInterpreter'))
    set(groot, 'defaultLegendInterpreter', get(groot, 'factoryLegendInterpreter'))
end

% command window outputs
if NVargs.quiet == false
    fprintf('\nScaling\n')
    fprintf('Line, Axes linewidth = %.2f, %.2f\n',lineLineWd, axesLineWd)
    fprintf('Axes, Text font size = %.2f, %.2f\n',axesFontSz, textFontSz)
    
    fprintf('\nOverride figure size\n')
    fprintf('set(gcf, ''Position'', [%.f, %.f, %.f, %.f])\n\n',x,y,figureWd,figureHt)
    fprintf('Export pdf\n')
    fprintf("exportgraphics(gcf,'filename.pdf','ContentType','vector')\n\n")
    fprintf('Export png\n')
    fprintf("exportgraphics(gcf,'filename.png','Resolution','300')\n\n")
end

end