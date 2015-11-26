function [out,r] = randshift(in)
% Randomly shift input in all dimensions
% Outputs shifted input and the shifts r

s = size(in);

r = zeros(1,length(s));


for i = 1:length(s)
    r(i) = randi(s(i));
end

out = circshift(in,r);