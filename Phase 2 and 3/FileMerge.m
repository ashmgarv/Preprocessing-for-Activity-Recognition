function mergedFile = FileMerge(filepath,name,c)

file=strcat(filepath,'/','*.csv');
files=dir(file);
joinedTables=readtable(strcat(filepath,'/',files(1).name));

joinedTables.Properties.VariableNames = c(1);

for i=2:length(files)
        tables=readtable(strcat(filepath,'/',files(i).name));
        tables.Properties.VariableNames=c(i);
        joinedTables=innerjoin(joinedTables,tables,'LeftKeys',1,'RightKeys',1);
end

mergedFile=joinedTables;