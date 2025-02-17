%% Create input data
% file_names = {};
% nsbj = 4; % number of subjects
% for i=1:nsbj
%     file_names{end+1} = sprintf("rsfMRI_mc(%d).csv", i);
% end
% 
% % Create an empty cell array to store the data
% data_cell = cell(nsbj, 1);
% 
% % Loop through each CSV file using your file names
% for i = 1:nsbj
%     % Read the CSV file using the generated file names
%     temp_table = readtable(file_names{i});
% 
%     % Convert table to matrix, excluding the header
%     temp_matrix = table2array(temp_table);
% 
%     % Transpose the matrix
%     temp_matrix = temp_matrix';
% 
%     % Convert to single precision
%     temp_matrix = single(temp_matrix);
% 
%     % Store in cell array
%     data_cell{i} = temp_matrix;
% end
% 
% B = data_cell
% % Save the cell array to a .mat file
% save('input_data.mat', 'B');

%% Create Atlas:

% Read headers from one of the CSV files
temp_table = readtable('rsfMRI_mc(1).csv');
headers = temp_table.Properties.VariableNames';

% Create Parcel_ID column (1 to 90)
parcel_id = (1:90)';

% Create table with both columns
mapping_table = table(parcel_id, headers(1:90), 'VariableNames', {'Parcel_ID', 'Area_Name'});

% Write to Excel file
writetable(mapping_table, 'atlas.xlsx');
