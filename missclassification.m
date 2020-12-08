function e=missclassification(y, y_hat)
%{
sizey=size(y, 1);
myResult=zeros(sizey, 1);
for i=1:sizey
    if(y(i)~=y_hat(i))
        myResult(i)=1;
    else
        myResult(i)=0;
    end
end
e=(1/sizey)*sum(myResult);
%}
iguales=sum(y==y_hat);
n_filas=size(y,1);
e=1-(iguales/n_filas);
end