clear

length_block=0;
basis_size=0;
operator_dict=0;
Block=namedtuple('Block',length_block,basis_size,operator_dict);
EnlargedBlock=namedtuple('EnlargedBlock',length_block,basis_size,operator_dict);

is_valid_enlarged_block=0;

model_d=2;

Sz1 = [0.5 0; 0 -0.5];
Sp1 = [0 1;0 0];
H1  = [0 0;0 0];

Block.length=1;
Block.basis_size=model_d;
Block.operator_dict.H=H1;
Block.operator_dict.conn_Sz=Sz1;
Block.operator_dict.conn_Sp=Sp1;
initial_block=Block;
block=initial_block;

L=1000;m=14;
% L=40;m=20;
while(2*block.length<L)
    %disp(['L =' num2str(block.length*2+2)])
    [block,energy,truncation_error]=single_dmrg_step(block,block,m,model_d);
    %disp(['Out of single_dmrg_step!!!='])
    %disp(['E/L=' num2str(energy/(block.length*2))])
    disp(['L =' num2str(block.length*2+2) ',' 'E/L=' num2str(energy/(block.length*2)) ',truncation_error=' num2str(truncation_error)])
end