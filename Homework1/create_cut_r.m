function y = create_cut_r(V)

v=[];
for i=2:size(V,1)-1
    v = [v V(i)];
end

n = length(v);

used_combinations_cell = {1};
unused_combinations_cell = {[5,2,3,4]};

for k = 1:n
    C_k = nchoosek(v, k);
    
    num_combos_k = size(C_k, 1);
    
    C_k_with_one = [ones(num_combos_k, 1), C_k];

    C_k_cell = mat2cell(C_k_with_one, ones(num_combos_k, 1), k+1);
    used_combinations_cell = [used_combinations_cell; C_k_cell];

    unused_k_cell = cell(num_combos_k, 1);
    
    for i = 1:num_combos_k
        current_combo = C_k(i, :);
        
        unused_elements = setdiff(v, current_combo);
        
        unused_with_five = [5, unused_elements];
        
        unused_k_cell{i} = unused_with_five;
    end
    
    unused_combinations_cell = [unused_combinations_cell; unused_k_cell];
end

% Display the results side-by-side in a table for clarity
disp('Combined results table:');
T = table(used_combinations_cell, unused_combinations_cell);
T.Properties.VariableNames = {'Used_plus_1', 'Unused_plus_5'};
disp(T);