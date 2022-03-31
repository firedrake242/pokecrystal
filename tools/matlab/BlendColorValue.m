function [c] = BlendColorValue(a,b,t)
%BLENDCOLORVALUE for channels a and b at ratio t, blend the rgb channels.
c = sqrt((1-t)*a.^2 + t*b.^2);
end