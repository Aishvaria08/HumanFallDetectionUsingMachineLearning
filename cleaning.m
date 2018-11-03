function cleaned_data = cleaning(original_noised)
data = original_noised;
loop_size = size( data , 1 );

for i = 1:loop_size
    array_row = data(i, :);
    if(min(array_row)==-Inf)
       data(i, :) = [];
    end
end

cleaned_data = data;