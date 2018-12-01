function output1  = plotFeatures(data_components)
    [rows, cols] = size(data_components);
    for k=1:rows+1
        
         if k==2 || k==6 || k==8 || k==9

            [rows, cols] = size(data_components);
            if(k==2)
                 for m=1:2
                       plot(data_components(1:rows,m));
                       hold on;
                 end
            end
            
            if(k==6)
                 for o=3:6
                       plot(data_components(1:rows,o));
                       hold on;
                 end
            end
           
            if(k==8)
               
                 for l=7:8
                       plot(data_components(1:rows,l));
                       hold on;
                 end
            end
            
            if(k==9)
                for m = [1,3,7]
                    plot(data_components(1:rows,m));
                    hold on;
                end
            
            end
            classes = [" "," cooking"," "," "," "," eating"," "," nomovement"," All Features"];
            title(strcat(' Values and Activity  for ',' ',classes(k)));
            xlabel('Features Extracted');
            ylabel('Features Values');
            name = strcat(classes(k),'pcacomponents.jpg');
            outputFolder='Graph';
            if ~exist(outputFolder, 'dir')
            mkdir(outputFolder);
            end
            path=strcat(outputFolder,"/",name);
            saveas(gcf,path);
            hold off;
         end
    end
         
output1 = "plotted";

end

