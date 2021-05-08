{smcl}
{* *! version 15.0 7May2021} {...}
{viewerdialog demo "dialog demo"}{...}
{viewerjumpto "Description" "demo##description"}{...}
{viewerjumpto "Example" "demo##example"}{...}

{p2col : {bf: stataon}} Stata will guide you

{marker description}{...}
{title:Description}
{pstd}

This help file is created to describe the objective of this program. The name of the .ado file is "demo".
However, "demo" is not a program. There are four programs in the .ado file which are {it: stataon}, {it: stcheck},
{it: ols}, and {it:assumption}. Once user type stataon, Stata will guide user what to do next. My purpose of 
writing these programs are twofold: (1) to show that beginner user of Stata can use it more conveniently
if Stata Corp. Ltd. or course instructors add such programs while teaching and (2) while using Stata for
first time, newbie becomes very excited. They want to do everything at the same time but can not handle
so many commands easily. Neither they understand all elements presented in output table. Therefore, course
instructors can add decisions after presenting statistic and p-value in case of assumption testing.
Moreover, rather than using four/five commands for assumption testing, these can be packed in one program. 

I think that in this way, beginners will be able to see how Stata programming looks like and they can see
their desired outlook of result for first hand experience.  

I have prepared it particularly for demonstration purpose. I have demonstrated how to do
OLS regression and test assumptions in Stata. After running regress command, we can test many assumptions.
The file contains only three of those: heteroskedasticity, normal distribution, and Ramsey RESET test.
Whether residuals are normally distributed can be checked using formal test and graphical presentation.
Both options are provided here. While user will type 'assumption', Stata will present result differently
than usual. It will show relevant statistic, p-value and decision.   

Italic texts indicate command of Stata. User can type those in Stata command section or in .do file or can search in Stata.

{marker examples} {...}
{title: Examples}
{hline}
{pstd} Setup

{pstd} *At first, run lines 5-114 of demo.ado blindly {it: select lines 5-114 and press ctrl+D}. Stata commands are prepared by such programming. However, as this is not any intellectual contribution and programs are provided, I have not linked up each program. 

{phang2}{cmd:. stataon}

{pstd} Keep an eye on output window and load dataset.

{phang2}{cmd:. sysuse auto} 

{pstd} We are using dataset provided with Stata. As it is already in system, we are using {it: sysuse} rather than {it:use}. Name of the data is {bf: auto}. 

{phang2}{cmd:. stcheck}

{pstd} The command will let you know whether dataset is loaded. Moreover, it will provide summary statistics and description of data. For usual Stata command, check {it: summ} and {it: describe}.

{phang2}{cmd:. ols}

{pstd} It will provide relevant direction for next step.

{phang2}{cmd:. regress price weight length foreign rep78}

{phang2}{cmd:. assumption}

{pstd} This command will provide relevant statistic, p-values, and decisions taken from the tests.

{hline}
