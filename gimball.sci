// Input [3,1;3,1]
// Output [3,1]
function y1 = gimball(u1,u2)

	phi = u1(1);
	theta = u1(2);
	psi = u1(3);

	A = [
		[1., sin(phi)*tan(theta), cos(phi)*tan(theta)],
		[0., cos(phi), -sin(phi)],
		[0., sin(phi)/cos(theta), cos(phi)/cos(theta)]
	];

	W = u2;
	y1 = A*W;
/*
	p = u2(1);
	q = u2(2);
	r = u2(3);

	y1 = A*[p,q,r]';
*/
endfunction
