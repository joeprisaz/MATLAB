% reset factory defaults
set(groot, 'defaultLineLineWidth', get(groot, 'FactoryLineLineWidth'))
set(groot, 'defaultFunctionlineLineWidth', get(groot, 'FactoryFunctionlineLineWidth'))
set(groot, 'defaultAxesLineWidth', get(groot, 'FactoryAxesLineWidth'))
set(groot, 'defaultTextFontName', get(groot, 'FactoryTextFontName'))
set(groot, 'defaultAxesFontName', get(groot, 'FactoryAxesFontName'))
set(groot, 'defaultTextFontSize', get(groot, 'FactoryTextFontSize'))
set(groot, 'defaultAxesFontSize', get(groot, 'FactoryAxesFontSize'))
set(groot, 'defaultFigureUnits', get(groot, 'FactoryFigureUnits'))
set(groot, 'defaultFigurePosition', get(groot, 'FactoryFigurePosition'))

% lines
set(groot, 'defaultLineLineWidth', 1.5)
set(groot, 'defaultFunctionlineLineWidth', 1.5)
set(groot, 'defaultImplicitFunctionlineLineWidth', 1.5)
set(groot, 'defaultAxesLineWidth', 1.0)

% fonts
set(groot, 'defaultTextFontName', 'CMU Serif')
set(groot, 'defaultAxesFontName', 'CMU Serif')
set(groot, 'defaultTextFontSize', 10)
set(groot, 'defaultAxesFontSize', 12)

% sizes
set(groot, 'defaultFigureUnits', 'inches')
set(groot, 'defaultFigurePosition', [0.5, 0.5, 7.0, 4.5])
% default figure position in inches
% set(groot, 'defaultFigurePosition', [2.7639, 2.7639, 8.3333, 6.9444])

fprintf('\n')
try
    cprintf('-comment',  'Commonly used commands\n')
    cprintf('*black', ' \nOverride figure size\n')
catch
    fprintf('Commonly used commands\n')
    fprintf(' \nOverride figure size\n')
end
fprintf("set(gcf, 'Position', [0.5, 0.5, 7.0, 4.5])\n\n")

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