function outputArg1 = pca_components(features_for_all_variables_all_datapoints)


data_t = transpose(features_for_all_variables_all_datapoints);
[coeff,score,latent] = pca(data_t, 'Economy',false);
data_components = data_t*coeff(:,1:8);
plotPCA(data_components);
outputArg1 = data_components;
variance_explained = (latent/sum(latent));
variance_explained_top7 = variance_explained(1:7);
disp(variance_explained_top7);

AccNames = {'fft-acc-x-1','fft-acc-x-2','fft-acc-x-3','fft-acc-x-4','fft-acc-x-5'};
EMGNames = {'fft-emg-1-1','fft-emg-1-2','fft-emg-1-3','fft-emg-1-4','fft-emg-1-5'};
GyroNames = {'fft-gyro-x-1','fft-gyro-x-2','fft-gyro-x-3','fft-gyro-x-4','fft-gyro-x-5'};
OrienNames = {'fft-orien-x-1','fft-orien-x-2','fft-orien-x-3','fft-orien-x-4','fft-orien-x-5'};
EulerNames = {'fft-euler-roll-1','fft-euler-roll-2','fft-euler-roll-3','fft-euler-roll-4','fft-euler-roll-5'};
disp(size(coeff));
biplot(coeff(1:5,1:3),'scores',score(1:5,1:3), 'VarLabels', AccNames);
outputFolder='Graph';
if ~exist(outputFolder, 'dir')
mkdir(outputFolder);
end
name = strcat(outputFolder,"/","pca_plots_acc",".jpg");
saveas(gcf,name);
biplot(coeff(46:50,46:48),'scores',score(1:5,46:48), 'VarLabels', EMGNames);
name = strcat(outputFolder,"/","pca_plots_emg",".jpg");
saveas(gcf,name);
biplot(coeff(166:170,166:168),'scores',score(1:5,166:168), 'VarLabels', GyroNames);
name = strcat(outputFolder,"/","pca_plots_gyro",".jpg");
saveas(gcf,name);
biplot(coeff(211:215,211:213),'scores',score(1:5,211:213), 'VarLabels', OrienNames);
name = strcat(outputFolder,"/","pca_plots_orien",".jpg");
saveas(gcf,name);
biplot(coeff(271:275,271:273),'scores',score(1:5,271:273), 'VarLabels', EulerNames);
name = strcat(outputFolder,"/","pca_plots_euler",".jpg");
saveas(gcf,name);

