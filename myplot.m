% myplot.m    Automatically set formatting options for figures/axes.
%
% Increases the default figure size and puts the origin at the lower left
% corner. Adjusts the default line widths to match larger figure size. 
% Position is slightly different on mac/windows to account for
% taskbar size on windows (40 px). Text interpreter may be changed from
% default tex to latex for common axis elements.
%
% The graphics root settings are changed such that all new figures during
% the open matlab session will use the applied settings. Opening a new
% matlab session will reset these changes. Also, calling myplot(0) will
% reset to factory defaults.

function myplot(scale,NVargs)

arguments
    scale (1,1) double = 1
    NVargs.figScae
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
figureWd    = 600  * scale;
figureHt    = 400  * scale;

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