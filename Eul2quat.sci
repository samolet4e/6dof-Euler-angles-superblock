function y1 = Eul2quat(u1)

    phi   = u1(1)/2;
    theta = u1(2)/2;
    psi   = u1(3)/2;

    q0 = cos(psi)*cos(theta)*cos(phi) + sin(psi)*sin(theta)*sin(phi);
    q1 = cos(psi)*cos(theta)*sin(phi) - sin(psi)*sin(theta)*cos(phi);
    q2 = cos(psi)*sin(theta)*cos(phi) + sin(psi)*cos(theta)*sin(phi);
    q3 = sin(psi)*cos(theta)*cos(phi) - cos(psi)*sin(theta)*sin(phi);

    y1 = [q0, q1, q2, q3];
endfunction
