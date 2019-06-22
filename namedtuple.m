function [Block] = namedtuple(name,length,basis_size,operator_dict)
Block=struct;
Block.name=name;
Block.length=length;
Block.basis_size=basis_size;
Block.operator_dict=struct;

H1  = [0 0;0 0];
Sz1 = [0.5 0; 0 -0.5];
Sp1 = [0 1;0 0];
Block.operator_dict.H=H1;
Block.operator_dict.conn_Sz=Sz1;
Block.operator_dict.conn_Sp=Sp1;
end
