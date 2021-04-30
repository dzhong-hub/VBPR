function pgon=area_2(x1,x2,T,P)
    X1=[x1:0.01:x2];
    X2=flip(X1);
    X=[X1,X2];
    YY=X1*P;
    YY(YY<T)=T;

    Y1=X1+YY;
    Y2=X2-flip(YY);
    Y=[Y1,Y2];
    Y(Y<x1)=x1;
    Y(Y>x2)=x2;

    pgon = polyshape(X,Y);
end