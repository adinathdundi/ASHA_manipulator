syms p1 d1 t1 t3 A AL TH D t T a3 th1_ddot th1_dot th3_dot d2_ddot d2_dot th3_ddot w w_dot v_dot
w=zeros(3,1);
w_dot=zeros(3,1);
v_dot=zeros(3,1);
p=zeros(4,4);
q=eye(4,4);
t=zeros(4,4);
T=eye(4,4);
A=[0,0,a3]
AL=[-sym(pi)/2,-sym(pi)/2,0]
D=[p1,d1,0]
TH=[t1,-sym(pi)/2,-t3-sym(pi)/2]
%Jv=zeros(3,5);
%Jw=zeros(3,5);
for i=1:3
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

for i=1:3
% theta=input('theta=');
% alpha=input('alpha=');
% a=input('a=');
% d=input('d=');



p=[cos(TH(i)) -sin(TH(i))*cos(AL(i)) sin(TH(i))*sin(AL(i)) A(i)*cos(TH(i));
    sin(TH(i)) cos(TH(i))*cos(AL(i)) -cos(TH(i))*sin(AL(i)) A(i)*sin(TH(i));
    0 sin(AL(i)) cos(AL(i)) D(i);
    0 0 0 1];
q=q*p;
if i==1
    w(1,1)=p(1:3,1:3)*[0;0;1]*th1_dot;
    w_dot(1,1)=(p(1:3,1:3))*[0;0;1]*(th1_ddot);
    v_dot(1,1)=cross(w_dot(1,1),(q(1:3,1:3)*p(1:3,4)))+cross(w(1,1),cross(w(1,1),q(1:3,1:3)*p(1:3,4)));
end
if i==2
    w(2,1)=p(1:3,1:3)*w(1,1);
    w_dot(2,1)=p(1:3,1:3)*w_dot(1,1);
    v_dot(2,1)=p(1:3,1:3)*(v_dot(1,1)+[0;0;1]*d2_ddot)+2*cross(w(2,1),p(1:3,1:3)*[0;0;1]*d2_dot)+cross(w(2,1),q(1:3,1:3)*p(1:3,4))+cross(w(2,1),cross(w(2,1),q(1:3,1:3)*p(1:3,4)));
end
if i==3
    w(3,1)=p(1:3,1:3)*(w(2,1)+[0;0;1]*th3_dot);
    w_dot(3,1)=p(1:3,1:3)*(w_dot(2,1)+[0;0;1]*th3_ddot+cross(w(2,1),[0;0;1]*th3_dot));
    v_dot(3,1)=p(1:3,1:3)*v_dot(2,1)+cross(w_dot(3,1),q(1:3,1:3)*p(1:3,4))+cross(w(3,1),cross(w(3,1),q(1:3,1:3)*p(1:3,4)))
end
end
5
w_dot
v_dot