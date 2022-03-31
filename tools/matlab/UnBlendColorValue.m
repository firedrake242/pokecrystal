function [b] = UnBlendColorValue(a,c,t)
%BLENDCOLORVALUE for channels a and b at ratio t, unblend the rgb channels.
b = (1/t)*(t*(t*a.^2 - a.^2 + c.^2)).^0.5;
if b > 255
    b = b - 255
end
end