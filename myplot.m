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

function myplot(scale,varargin)

useLatex = false; % default to tex

% parse input
if nargin < 1
    scale = 1; % set scale factor to 1
elseif nargin == 1
    % do nothing
elseif nargin > 1
    useLatex = varargin{2}; % set the interpreter manually
end

% reset factory defaults
if scale == 0
    set(groot, 'defaultLineLineWidth', get(groot, 'FactoryLineLineWidth'))
    set(groot, 'defaultFunctionlineLineWidth', get(groot, 'FactoryFunctionlineLineWidth'))
    set(groot, 'defaultImplicitFunctionlineLineWidth', get(groot, 'FactoryImplicitFunctionlineLineWidth'))
    set(groot, 'defaultAxesLineWidth', get(groot, 'FactoryAxesLineWidth'))
    set(groot, 'defaultColorbarLineWidth', get(groot, 'FactoryColorbarLineWidth'))
    set(groot, 'defaultTextFontName', get(groot, 'FactoryTextFontName'))
    set(groot, 'defaultAxesFontName', get(groot, 'FactoryAxesFontName'))
    set(groot, 'defaultTextInterpreter', get(groot, 'FactoryTextInterpreter'))
    set(groot, 'defaultAxesTickLabelInterpreter', get(groot, 'FactoryAxesTickLabelInterpreter'))
    set(groot, 'defaultColorbarTickLabelInterpreter', get(groot, 'FactoryColorbarTickLabelInterpreter'))
    set(groot, 'defaultLegendInterpreter', get(groot, 'FactoryLegendInterpreter'))
    set(groot, 'defaultTextFontSize', get(groot, 'FactoryTextFontSize'))
    set(groot, 'defaultAxesFontSize', get(groot, 'FactoryAxesFontSize'))
    set(groot, 'defaultColorbarFontSize', get(groot, 'FactoryColorbarFontSize'))
    set(groot, 'defaultFigurePosition', get(groot, 'FactoryFigurePosition'))
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
if useLatex == true
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