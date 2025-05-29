function y1 = quat2Eul(u1)

    q0 = u1(1);
    q1 = u1(2);
    q2 = u1(3);
    q3 = u1(4);

    phi = atan(2*(q2*q3 + q0*q1)/(q0^2 - q1^2 - q2^2 + q3^2));
    theta = asin(-2*(q1*q3 - q0*q2));
    psi = atan(2*(q2*q3 + q0*q1)/(q0^2 + q1^2 - q2^2 - q3^2));

    y1 = [phi, theta, psi];
endfunction
