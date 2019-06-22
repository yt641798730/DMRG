function val=rotate_and_truncate(operator,transformation_matrix)
val=transpose(conj(transformation_matrix))*(operator*(transformation_matrix));
end

