syms d1 d2 t1 t2 t3 A AL TH D Jv Jw J
p=zeros(4,4);
t=zeros(4,4);
T=eye(4,4);
A=[0,0,0,0,0.5];
AL=[0,sym(pi)/2,0,sym(pi)/2,0];
D=[0.5,1,1,0,0];
TH=[sym(pi)/2,sym(pi)/2,sym(pi)/2,sym(pi)+2*sym(pi),sym(pi)/2+sym(pi)/2];
%Jv=zeros(3,5);
%Jw=zeros(3,5);
for i=1:5
% theta=input('theta=');
% alpha=input('alpha=');
% a=input('a=');
% d=input('d=');
t=[cos(TH(i)) -sin(TH(i))*cos(AL(i)) sin(TH(i))*sin(AL(i)) A(i)*cos(TH(i));
    sin(TH(i)) cos(TH(i))*cos(AL(i)) -cos(TH(i))*sin(AL(i)) A(i)*sin(TH(i));
    0 sin(AL(i)) cos(AL(i)) D(i);
    0 0 0 1];
i
T=T*t;
T=vpa(T,3)
end
Jv(1:3,1) = [0;0;0];
Jw(1:3,2) = [0;0;0];
Jw(1:3,3) = [0;0;0];

for i=1:5
% theta=input('theta=');
% alpha=input('alpha=');
% a=input('a=');
% d=input('d=');

if i==2
    Jv(1:3,2)=p(1:3,1:3)*[0;0;1];
end
if i==3
    Jv(1:3,3)=p(1:3,1:3)*[0;0;1];
end
if i==4
    aa = (p(1:3,1:3)*[0;0;1])
    bb = (T(1:3,4)-p(1:3,4))
    Jv(1:3,4)=cross(aa,bb);
end
if i==5
    cc = (p(1:3,1:3)*[0;0;1])
    dd = ((T(1:3,4)-p(1:3,4)))
    Jvt=cross(cc,dd)
    Jv(1:3,5) = Jvt
end
p=[cos(TH(i)) -sin(TH(i))*cos(AL(i)) sin(TH(i))*sin(AL(i)) A(i)*cos(TH(i));
    sin(TH(i)) cos(TH(i))*cos(AL(i)) -cos(TH(i))*sin(AL(i)) A(i)*sin(TH(i));
    0 sin(AL(i)) cos(AL(i)) D(i);
    0 0 0 1];
if i==1
    Jw(1:3,1)=p(1:3,1:3)*[0;0;1];
end
if i==4
    Jw(1:3,4)=p(1:3,1:3)*[0;0;1];
end
if i==5
    Jw(1:3,5)=p(1:3,1:3)*[0;0;1];
end
T=T*p;
i
T = vpa(T,3)
end
Jv = vpa(Jv,3);
Jw = vpa(Jw,3);
J(1:3,1:5) = Jv;
J(4:6,1:5) = Jw;
J = vpa(J,2)