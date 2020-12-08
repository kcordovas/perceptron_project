function w=myPerceptron(X,y,w_ini,goal_error)

y_hat=perceptronyhat(X,w_ini);

myError = missclassification(y,y_hat);
w = w_ini;
filas=size(X,1);
vector_ones=ones(1,size(X,1))';
xaum=[vector_ones X];
%while myError~=goal_error
while myError > goal_error
for i=1:filas
    x_i=X(i,:);
    y_hat_i=perceptronyhat(x_i,w);
    if y_hat_i~=y(i)
        w = w + y(i)*xaum(i,:)';
    end
end
y_hat=perceptronyhat(X,w);
myError = missclassification(y,y_hat)
end

end