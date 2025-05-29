// https://www.mathworks.com/help/aeroblks/multirotor.html
function [y1,y2] = multirotor(u1,u2)

    Om = u1;
    rho = u2;

    F = zeros(3,1);
    M = zeros(3,1);

    Ct = 0.0107;
    Cq = 7.8263e-4;
    R = 0.0330;

    l = 0.0624;
    h = -0.0159;
    d = l/sqrt(2);

    p = zeros(4,3);

    arm = '+';

    select arm
    case 'x' then
        p(1,:) = [d,-d,h];
        p(2,:) = [d,d,h];
        p(3,:) = [-d,d,h];
        p(4,:) = [-d,-d,h];
    case '+' then
        p(1,:) = [l,0,h];
        p(2,:) = [0,l,h];
        p(3,:) = [-l,0,h];
        p(4,:) = [0,-l,h];
    end

    F(1) = 0;
    F(2) = 0;
    F3(1) = (Om(1)*R)^2*(-Ct*rho*%pi*R^2);
    F3(2) = (Om(2)*R)^2*(-Ct*rho*%pi*R^2);
    F3(3) = (Om(3)*R)^2*(-Ct*rho*%pi*R^2);
    F3(4) = (Om(4)*R)^2*(-Ct*rho*%pi*R^2);
    F(3) = 0;
    for i = 1 : 4
        F(3) = F(3) + F3(i);
    end
//    F(3) = F(3)*(-Ct*rho*%pi*R^2);

    t1 = cross(p(1,:),[0,0,F3(1)]);
    t2 = cross(p(2,:),[0,0,F3(2)]);
    t3 = cross(p(3,:),[0,0,F3(3)]);
    t4 = cross(p(4,:),[0,0,F3(4)]);
    t = t1 + t2 + t3 + t4;
    M(1) = t(1);
    M(2) = t(2);
    M(3) = t(3);
    t = 0;
    for i = 1 : 4
        t = t - Cq*rho*%pi*R^5*Om(i)*abs(Om(i));
    end
    M(3) = M(3) + t;

    y1 = F;
    y2 = M;
endfunction
