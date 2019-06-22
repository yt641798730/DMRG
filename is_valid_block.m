function val= is_valid_block(block)
val=0;
% disp(['block.basis_size=' num2str(block.basis_size)])
% disp(['block.operator_dict.H=' num2str(length(block.operator_dict.H))])

% disp(['=' num2str()])
% disp(['=' num2str()])
% block.operator_dict.conn_Sz
% block.operator_dict.conn_Sp
% for op=block.operator_dict
%     [op_shape_0,op_shape_1]=size(op);
%     disp(['op.shape[0]=' num2str(op_shape_0) ';op.shape[1]=' num2str(op_shape_1)])
%     if(op_shape_0 ~= block.basis_size || op_shape_1 ~= block.basis_size)
%         val=false;
%     end
%     val=true;
end

