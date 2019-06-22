function value = H2(Sz1, Sp1, Sz2, Sp2)
J=1;
Jz=1;
value=(J/2)*(kron(Sp1,transpose(conj(Sp2)))+kron(transpose(conj(Sp1)),Sp2))+Jz*kron(Sz1, Sz2);
end

