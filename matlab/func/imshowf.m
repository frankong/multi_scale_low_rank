function imshowf(varargin)
% imshowf(img )
%
% Basically imshow but fills up the screen
%
% (c) Frank Ong 2015

im = varargin{1};
iSize = size(im);
sSize = get(0,'Screensize');
sSize = floor([sSize(4),sSize(3)]*0.67);


im = imresize(im,[sSize(1),sSize(1)*iSize(2)/iSize(1)],'Method','nearest');

iSize = size(im);

if (~(iSize < sSize))
    
    im = imresize(im,[sSize(2)*iSize(1)/iSize(2),sSize(2)],'Method','nearest');
    
end


switch nargin
    case 1
        imshow(im);
    case 2
        imshow(im,varargin{2});
end