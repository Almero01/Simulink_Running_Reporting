try %% Try and catch structure if there is any problem with the file reading process
    fileName = 'CSV_msd_param.csv'; %% Name of the file where are the necessary values for running the simulink model
    opts = detectImportOptions(fileName); %%Reading the properties of the file, including the column headers
    M = readmatrix(fileName,opts); %% Creating a matrix 'M' with the data of the file
    variable_names = opts.VariableNames; %% Creating an array 'variable_names' with the column headers
catch MExc
    warndlg(MExc.message) %% Throwing an alert if there is any problem reading the file o creating the data in the workspace
    
end
