% this script aims to generate arrays helpful for building the 5-cube I
% want to have as a dungeon in my rom hack

clc, clear

A = zeros(4,3,8)

A(:,:,1) = [0,1,0
            2,3,4
            0,5,0
            0,6,0]
for k = 2:8
    for i = 1:4
        for j = 1:3
           if A(i,j,1) ~= 0
            A(i,j,k) = A(i,j,1)+6*(k-1)
           end
        end
    end
end

warps = 1:24
%guide = [top, front, right
%         bottom, back, left]

B = { 
[01,03,05      %center
 02,04,06];

[20,07,09      %above
 01,08,10];

[02,11,13      %below
 19,12,14];

[07,22,15      %front
 11,03,16];

[08,04, 17      %back
 12,21, 18];

[09,15,24      %right
 13,17,05];

[10,16,06      %left
 14,18,23];

[19,21,23     %outside
 20,22,24];

}



