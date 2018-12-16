cla

% Set initial values depending on user inputs and default case
g=100/tip_length;
angle_blade=angle/4.5*((2*pi)/360);
a=3;
phi=angle_blade;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% First we make a base cylinder which we will manipulate
t=0:pi/(n*4):2*pi;
x=cos(t);
y=sin(t);

x=repmat(x,10,1);
y=repmat(y,10,1);
z=zeros(10,8*n+1);

z(1,:)=0;
x(1,:)=shaft_width*cos(t);
y(1,:)=shaft_width*sin(t);

for i=2:3;
    z(i,:)=z(i-1,:)+2;
    x(i,:)=shaft_width*cos(t);
    y(i,:)=shaft_width*sin(t);
end

z(4,:)=5;
x(4,:)=shaft_width*cos(t+(a*phi));
y(4,:)=shaft_width*sin(t+(a*phi));

for i=5:8
    z(i,:)=5+((blade_height/6)*(i-5));
    x(i,:)=(blade_length+((blade_length/g)*(i-5)))*cos(t);
    y(i,:)=(blade_length+((blade_length/g)*(i-5)))*sin(t);
end

for i=9:11
    z(i,:)=5+((blade_height/6)*(i-5));
    x(i,:)=(blade_length+((blade_length/g)*(11-i)))*cos(t);
    y(i,:)=(blade_length+((blade_length/g)*(11-i)))*sin(t);
end

z(12,:)=5+(blade_height);
x(12,:)=shaft_width*cos(t-(a*phi));
y(12,:)=shaft_width*sin(t-(a*phi));

z(13,:)=5+(blade_height)+nose_height;
x(13,:)=0;
y(13,:)=0;

z(14,:)=0;
x(14,:)=0;
y(14,:)=0;

z(15,:)=0;
x(15,:)=shaft_width*cos(t);
y(15,:)=shaft_width*sin(t);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Now we make a first ghost cylinder which we can map original cylinder
% onto. This creates the blades.
t=0:pi/(n*4):2*pi;
x1=cos(t);
y1=sin(t);

x1=repmat(x1,10,1);
y1=repmat(y1,10,1);
z1=zeros(10,8*n+1);

z1(1,:)=1;

for i=2:15
    z1(i,:)=z1(i-1,:)+1;
    x1(i,:)=shaft_width*cos(t);
    y1(i,:)=shaft_width*sin(t);
end

% Moving points from original shape to ghost shape
for i=5:11
    x(i,1:2:end) = x1(i,1:2:end);
    y(i,1:2:end) = y1(i,1:2:end);
    
    x(i,4:8:end) = x1(i,4:8:end);
    y(i,4:8:end) = y1(i,4:8:end);
    
    x(i,2:4:end) = x1(i,2:4:end);
    y(i,2:4:end) = y1(i,2:4:end);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This ghost cylinder will allow the ends of the blades to be tilted
x2=cos(t);
y2=sin(t);

x2=repmat(x2,10,1);
y2=repmat(y2,10,1);
z2=zeros(10,8*n+1);

% Making ghost shape
z2(4,:)=5;
x2(4,:)=shaft_width*cos(t);
y2(4,:)=shaft_width*sin(t);

for i=5:7
    z2(i,:)=5+((blade_height/6)*(i-5));
    x2(i,:)=(blade_length+(blade_length/g)*(i-5))*cos(t+(phi-((1/3)*phi*(i-5))));
    y2(i,:)=(blade_length+(blade_length/g)*(i-5))*sin(t+(phi-((1/3)*phi*(i-5))));
end
    
for i=9:11
    z2(i,:)=5+((blade_height/6)*(i-5));
    x2(i,:)=(blade_length+(blade_length/g)*(11-i))*cos(t-(phi-((1/3)*phi*(11-i))));
    y2(i,:)=(blade_length+(blade_length/g)*(11-i))*sin(t-(phi-((1/3)*phi*(11-i))));
end

% Moving points from original shape to ghost shape
for i=[5,6,7,9,10,11]
    x(i,8:8:end)=x2(i,8:8:end);
    y(i,8:8:end)=y2(i,8:8:end);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This ghost shape will allow the start of the blades to be tilted
x3=cos(t);
y3=sin(t);

x3=repmat(x3,10,1);
y3=repmat(y3,10,1);
z3=zeros(10,8*n+1);

% Making ghost shape
for i=4:5
    z3(i,:)=5;
    x3(i,:)=shaft_width*cos(t+a*phi);
    y3(i,:)=shaft_width*sin(t+a*phi);
end

for i=5:7
    z3(i,:)=5+((blade_height/6)*(i-5));
    x3(i,:)=shaft_width*cos(t+(a*phi-(a*(1/3)*phi*(i-5))));
    y3(i,:)=shaft_width*sin(t+(a*phi-(a*(1/3)*phi*(i-5))));
end
    
for i=9:11
    z3(i,:)=5+((blade_height/6)*(i-5));
    x3(i,:)=shaft_width*cos(t-(a*phi-(a*(1/3)*phi*(11-i))));
    y3(i,:)=shaft_width*sin(t-(a*phi-(a*(1/3)*phi*(11-i))));
end

% Moving points from original shape to ghost shape
for i=[4,5,6,7,9,10,11]
    x(i,7:8:end)=x3(i,7:8:end);
    y(i,7:8:end)=y3(i,7:8:end);
end

for i=[4,5,6,7,9,10,11]
    x(i,1:8:end)=x3(i,1:8:end);
    y(i,1:8:end)=y3(i,1:8:end);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plotting final result
hSurface = surf(x,y,z);
set(hSurface,'FaceColor',[0 0 1]);

axis equal
axis off