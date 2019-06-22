function [newblock, energy, truncation_error] = single_dmrg_step(sys, env, m, model_d)
val=is_valid_block(sys);
val=is_valid_block(env);
sys_enl = enlarge_block(sys,model_d);
env_enl = enlarge_block(env,model_d);
val=is_valid_block(sys_enl);
val=is_valid_block(env_enl);
% newblock=0;
% energy=0;
% Construct the full superblock Hamiltonian.
m_sys_enl = sys_enl.basis_size;
m_env_enl = env_enl.basis_size;
sys_enl_op = sys_enl.operator_dict;
env_enl_op = env_enl.operator_dict;
superblock_hamiltonian = kron(sys_enl_op.H, eye(m_env_enl)) + kron(eye(m_sys_enl), env_enl_op.H) + ...
    H2(sys_enl_op.conn_Sz, sys_enl_op.conn_Sp, env_enl_op.conn_Sz, env_enl_op.conn_Sp);

%psi0 = psi0.reshape([sys_enl.basis_size, -1], order="C")
%[energy,psi0]=eig(superblock_hamiltonian)
% [psi0,energy]=eigs(superblock_hamiltonian,1,'sa');
[psi0,energy]=eigs(superblock_hamiltonian,1,'sr');
% [psi0s,energys]=eigs(superblock_hamiltonian);
% psi0=psi0s(:,1);
% energy=energys(1);
psi0=reshape(psi0,sys_enl.basis_size,sys_enl.basis_size);%disp
% break
% return
% energy
% psi0
%rho = np.dot(psi0, psi0.conjugate().transpose())
rho=psi0*conj(transpose(psi0));%disp
%evals, evecs = np.linalg.eigh(rho)
[evecs,evals]=eig(rho);
% evals%disp
% evecs%disp
[row,vol]=size(evals);
% for j=1:row
for k=1:vol
    k2=vol+1-k;
    possible_eigenstates(:,k)=evecs(:,k2);
    possible_eigenvalues(k)=evals(k2,k2);
end
% end
% possible_eigenstates%disp
% possible_eigenstates=evals;
my_m=min(length(possible_eigenstates),m);
transformation_matrix=possible_eigenstates(:,1:my_m);%disp
% sum(possible_eigenvalues)
% sum(possible_eigenvalues(1:my_m))
truncation_error=1-sum(possible_eigenvalues(1:my_m));
% disp(['truncation error:' num2str(truncation_error)])

new_operator_dict=struct;
new_operator_dict.H=rotate_and_truncate(sys_enl.operator_dict.H,transformation_matrix);
new_operator_dict.conn_Sz=rotate_and_truncate(sys_enl.operator_dict.conn_Sz,transformation_matrix);
new_operator_dict.conn_Sp=rotate_and_truncate(sys_enl.operator_dict.conn_Sp,transformation_matrix);

newblock=struct;
newblock.length=sys_enl.length;
newblock.basis_size=my_m;
newblock.operator_dict=new_operator_dict;
end