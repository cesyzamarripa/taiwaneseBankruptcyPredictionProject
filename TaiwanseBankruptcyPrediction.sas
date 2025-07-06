

%web_drop_table(WORK.Taiwan);


FILENAME REFFILE '/home/u63830810/sasuser.v94/capstone1/taiwaneseData.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.Taiwan;
	GETNAMES=NO;
	DATAROW=2;
RUN;

PROC CONTENTS DATA=WORK.Taiwan; RUN;


%web_open_table(WORK.Taiwan);

/*logistic regression*/
ods graphics on;

proc logistic data=WORK.Taiwan plots(maxpoints=none)=roc;
   model Var1(event='1') = Var2 - Var96 / selection=stepwise ridging=none;
   roc;
   ods output ROCAssociation=AUC_Stats;
run;

ods graphics off;

proc print data=AUC_Stats noobs label;
   var Area;
   title "AUC Value from Stepwise Logistic Regression Model";
run;

/*decision tree*/
proc hpsplit data=WORK.Taiwan;
   class Var1;
   model Var1(event='1') = Var2 - Var96;
   grow entropy;
   prune costcomplexity;
   partition fraction(validate=0.3);
   output out=TreePreds;
run;