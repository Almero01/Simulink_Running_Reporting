try 
    fileName = 'CSV_msd_param.csv';
    opts = detectImportOptions(fileName);
    M = readmatrix(fileName,opts);
    variable_names = opts.VariableNames;
catch MExc
    warndlg(MExc.message)
    
end
