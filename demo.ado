/*#StataCorp.Ltd. can add new features in Stata that will guide beginners regarding how to proceed on*/
*Prepared by Susmita Dutta
*5 May, 2021 - 7 May, 2021
*RUN LINES 5-114 BLINDLY. THEN GO TO LINE 117 FOR HAVING STATA COMMAND.
clear all

*Version 15.0*

program stataon
di  as text "Welcome to Stata" 
di " " 
di "Load dataset using {it:use} or {it:import}"
di " "
di "After loading dataset type {it: stcheck} "
end

capture program drop stcheck
program stcheck
quietly describe
quietly scalar obs = r(N)
if obs==0 {
di as error "Data is not loaded"
}
else {
di as text "Data is loaded"
di " "
di as text "Summary statistics"
summ
di " "
di as text "description"
describe
di " "
di as text "For OLS: run code {it:ols}"
di " " 
}
end

capture program drop ols
program ols
di as text "type {it: h reg}: You will find command {it:(regress)} for running OLS and relevant options}"
di "type {it: reg} dep_var indep_var"
di " "
di "type {it: assumption} after running regression"
end

capture program drop assumption
program assumption
di " "
di " " 
di as text "This command will show you results of relevant assumption testing."

*predicted dependent variable
predict yhat

*predict residual 
predict residual, resid
*predict standard residual
predict standardr, rstandard

*testing heteroskedasticity
quietly estat hettest
quietly scalar chi2stat = r(chi2)
di "Breusch-Pagan test for heteroskedasticity"
di "1. Chi-square statistic is: " chi2stat
quietly scalar hetp = r(p)
di "Probability is: " hetp
if hetp <0.05{
di as result "Decision: Residual is heteroskedastic. Take necessary measure."
}
else {
di as result "Decision: Residual is homoskedastic"
}
di " "
di " " 

*normality test of residual: formal test. 
quietly swilk(residual)
di as text "2. Shapiro-Wilk W test for normal data"
quietly  scalar zte = r(z)
di "Z statistic is: " zte
quietly scalar norp = r(p)
di "Probability is: " norp
if norp <0.05{
di as result "Decision: Residuals are not normally distributed: Take necessary measure"
}
else {
di as result "Decision: Residuals are normally distributed"
}
di " "
di " " 

*normality test of residual: graphical test
di as text  "3. Graphical assessment of normality of residual"
histogram residual, normal
di " "
di " " 

*Checking omitted variable bias
quietly estat ovtest
di as text "4. Ramsey RESET test"
quietly scalar fst = r(F)
di  "F statistic is: " fst
quietly scalar ovp = r(p)
di "Probability is: " ovp
if ovp <0.05 {
di as result "Decision: Present linear functional form is not adequate to model this relationship."
}
else {
di as result "Decision: Model has no omitted variables"
}
di " "
di " " 
di as text "{bf: For more}: type {it: help regress postestimation}"
end


*After running lines 5-114, you can use following codes as Stata command 
stataon
stcheck
ols
assumption


*LET ME KNOW IF THERE IS ANY BUG.
