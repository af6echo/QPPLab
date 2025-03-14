%% Setup parameters
clc
%%% load unreorganized data
dataIN='../data/input_data.mat'; D=load(dataIN,'B','MotionInf'); D0=D.B; 
%%% define output filename
dataOUT='../data/output_data.mat';
%%% load parcel label and network spreedsheet
AtlasTable = readtable(['../assets/atlas.xlsx']);
% AtlasTable = readtable(['./resources/Schaefer2018_400Parcels_7Networks_2mm.xlsx']);
Label='Parcel_ID'; % this should be variable name of the numerical label of ROIs
System='Area_Name'; % this is the variable name of the numerical label of functional networks
%%% add function files
addpath('./QPPfv0922/')
%% code
AtlasTable.Label=eval(['AtlasTable.' Label]); AtlasTable.System=eval(['AtlasTable.' System]);
AtlasTable = sortrows(AtlasTable,'Label','ascend');
[NetLB, net_index, ROI2Net]=unique(AtlasTable.System,'stable'); 
[nsbj, nscn]=size(D0); [nroi,ntimepoint]=size(D0{1,1});
if ~isfield(D, 'MotionInf')
    for i=1:nsbj, for j=1:nscn,[~,ntimepoint]=size(D0{i,j});  MotionInf{i,j}=[1:ntimepoint]; end; end
end
save(dataOUT,'D0','MotionInf','ROI2Net','NetLB');
