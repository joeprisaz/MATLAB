function myplot(scale,~,~)
% my default plotting settings
% no arguments: scale factor 1
% one argument: scale factor (interpreter set to latex)
% two arguments: scale factor + set interpreter to default (tex)
    % useful for plots w/ tex syntax, but want CMU Serif font
% three arguments: sans font

setInterpreter = true;
sans = false;
if nargin < 1
    scale = 1;
elseif nargin > 1
    setInterpreter = false;
    if nargin > 2
        sans = true;
    end
end

if scale == 0
    % reset factory defaults
    set(groot, 'defaultLineLineWidth', get(groot, 'FactoryLineLineWidth'))
    set(groot, 'defaultFunctionlineLineWidth', get(groot, 'FactoryFunctionlineLineWidth'))
    set(groot, 'defaultImplicitFunctionlineLineWidth', get(groot, 'FactoryImplicitFunctionlineLineWidth'))
    set(groot, 'defaultAxesLineWidth', get(groot, 'FactoryAxesLineWidth'))
    set(groot, 'defaultTextFontName', get(groot, 'FactoryTextFontName'))
    set(groot, 'defaultAxesFontName', get(groot, 'FactoryAxesFontName'))
    set(groot, 'defaultTextInterpreter', get(groot, 'factoryTextInterpreter'))
    set(groot, 'defaultAxesTickLabelInterpreter', get(groot, 'factoryAxesTickLabelInterpreter'))
    set(groot, 'defaultLegendInterpreter', get(groot, 'factoryLegendInterpreter'))
    set(groot, 'defaultTextFontSize', get(groot, 'FactoryTextFontSize'))
    set(groot, 'defaultAxesFontSize', get(groot, 'FactoryAxesFontSize'))
    set(groot, 'defaultFigureUnits', get(groot, 'FactoryFigureUnits'))
    set(groot, 'defaultFigurePosition', get(groot, 'FactoryFigurePosition'))
    return
end

% lines
set(groot, 'defaultLineLineWidth', 1.5 * scale)
set(groot, 'defaultFunctionlineLineWidth', 1.5 * scale)
set(groot, 'defaultImplicitFunctionlineLineWidth', 1.5 * scale)
set(groot, 'defaultAxesLineWidth', 0.75 * scale)

% fonts
if sans == true
    set(groot, 'defaultTextFontName', 'DejaVu Sans')
    set(groot, 'defaultAxesFontName', 'DejaVu Sans')
else
    set(groot, 'defaultTextFontName', 'CMU Serif')
    set(groot, 'defaultAxesFontName', 'CMU Serif')
end
set(groot, 'defaultTextFontSize', 10 * scale)
set(groot, 'defaultAxesFontSize', 12 * scale)

% interpreter
if setInterpreter == true
    set(groot, 'defaultTextInterpreter', 'latex')
    set(groot, 'defaultAxesTickLabelInterpreter', 'latex')
    set(groot, 'defaultLegendInterpreter', 'latex')
else
    set(groot, 'defaultTextInterpreter', get(groot, 'factoryTextInterpreter'))
    set(groot, 'defaultAxesTickLabelInterpreter', get(groot, 'factoryAxesTickLabelInterpreter'))
    set(groot, 'defaultLegendInterpreter', get(groot, 'factoryLegendInterpreter'))
end

% sizes
set(groot, 'defaultFigureUnits', 'inches')
w = 7.0 * scale; h = 4.5 * scale;
set(groot, 'defaultFigurePosition', [0.5, 0.5, w, h])
% default figure position in inches
% set(groot, 'defaultFigurePosition', [2.7639, 2.7639, 8.3333, 6.9444])

% command window outputs
fprintf('\n') % need separate line to not have color
try
    cprintf('_[0 0 0.8]', 'Scaling\n')
catch
    fprintf('Scaling\n')
end
fprintf(['\nLine linewidth = ',num2str(1.5*scale),'\n'])
fprintf(['Axes linewidth = ',num2str(0.75*scale),'\n'])
if setInterpreter == true
    fprintf(['Text font size = ',num2str(10*scale),' (latex)\n'])
    fprintf(['Axes font size = ',num2str(12*scale),' (latex)\n',])
else
    fprintf(['Text font size = ',num2str(10*scale),' (tex)\n'])
    fprintf(['Axes font size = ',num2str(12*scale),' (tex)\n',])   
end

fprintf('\n') % need separate line to not have color
try
    cprintf('_[0 0.4 0]', 'Commonly used commands\n')
    cprintf('*black', ' \nOverride figure size\n')
catch
    fprintf('Commonly used commands\n')
    fprintf(' \nOverride figure size\n')
end
fprintf(['set(gcf, ''Position'', [0.5, 0.5, ',num2str(w),', ',num2str(h),'])\n\n'])

try
    cprintf('*black', 'Reduce white space\n')
catch
    fprintf('Reduce white space\n')
end
fprintf("set(gca, 'LooseInset', get(gca,'TightInset') + 0.01)\n\n")

try
    cprintf('*black', 'Export pdf\n')
catch
    fprintf('Export pdf\n')
end
fprintf("exportgraphics(gcf,'filename.pdf','ContentType','vector')\n\n")

try
    cprintf('*black', 'Export png\n')
catch
    fprintf('Export png\n')
end
fprintf("exportgraphics(gcf,'filename.png','Resolution','600')\n\n")

end