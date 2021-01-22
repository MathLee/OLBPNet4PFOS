%%
function FmeasureF = Fmeasure_calu(sMap,gtMap)
Label3 = sMap;

NumRec = length( find( Label3==1 ) );
LabelAnd = Label3 & gtMap;
NumAnd = length( find ( LabelAnd==1 ) );
num_obj = sum(sum(gtMap));

if NumAnd == 0
    PreFtem = 0;
    RecallFtem = 0;
    FmeasureF = 0;
else
    PreFtem = NumAnd/NumRec;
    RecallFtem = NumAnd/num_obj;
    FmeasureF = ( ( 1.3* PreFtem * RecallFtem ) / ( .3 * PreFtem + RecallFtem ) );
end

%Fmeasure = [PreFtem, RecallFtem, FmeasureF];

