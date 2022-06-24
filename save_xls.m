try

if exist('results_msd')
    sim_size = size(results_msd);
    
    if exist('results', 'dir') == 0
        mkdir 'results';
    end    
       
    if exist('results', 'dir') == 7
        date = string(datetime('now'));
        currDate = strrep(date, '-', '_');
        currDate = strrep(currDate, '-', '_');
        currDate = strrep(currDate, ':', '_');
        currDate = strrep(currDate, ' ', '_');
        actual_folder = strcat('results/', currDate);
        if exist(actual_folder, 'dir') == 7
            z = 1;
            while exist(actual_folder, 'dir') ~= 0
                
                actual_folder = strcat('results/', currDate, "_", num2str(z));
                z = z+1;
            end
            
        end
        
        mkdir(actual_folder);
            if exist(actual_folder, 'dir') == 7
                for i=1:sim_size(2)                               
                    repo_filename = strcat(actual_folder,'/simulation_results',int2str(i),'.xlsx');
                    %writematrix('Data',filename,'Sheet','Parameters','Range','B1');
                    %writematrix(variable_names,filename,'Sheet',convertCharsToStrings(results_msd(i).yout{k}.Values.Name),'Range','B2');
                    %writematrix(variable_names,filename,'Sheet',convertCharsToStrings(results_msd(i).yout{k}.Values.Name),'Range','B3');
                    num_sheets = size(num_sheets);
                    for k = 1:num_sheets(2)

                        %%matrix_headers{1,l} = results_msd(i).yout{k}.Values.Name;
                        %%matrix_headers{1,l+1} = results_msd(i).yout{k}.Values.Name;
                        %%matrix_results_alt(:,l) = results_msd(i).yout{k}.Values.Time;
                        %%matrix_results_alt(:,l+1) = results_msd(i).yout{k}.Values.Data;
                        %%l=l+2;

                        %%eval([results_msd(i).yout{k}.Values.Name '= results_msd(i).yout{k}.Values.Data']);
                        time = results_msd(i).yout{k}.Values.Time;
                        Data = results_msd(i).yout{k}.Values.Data;
                        writematrix('Time',repo_filename,'Sheet',convertCharsToStrings(results_msd(i).yout{k}.Values.Name),'Range','A1');
                        writematrix(time,repo_filename,'Sheet',convertCharsToStrings(results_msd(i).yout{k}.Values.Name),'Range','A2');
                        writematrix('Data',repo_filename,'Sheet',convertCharsToStrings(results_msd(i).yout{k}.Values.Name),'Range','B1');
                        writematrix(Data,repo_filename,'Sheet',convertCharsToStrings(results_msd(i).yout{k}.Values.Name),'Range','B2');


                    end




                end
            end
        %%mkdir(actual_folder);
        
    end
    

else
    
    warndlg("There is not information/results in the workspace");
end
catch MExc
    warndlg('Error is save.xls');
    warndlg(MExc.message);
end


