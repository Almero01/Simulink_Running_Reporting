check_variables = exist('variable_names'); %% Check if the array containing the name of the variables exist
check_variables_two = exist('M'); %% Check if the matrix with the parameters exist
try %% Try and catch structure for getting any possible error in the running process
if (check_variables == 1 && check_variables_two == 1) %% Checking if the two conditions (exist M and variable_names) are true
    
    size_data_msd = size(M); %%Get the size of the matrix M

    for i=1:size_data_msd(1) %%Loop for running the Simulink model n times where n correspond to the numbers of rows of M

        for k = 1:size_data_msd(2) %% Loop for updating the parameters values after each run
            eval([variable_names{k} '= M(i,k)']); %% Assigning new values for variables after each run
        end

        %%time_sim = 1000; %%If your CS do not containg a column that define
        %%the time of running model, uncomment and define manually your
        %%time
        results_msd(i) =  sim('SMD_system.slx',time_sim); %% Running the simulink model with a time 'time_sim'

    end

    num_sheets = find_system('SMD_system','BlockType','Outport'); %% For the report, the number of out variables is needed.
                                                                  %%Here is evaluated how much outport are present in the model
else
    warndlg("There have not been loaded files"); %% Alert if the M or/and variable_names do not exist
end
catch MExc
    warndlg(MExc.message); %% Alert if there is some problem with the running process.
    
    
end
