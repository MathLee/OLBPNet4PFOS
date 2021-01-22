function mIoU = Measure_all_FDM()
GTPath = '/home/lgy/Github/OLBP/models/OLBPNet/PFOS/test/GT/';
salPath = '/home/lgy/Github/OLBP/models/OLBPNet/PFOS/sal_test/';
binaryPath = '/home/lgy/Github/OLBP/models/OLBPNet/PFOS/binary_test/';
sumIoU = 0.0;
sumSmeasure = 0.0;
sumFmeasure = 0.0;
sumEmeasure = 0.0;
sumwFmeasure = 0.0;
sumlengths = 0;
measure_length = 0;

for i = 1601 : 1700
        name = num2str( i );
    for j = 1001 : 1015
    FDMname = num2str( j );
    measure_length = measure_length+1;
    display([ 'OLBPNet Measure: ' num2str(measure_length) '/1500 , ' name ' -- ' FDMname  ]);
    display([ name ' - ' FDMname    ]);
    gt = im2double(imread(fullfile(GTPath, name, [FDMname '.png'])));
    sal = im2double(imread(fullfile(salPath, name, [FDMname '.png'])));

%% mIoU
    threshold = graythresh(sal);
    sal = ( sal > threshold );
    sal = double(sal);
    pointproduct=gt.*sal;
    pointadd=gt+sal;
    I=sum(pointproduct(:));
    U=sum(pointadd(:)>=1);
    IoU=I/U;
    sumIoU=sumIoU+IoU;
   
%% wFm
    gt3 = gt;
    wFmeasure= WFb(sal,logical(gt3));
    sumwFmeasure = sumwFmeasure+wFmeasure;

%% Sm
    gt1 = gt;
    Smeasure = StructureMeasure(sal,logical(gt1));
    sumSmeasure = sumSmeasure+Smeasure;

%% Fm
    gt2 = gt;
    Fmeasure = Fmeasure_calu(sal,double(gt2));
    sumFmeasure = sumFmeasure+Fmeasure;    
    
%% Em
    gt4 = gt;
    Emeasure = Enhancedmeasure(sal,gt4);
    sumEmeasure = sumEmeasure+Emeasure;    
    
    sumlengths = sumlengths + 1;    
    if ~exist(fullfile(binaryPath, name),'dir')
        mkdir(fullfile(binaryPath, name));
    end
    imwrite(sal, fullfile(binaryPath, name, [FDMname '.png']));
    end
end
mIoU = round(sumIoU/(sumlengths)*1000)/1000;
mSmeasure = round(sumSmeasure/(sumlengths)*1000)/1000;
mFmeasure = round(sumFmeasure/(sumlengths)*1000)/1000;
mEmeasure = round(sumEmeasure/(sumlengths)*1000)/1000;
mwFmeasure = round(sumwFmeasure/(sumlengths)*1000)/1000;
display(['mIoU = ' num2str(mIoU) ', mSmeasure = ' num2str(mSmeasure) ', mwFmeasure = ' num2str(mwFmeasure)  ', mEmeasure = ' num2str(mEmeasure) ', mFmeasure = ' num2str(mFmeasure) ' , Dataset sumlengths: ' num2str(sumlengths)]);
end
