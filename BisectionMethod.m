function [y, ite , acc, matBi] = BisectionMethod (a ,b , tol, maxite,custom_function, var)
%{
inputs: 
a is for beginning of the interval
b is for ending of the inteterval
tol is for tolerance
maxite is for maximum iterations
custum_function is for input function with only one variable 
var is for variable used in input function
outputs:
y is for final answer
ite is for how many iterations it took until it reached tolerance
acc if for accuracy
matBi is a matrix which first column is a,second b and third is if a*f is
pos or neg
%}

syms  x 
x = var;
a(1)=a;
b(1)=b;
f(x) = custom_function;


for i = (1:maxite)
    if abs(f( ( a(i)+b(i) )/2)) <= tol
        break;
    end
        if f(a(i))* f( ( a(i) + b(i) )/2 ) <= 0
            a(i+1)=a(i);
            b(i+1)=(a(i)+b(i))/2;
            c = 0;
        else
            b(i+1)=b(i);
            a(i+1)=(a(i)+b(i))/2;
            c = 1;
        end
    matBi(i,:) =[a(i),b(i),c];
    
    
end


y = double( ( a(i)+b(i) )/2);
ite=i;
acc = abs ( b(i) - a(i) );


end

