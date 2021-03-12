function myplot(scale)

if nargin < 1
    scale = 1;
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
set(groot, 'defaultTextFontName', 'CMU Serif')
set(groot, 'defaultAxesFontName', 'CMU Serif')
set(groot, 'defaultTextInterpreter', 'latex')
set(groot, 'defaultAxesTickLabelInterpreter', 'latex')
set(groot, 'defaultLegendInterpreter', 'latex')
set(groot, 'defaultTextFontSize', 10 * scale)
set(groot, 'defaultAxesFontSize', 12 * scale)

% sizes
set(groot, 'defaultFigureUnits', 'inches')
w = 7.0 * scale; h = 4.5 * scale;
set(groot, 'defaultFigurePosition', [0.5, 0.5, w, h])
% default figure position in inches
% set(groot, 'defaultFigurePosition', [2.7639, 2.7639, 8.3333, 6.9444])

fprintf('\n')
try
    cprintf('_[0 0 0.8]', 'Scaling\n')
catch
    fprintf('Scaling\n')
end
fprintf(['\nLine linewidth = ',num2str(1.5*scale),'\n'])
fprintf(['Axes linewidth = ',num2str(0.75*scale),'\n'])
fprintf(['Text font size = ',num2str(10*scale),'\n'])
fprintf(['Axes font size = ',num2str(12*scale),'\n'])

fprintf('\n')
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