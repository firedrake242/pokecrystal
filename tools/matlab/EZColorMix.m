%color adding and subtracting
clc, clear
% Green 1: B5 EF FF
% Green 2: 52 DE FF
% Brown 1: D6 E7 FF
% Brown 2: A5 E7 FF
% Morning White: E7 FF 84
% Night White: 7B 73 C6

% Fall Leaves 1: FF9C00
% Fall Leaves 2: DE5229
% Fall Grass: C0EE58
% Roof 1N: 636B4A
% Roof 2N: 4A6318
C1= double([0x7B, 0x73, 0xC6]);
C2= double([0xFF,0xFF,0xFF]);
t = .01;
C3 = BlendColorValue(C1,C2,t);
C3 = floor(C3)

hexC3 = [];
for k = 1:3
    hexC3 = [hexC3, dec2hex(C3(k))];
end
hexC3
