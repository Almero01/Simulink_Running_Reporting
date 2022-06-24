check_variables = exist('variable_names');
check_variables_two = exist('M');
try
if (check_variables == 1 && check_variables_two == 1)
    
    size_data_msd = size(M);

    for i=1:size_data_msd(1)

        for k = 1:size_data_msd(2)
            eval([variable_names{k} '= M(i,k)']);
        end


        results_msd(i) =  sim('SMD_system.slx',time_sim);

    end

    num_sheets = find_system('SMD_system','BlockType','Outport');
else
    warndlg("There have not been loaded files");
end
catch MExc
    warndlg(MExc.message);
    
    
end
