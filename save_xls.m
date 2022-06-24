try %% Try and catch structure for check if there is any problem creating the xls file

if exist('results_msd') %% Check the structure 'results_msd' exist
    sim_size = size(results_msd); %% Get the size of 'results_msd'
    
    if exist('results', 'dir') == 0 %% Check if a results folder is created at the active path; if not, create it
        mkdir 'results'; %% Create the folder
    end    
       
    if exist('results', 'dir') == 7 %% Check if the results folder is already created
        date = string(datetime('now')); %% Getting the date and the time to name a folder with the results. 
        currDate = strrep(date, '-', '_'); %% The next lines are for formatting this date and time
        currDate = strrep(currDate, '-', '_');
        currDate = strrep(currDate, ':', '_');
        currDate = strrep(currDate, ' ', '_');
        actual_folder = strcat('results/', currDate); %% Create a string with the name of the folder
        if exist(actual_folder, 'dir') == 7 %% Check if the folder exist. If it is there, we add an index to avoid losing previous results
            z = 1;
            while exist(actual_folder, 'dir') ~= 0 %% Index checking and adding
                
                actual_folder = strcat('results/', currDate, "_", num2str(z));
                z = z+1;
            end
            
        end
        
        mkdir(actual_folder); %% Create the folder with the previous name and index
            if exist(actual_folder, 'dir') == 7 %% Check if there was created the folder
                for i=1:sim_size(2) %% Loop for create a xls file for each simulation results                   
                    repo_filename = strcat(actual_folder,'/simulation_results',int2str(i),'.xlsx'); %% Format the name string of the file with the index of the result
                    num_sheets = size(num_sheets); %% Getting the number of outports that equals to the number of sheets of the xls file. 
                                                   %%This is going to create a sheet by each outport of the model
                    for k = 1:num_sheets(2) %% Loop for create each sheet, with the name and the corresponding values. 

                        time = results_msd(i).yout{k}.Values.Time; %% Get the time array for the actual variable
                        Data = results_msd(i).yout{k}.Values.Data; %% Get the data array for the actual variable
                        writematrix('Time',repo_filename,'Sheet',convertCharsToStrings(results_msd(i).yout{k}.Values.Name),'Range','A1'); %% Write the name of the column 'time'
                        writematrix(time,repo_filename,'Sheet',convertCharsToStrings(results_msd(i).yout{k}.Values.Name),'Range','A2'); %% Write the values of time
                        writematrix('Data',repo_filename,'Sheet',convertCharsToStrings(results_msd(i).yout{k}.Values.Name),'Range','B1'); %% Write the name of the column 'Data'
                        writematrix(Data,repo_filename,'Sheet',convertCharsToStrings(results_msd(i).yout{k}.Values.Name),'Range','B2'); %% Write the values of Data


                    end
                end
            end 
    end
    

else
    
    warndlg("There is not information/results in the workspace"); %%Alert if there is missing variables in the workspace necessary to create the xls file
end
catch MExc
    warndlg('Error is save.xls'); %%Alerts if there is any problem and which is the problem
    warndlg(MExc.message);
end


