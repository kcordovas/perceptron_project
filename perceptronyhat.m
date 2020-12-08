function y_hat=perceptronyhat(X,w_ini)
vector_ones=ones(1,size(X,1))';
xaum=[vector_ones X];
s=xaum*w_ini;
y_hat=zeros(1,size(s,1))';
for i=1:size(s,1)
    if s(i)>0
        y_hat(i)=1;
    else
        y_hat(i)=-1;
    end
end
end