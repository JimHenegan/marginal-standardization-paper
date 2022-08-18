********* Theoretical figures 
clear
set obs 100
gen x = _n

** generate logit & outcomes 
global b0 = -6
global b1 = .12
gen xb = $b0 + $b1*x // linear predictor
gen expit =  1/(1+exp(-(xb)))  // probs, i.e. E(Y)
set seed 3467
gen y = rbinomial(1,expit)

global yrange -0.15 1.5
global ptscol gs8%20 // color of Y/N obs

    *logit
    twoway ///
     (scatter y x, mcolor($ptscol) msize(medium) msymbol(Oh) jitter(2)) ///
     (line expit x, lwidth(medthick) lcolor(gs8)) ///
     , legend(off) ///
       ylab(0(.5)1, angle(horizontal) labsize(vlarge)) /// 
       xlab(0(50)100, labsize(vlarge)) /// 
       xscale(range(0 105)) ///
       yscale(range ($yrange)) /// ytitle("Outcome Probability") /// xtitle("X (Predictor)") ///
       ytitle("") xtitle("") ///
       nodraw ///
       graphregion(fcolor(white) lcolor(white) ifcolor(white) ilcolor(white)) ///
       name(logit1, replace)   

    *identity
    gen xb_plot = -.15 + .013*x // linear predictor
    twoway ///
     (scatter y x, mcolor($ptscol) msize(medium) msymbol(Oh) jitter(2)) ///
     (line xb_plot x, lwidth(medthick) lcolor(gs8)) ///
     (line xb_plot x if xb_plot<0, lwidth(medthick) lcolor(red) lpattern(solid)) ///
     (line xb_plot x if xb_plot>1, lwidth(medthick) lcolor(red) lpattern(solid)) ///
     , legend(off) ///
       ylab(0(.5)1, angle(horizontal) labsize(vlarge)) /// 
       xlab(0(50)100, labsize(vlarge)) /// 
       xscale(range(0 105)) ///
       yscale(range ($yrange)) /// ytitle("Outcome Probability") /// xtitle("X (Predictor)") ///
       ytitle("") xtitle("") ///
       nodraw ///
       graphregion(fcolor(white) lcolor(white) ifcolor(white) ilcolor(white)) ///
       name(lin1, replace)   
   
    *log
    capture drop xb_plot2 exp
    gen xb_plot2 = -5 + .052*x // linear predictor
    gen exp = exp(xb_plot2) // inv log-link
    twoway ///
     (scatter y x, mcolor($ptscol) msize(medium) msymbol(Oh) jitter(2)) ///
     (line exp x, lwidth(medthick) lcolor(gs8)) ///
     (line exp x if exp<0, lwidth(medthick) lcolor(red) lpattern(solid)) ///
     (line exp x if exp>1, lwidth(medthick) lcolor(red) lpattern(solid)) ///
     , legend(off) ///
       ylab(0(.5)1, angle(horizontal) labsize(vlarge)) /// 
       xlab(0(50)100, labsize(vlarge)) /// 
       xscale(range(0 105)) ///
       yscale(range ($yrange)) /// ytitle("Outcome Probability") /// xtitle("X (Predictor)") ///
       ytitle("") xtitle("") ///
       nodraw ///
       graphregion(fcolor(white) lcolor(white) ifcolor(white) ilcolor(white)) ///
       name(log1, replace)   
   
global theoryplots lin1 log1 logit1 // list of theory plots

/*   
graph combine $theoryplots ///
  , rows(1)  ///
    graphregion(fcolor(white) lcolor(white) ifcolor(white) ilcolor(white)) ///
    nodraw /// 
    name(sim, replace)
*/ 
 
*****  Synthetic Data **************
clear
import delimited "../../../synthetic-data/aric-synth.csv"
drop if age>65 // N=2
set seed 98743
gen plotem = runiform()

/*
*risk difference
glm death neversmoke, family(binomial) link(identity)

*risk ratio
glm death neversmoke, family(binomial) link(log)
*/


*linear
global adj age male bmi


******************************************************
** Models & predicted values ***

** Linear
reg death eversmoke $adj   
  capture drop lin
  predict lin
 
*log-link
*glm death ever $adj, family(binomial) link(log) // no convergence
glm death eversmoke $adj, family(poisson) link(log) 
  capture drop log
  predict log  

*logit-link
glm death eversmoke $adj, family(binomial) link(logit) 
  capture drop logit
  predict logit
  
 ** look at bounds for plots 
 summ lin log logit
 summ log, detail
 *truncate 1 value in the log-link model to 1.49
 replace log = 1.49 if log>1.49 & !missing(log)
 
 
*hilight observations out of prediction (oops) bounds
capture drop oops*
gen oopslin =  (lin<0 | lin>1)
gen oopslog =  (log<0 | log>1)
gen oops =  oopslin | oopslog

******************************************************
** Plots ***  
  
** Age Plots
capture program drop ageplots
program ageplots 
  global ageplots // initialize list of plots
  foreach pred of var lin log logit {
     *define out of prediction points to higlight
     if ("`pred'"=="lin") {
        local oopsem oopslin
        }
     else {
        local oopsem oops
        }
    ** make plot
    twoway ///
     (scatter death  age if ever==0 & plotem<0.05, mcolor($evercol1)  msize(medium) msymbol(Oh) jitter(2)) ///
     (scatter death  age if ever==1 & plotem<0.05, mcolor(navy%05) msize(medium) msymbol(Oh) jitter(2)) ///
     (scatter `pred' age if ever==0 & plotem<0.10, mcolor(navy%10) msymbol(O) msize(tiny)) ///
     (scatter `pred' age if ever==1 & plotem<0.10, mcolor(red%10) msymbol(O) msize(tiny)) ///
     (scatter `pred' age if ever==0 & `oopsem'==1, mcolor(navy) msymbol(O) msize(tiny)) ///
     (scatter `pred' age if ever==1 & `oopsem'==1, mcolor(cranberry) msymbol(O) msize(tiny)) ///
     (lowess  `pred' age if ever==0, sort lwidth(medthick) lcolor(navy)) ///
     (lowess  `pred' age if ever==1, sort lwidth(medthick) lcolor(cranberry)) ///
     , legend(off) ///
       ylab(0(.5)1, angle(horizontal) labsize(vlarge)) /// 
       xlab(, labsize(vlarge)) /// 
       nodraw /// 
       yscale(range ($yrange)) /// ytitle("Death Probability") /// xtitle("Age") ///
       xscale(range(43 67)) ///
       ytitle("") xtitle("") ///
       graphregion(fcolor(white) lcolor(white) ifcolor(white) ilcolor(white)) ///
       name(age`pred', replace)    
       global ageplots $ageplots age`pred' // create list of plots
   } // end foreach
end // end program
ageplots


   

graph combine lin1 log1 logit1 $ageplots  ///
  , cols(3) imargin(l=0 r=0 t=3 b=2) ///
    graphregion(fcolor(white) lcolor(white) ifcolor(white) ilcolor(white)) ///
    name(fig2, replace)

graph replay fig2   
   
  
graph export "./basis-for-figure-2.png", as(png) name("fig2")