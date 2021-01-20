% reset factory defaults
set(groot, 'defaultLineLineWidth', get(groot, 'FactoryLineLineWidth'))
set(groot, 'defaultFunctionlineLineWidth', get(groot, 'FactoryFunctionlineLineWidth'))
set(groot, 'defaultAxesLineWidth', get(groot, 'FactoryAxesLineWidth'))
set(groot, 'defaultAxesFontName', get(groot, 'FactoryAxesFontName'))
set(groot, 'defaultAxesFontSize', get(groot, 'FactoryAxesFontSize'))
set(groot, 'defaultFigureUnits', get(groot, 'FactoryFigureUnits'))
set(groot, 'defaultFigurePosition', get(groot, 'FactoryFigurePosition'))

% set my defaults
if input('My plotting defaults? y or n\n', 's') == 'y'
	% lines
    if input('Linewidth 1.5 or 1? y (1.5) or n (1)\n', 's') == 'y'
        set(groot, 'defaultLineLineWidth', 1.5)
        set(groot, 'defaultFunctionlineLineWidth', 1.5)
        set(groot, 'defaultImplicitFunctionlineLineWidth', 1.5)
    else
        set(groot, 'defaultLineLineWidth', 1)
        set(groot, 'defaultFunctionlineLineWidth', 1)
    end
	set(groot, 'defaultAxesLineWidth', 1.0)

	% fonts
	set(groot, 'defaultAxesFontName', 'CMU Serif')
	set(groot, 'defaultAxesFontSize', 12)

	% sizes
	set(groot, 'defaultFigureUnits', 'inches')
	set(groot, 'defaultFigurePosition', [0.5, 0.5, 7.0, 4.5])
%     set(groot, 'defaultFigureUnits', 'pixels')
%     set(groot, 'defaultFigurePosition', [100, 100, 1200, 900])
%     set(gcf, 'OuterPosition', [0.5, 0.5, 6.5, 4.5])
%     set(gca, 'LooseInset', get(gca,'TightInset') + 0.01)
end