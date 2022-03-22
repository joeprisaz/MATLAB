function myplot(scale,~,~)

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
    set(groot, 'defaultColorbarLineWidth', get(groot, 'factoryColorbarLineWidth'))
    set(groot, 'defaultTextFontName', get(groot, 'FactoryTextFontName'))
    set(groot, 'defaultAxesFontName', get(groot, 'FactoryAxesFontName'))
    set(groot, 'defaultTextInterpreter', get(groot, 'factoryTextInterpreter'))
    set(groot, 'defaultAxesTickLabelInterpreter', get(groot, 'factoryAxesTickLabelInterpreter'))
    set(groot, 'defaultColorbarTickLabelInterpreter', get(groot, 'factoryColorbarTickLabelInterpreter'))
    set(groot, 'defaultLegendInterpreter', get(groot, 'factoryLegendInterpreter'))
    set(groot, 'defaultTextFontSize', get(groot, 'FactoryTextFontSize'))
    set(groot, 'defaultAxesFontSize', get(groot, 'FactoryAxesFontSize'))
    set(groot, 'defaultColorbarFontSize', get(groot, 'factoryColorbarFontSize'))
    set(groot, 'defaultFigurePosition', get(groot, 'FactoryFigurePosition'))
    return
end

% lines
set(groot, 'defaultLineLineWidth', 1.5 * scale)
set(groot, 'defaultFunctionlineLineWidth', 1.5 * scale)
set(groot, 'defaultImplicitFunctionlineLineWidth', 1.5 * scale)
set(groot, 'defaultAxesLineWidth', 0.75 * scale)
set(groot, 'defaultColorbarLineWidth', 0.5 * scale)


% fonts
if sans == true
    set(groot, 'defaultTextFontName', 'DejaVu Sans')
    set(groot, 'defaultAxesFontName', 'DejaVu Sans')
else
    set(groot, 'defaultTextFontName', 'CMU Serif')
    set(groot, 'defaultAxesFontName', 'CMU Serif')
end
set(groot, 'defaultTextFontSize', 10 * scale)
set(groot, 'defaultColorbarFontSize', 9 * scale)
set(groot, 'defaultAxesFontSize', 12 * scale)

% interpreter
if setInterpreter == true
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

% sizes
w = 600 * scale; h = 400 * scale;
set(groot, 'defaultFigurePosition', [30, 30, w, h])

% command window outputs
fprintf('Arguments\n')
fprintf('0'); fprintf(' - scale factor set to 1\n')
fprintf('1'); fprintf(' - scale factor (interpreter set to latex)\n')
fprintf('2'); fprintf(' - scale factor + set interpreter to default (tex)\n')
fprintf('3'); fprintf(' - sans font\n')
fprintf('myplot(0) for factory defaults\n\n')

fprintf('Scaling\n')
fprintf('Line linewidth = %.2f\n',1.5*scale)
fprintf('Axes linewidth = %.2f\n',0.75*scale)
if setInterpreter == true
    fprintf('Text font size = %d (latex)\n',10*scale)
    fprintf('Axes font size = %d (latex)\n\n',12*scale)
else
    fprintf('Text font size = %d (tex)\n',10*scale)
    fprintf('Axes font size = %d (tex)\n\n',12*scale)
end

fprintf('Commonly used commands\n')
fprintf('Override figure size\n')
fprintf('set(gcf, ''Position'', [0.5, 0.5, %.1f, %.1f])\n\n',w,h)
fprintf('Override opengl renderer\n')
fprintf('set(gcf, ''Renderer'', ''Painters'')\n\n')
fprintf('Reduce white space\n')
fprintf("set(gca, 'LooseInset', get(gca,'TightInset') + 0.01)\n\n")
fprintf('Export pdf\n')
fprintf("exportgraphics(gcf,'filename.pdf','ContentType','vector')\n\n")
fprintf('Export png\n')
fprintf("exportgraphics(gcf,'filename.png','Resolution','300')\n\n")

end