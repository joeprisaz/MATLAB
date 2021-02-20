% reset factory defaults
set(groot, 'defaultLineLineWidth', get(groot, 'FactoryLineLineWidth'))
set(groot, 'defaultFunctionlineLineWidth', get(groot, 'FactoryFunctionlineLineWidth'))
set(groot, 'defaultAxesLineWidth', get(groot, 'FactoryAxesLineWidth'))
set(groot, 'defaultAxesFontName', get(groot, 'FactoryAxesFontName'))
set(groot, 'defaultAxesFontSize', get(groot, 'FactoryAxesFontSize'))
set(groot, 'defaultFigureUnits', get(groot, 'FactoryFigureUnits'))
set(groot, 'defaultFigurePosition', get(groot, 'FactoryFigurePosition'))

% lines
set(groot, 'defaultLineLineWidth', 1.5)
set(groot, 'defaultFunctionlineLineWidth', 1.5)
set(groot, 'defaultImplicitFunctionlineLineWidth', 1.5)
set(groot, 'defaultAxesLineWidth', 1.0)

% fonts
set(groot, 'defaultAxesFontName', 'CMU Serif')
set(groot, 'defaultAxesFontSize', 12)

% sizes
set(groot, 'defaultFigureUnits', 'inches')
set(groot, 'defaultFigurePosition', [0.5, 0.5, 7.0, 4.5])

fprintf("Default figure size in inches: \n set(groot, 'defaultFigurePosition', [2.7639, 2.7639, 8.3333, 6.9444]) \n\n")
fprintf("To override figure size: \n set(gcf, 'Position', [0.5, 0.5, 7.0, 4.5]) \n\n")
fprintf("To reduce white space: \n set(gca, 'LooseInset', get(gca,'TightInset') + 0.01) \n\n")