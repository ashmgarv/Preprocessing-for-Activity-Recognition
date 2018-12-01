function output1  = plotFeatures(features_for_all_variables_all_datapoints, k)
        
         if k==2 || k==6 || k==8 || k==9

            [rows, cols] = size(features_for_all_variables_all_datapoints);
            if(k==2)
                 for m=1:2
                       plot(features_for_all_variables_all_datapoints(1:rows,m));
                       hold on;
                 end
            end
            
            if(k==6)
                 for o=3:6
                       plot(features_for_all_variables_all_datapoints(1:rows,o));
                       hold on;
                 end
            end
           
            if(k==8)
               
                 for l=7:8
                       plot(features_for_all_variables_all_datapoints(1:rows,l));
                       hold on;
                 end
            end
            
            if(k==9)
                for m = [1,3,7]
                    plot(features_for_all_variables_all_datapoints(1:rows,m));
                    hold on;
                end
            
            end
            classes = [" "," cooking"," "," "," "," eating"," "," nomovement"," All Features"];
            title(strcat(' Values and  Activity  for ',' ',classes(k)));
            xlabel(' Features Extracted ');
            ylabel(' Features Values ');
            name = strcat(classes(k),'.jpg');
            outputFolder='Graph';
            if ~exist(outputFolder, 'dir')
            mkdir(outputFolder);
            end
            path=strcat(outputFolder,"/",name);
            saveas(gcf,path);
            hold off;
         end
         
output1 = "plotted";

end

