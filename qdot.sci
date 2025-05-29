function y1 = qdot(u1,u2)

    phi   = u1(1)/2;
    theta = u1(2)/2;
    psi   = u1(3)/2;

    q0 = u1(1);
    q1 = u1(2);
    q2 = u1(3);
    q3 = u1(4);

    p = u2(1)/2;
    q = u2(2)/2;
    r = u2(3)/2;

    M = [
        [0, -p, -q, -r];
        [p, 0, r, -q];
        [q, -r, 0, p];
        [r, q, -p, 0]
        ];
    quat = [q0, q1, q2, q3];

    y1 = M*quat';
endfunction
