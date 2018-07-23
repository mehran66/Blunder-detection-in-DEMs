%parameter setting
no_cat=50;
chrom_length=10;
smp=10;
spc=true;
MR=.2;
c=2;
%initial population
inputfile=uigetfile('*.*','Import your point file');
patch = xlsread(inputfile);
surface=patch(:,2:4);
pop=randi([1,length(patch)],no_cat,chrom_length);
[pop(:,(2*chrom_length)+1),parameters,mm,nn]=CostCSO_Fcn(surface,pop(:,1:chrom_length));
pop(:,chrom_length+1:2*chrom_length)=residual_fnc(surface,pop(:,1:chrom_length),parameters,mm,nn);

