function cmap = SN_redblue(n)
% SN_redblue creates a colormap of a shade of red/orange and blue/cyan
% while going through white
%
%    SN_redblue(N) means to give the users a continuous shade of blue and
%    red that has contant change of shading so that it doesn't misguide
%    changes in the gradient in the color plots
%
% Author: San Nguyen 2015 10 06
%

if nargin <1 || n<0
    n = size(colormap,1);
end

x = linspace(0,1,n);

red = NaN(size(x));
blue = NaN(size(x));
green = NaN(size(x));
red(1:floor(n/2)) = (sin(x(1:floor(n/2))*pi)).^(.5)*0.6+0.4;
red((n-floor(n/2)):n) = (-cos(x((n-floor(n/2)):n)*2*pi)/2+0.5).^1.5;

blue(1:floor(n/2)) = (sin(x(1:floor(n/2))*pi)).^(0.85)*0.6+0.4;
blue((n-floor(n/2)):n) = (-cos(x((n-floor(n/2)):n)*2*pi)*0.5+0.5).^1.5*0.95 + 0.05;

green(1:floor(n/2)) = (sin(x(1:floor(n/2))*pi)).^(1.5)*0.8+0.2;
green((n-floor(n/2)):n) = (-cos(x((n-floor(n/2)):n)*2*pi)*0.5+0.5).^1.05*0.975+0.025;

red(floor(n/2)+1) = 1;
blue(floor(n/2)+1) = 1;
green(floor(n/2)+1) = 1;

cmap = [fliplr(red)', green',blue'];
cmap = cmap.^1.25;
end

