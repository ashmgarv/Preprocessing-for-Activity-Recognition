function outputArg1 = featureExtracter(FT)

[~,~,indX] = unique(FT(:,[23, 24]), 'rows');
    groups = accumarray(indX, (1:size(FT,1)).', [], @(x) {FT(x,:)});

matches = {'acc_x','acc_y','acc_z','emg1','emg2','emg3','emg4','emg5','emg6','emg7','emg8','gyro_x','gyro_y','gyro_z','ori_x','ori_y','ori_z','ori_w','roll','pitch','yaw'};
maxV = 6;
features_for_all_variables_all_datapoints = [];
for k=1:8
    features_for_all_variable = [];
    for i=1:21
         all_features = [];
         feature_fft = abs(fft(groups{k}{:,(matches(1,i))}));
         feature_fft = sort(feature_fft,'descend');
         feature_fft = feature_fft(1:maxV);
         all_features = cat(1, all_features, feature_fft);
         CI = groups{k}{:,(matches(1,i))};
         nanIndex = find(isnan(CI));
         CI(nanIndex) = 0;
         feature_dwt = dwt(CI,'sym4');
         feature_dwt = sort(feature_dwt,'descend');
         feature_dwt = feature_dwt(1:maxV);
         all_features = cat(1, all_features, feature_dwt);
         features_std = std(groups{k}{:,(matches(1,i))});
         all_features = cat(1, all_features, features_std);
         feature_zscore_ = sort(abs(zscore(groups{k}{:,(matches(1,i))})), 'descend');
         feature_zscore = feature_zscore_(1);
         all_features = cat(1, all_features, feature_zscore);
         feature_rms = rms(groups{k}{:,(matches(1,i))});
         all_features = cat(1, all_features, feature_rms);
         features_for_all_variable = cat(1,features_for_all_variable, all_features);
    end
        features_for_all_variables_all_datapoints = cat(2,features_for_all_variables_all_datapoints, features_for_all_variable);
        plotFeatures(features_for_all_variables_all_datapoints, k);
end

plotFeatures(features_for_all_variables_all_datapoints, 9);
outputArg1 = features_for_all_variables_all_datapoints;

