function [fj,fs] = f(dr,fs,j)
% Computes the force, f_ij, between particles i and j
% using the derivative of the Leonard Jones potential.
% Note: Also takes advantage of the symmetry |f_ij|=|f_ji|.
%
% INPUT:
%   dr: The magnitude of distance between each particle with x_j (dx|dy)
%   fs: The stored force evaluations of previous iterations of f(*)
%   j:  The current iteration of force evaluations for x_j
%
% OUTPUT:
%   fi: The resulting force evaluation on x_j
%   fs: The updated stored force evaluations

    fj = [fs(j,1:j-1)';24*((2./dr(j:end).^(13))-(1./dr(j:end).^7))];
    fs(:,j) = [fj(1:j-1);0;fj(j:end)];
end