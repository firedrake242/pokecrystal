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
% define the two numbers using hexadecimal values then convert to decimal
t = .01;
% define the distance; larger means closer to C2, smaller closer to C1
C3 = BlendColorValue(C1,C2,t);
% run the function to generate C3
C3 = floor(C3)
% round C3 down to the nearest integer
hexC3 = [];
for k = 1:3
    hexC3 = [hexC3, dec2hex(C3(k))];
end
% messy way to make matlab convert the number back to a hex value if I need
% it
hexC3
% prints the hex string to the command window