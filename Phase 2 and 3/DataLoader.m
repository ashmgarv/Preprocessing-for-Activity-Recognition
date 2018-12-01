datafolderpath="Data/";
folders=["Cooking1","Cooking2","EatFood1","EatFood2","EatFood3","EatFood4","NoMovement1","NoMovement2"];
names=["Cooking1","Cooking2","EatFood1","EatFood2","EatFood3","EatFood4","NoMovement1","NoMovement2"];
sensor=["acc","emg","gyro","orientation-","Euler"];
c1={'timestamp','acc_x','acc_y','acc_z'};
c2={'timestamp','emg1','emg2','emg3','emg4','emg5','emg6','emg7','emg8'};
c3={'timestamp','gyro_x','gyro_y','gyro_z'};
c4={'timestamp','ori_x','ori_y','ori_z','ori_w'};
c5={'timestamp','roll','pitch','yaw'};
keySet={1,2,3,4,5};
valueSet={c1,c2,c3,c4,c5};

c = containers.Map(keySet,valueSet,"UniformValues",false);
for i=1:length(folders)
    folders(i)=strcat(datafolderpath,folders(i));
end
FinalTable=FileMerge(folders(1),names(1),c);
name=char(names(1));
name2=name(1:length(name)-1);
name2=string(name2);
name1=name(length(name));
name1=string(name1);
FinalTable.activity= repmat(name2,length(FinalTable.timestamp), 1);
FinalTable.datano=repmat(name1, length(FinalTable.timestamp), 1);
for i=2:length(folders)
  m2=FileMerge(folders(i),name(i),c);
  name=char(names(i));
  name2=name(1:length(name)-1);
  name2=string(name2);
  name1=name(length(name));
  name1=string(name1);
  m2.activity=repmat(name2, length(m2.timestamp), 1);
  m2.datano=repmat(name1, length(m2.timestamp), 1);
  FinalTable=vertcat(FinalTable,m2);
end
outputFolder='Output';
if ~exist(outputFolder, 'dir')
    mkdir(outputFolder);
end
file=strcat(outputFolder,'/','_data_processed.csv');
writetable(FinalTable,file);

features_for_all_variables_all_datapoints = featureExtracter(FinalTable);
file=strcat(outputFolder,'/','_features.csv');
csvwrite(file,features_for_all_variables_all_datapoints);

data_components = pca_components(features_for_all_variables_all_datapoints);
file=strcat(outputFolder,'/','_Data_components.csv');
csvwrite(file,data_components);