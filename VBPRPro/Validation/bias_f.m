function [bias my] = bias_f(x,y)


% y: l'estimateur
% x: valeur � estimer 
my=mean(y);
bias=mean(my-x);

end

