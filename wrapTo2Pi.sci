function y1 = wrapTo2Pi(u1)

// https://stackoverflow.com/questions/27093704/converge-values-to-range-pi-pi-in-matlab-not-using-wraptopi

    t = zeros(3,1);
    t = u1 - 2.*%pi*floor(u1/(2*%pi));

    y1 = t;

endfunction
