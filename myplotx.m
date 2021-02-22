function myplotx(scale)

if nargin < 1
    error("enter a scale factor, e.g. myplotx(2)")
end

% reset factory defaults
set(groot, 'defaultLineLineWidth', get(groot, 'FactoryLineLineWidth'))
set(groot, 'defaultFunctionlineLineWidth', get(groot, 'FactoryFunctionlineLineWidth'))
set(groot, 'defaultAxesLineWidth', get(groot, 'FactoryAxesLineWidth'))
set(groot, 'defaultAxesFontName', get(groot, 'FactoryAxesFontName'))
set(groot, 'defaultAxesFontSize', get(groot, 'FactoryAxesFontSize'))
set(groot, 'defaultFigureUnits', get(groot, 'FactoryFigureUnits'))
set(groot, 'defaultFigurePosition', get(groot, 'FactoryFigurePosition'))

% lines
set(groot, 'defaultLineLineWidth', 1.5 * scale)
set(groot, 'defaultFunctionlineLineWidth', 1.5 * scale)
set(groot, 'defaultImplicitFunctionlineLineWidth', 1.5 * scale)
set(groot, 'defaultAxesLineWidth', 1.0 * scale)

% fonts
set(groot, 'defaultAxesFontName', 'CMU Serif')
set(groot, 'defaultAxesFontSize', 12 * scale)

% sizes
set(groot, 'defaultFigureUnits', 'inches')
w = 7.0 * scale; h = 4.5 * scale;
set(groot, 'defaultFigurePosition', [0.5, 0.5, w, h])

fprintf(['To override figure size: \n set(gcf, ''Position'', [0.5, 0.5, ',num2str(w),', ',num2str(h),']) \n\n'])
fprintf('To reduce white space: \n set(gca, ''LooseInset'', get(gca,''TightInset'') + 0.01) \n\n')
end