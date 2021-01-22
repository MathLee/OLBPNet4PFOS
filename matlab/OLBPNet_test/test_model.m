clear;
clc;
close all;
%% Producing the segmentatiom map of OLBPNet on PFOS Testing set
display(['Producing the segmentatiom map of OLBPNet on PFOS Testing set.']);
mIoU1 = test_OLBPNet(30000); 
