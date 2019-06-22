function [ EnlargedBlock ] = enlarge_block(block,model_d)
Sz1 = [0.5 0; 0 -0.5];
Sp1 = [0 1;0 0];
H1  = [0 0;0 0];

mblock = block.basis_size;
o = block.operator_dict;

enlarged_operator_dict.H=kron(o.H, eye(model_d)) + kron(eye(mblock), H1) + H2(o.conn_Sz, o.conn_Sp, Sz1, Sp1);
enlarged_operator_dict.conn_Sz=kron(eye(mblock), Sz1);
enlarged_operator_dict.conn_Sp=kron(eye(mblock), Sp1);

EnlargedBlock.length=(block.length+1);
EnlargedBlock.basis_size=(block.basis_size * model_d);
EnlargedBlock.operator_dict=enlarged_operator_dict;
end



