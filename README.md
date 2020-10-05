# Societal_Impact_CAProp20
Societal impact and cost of California Proposition 20 (2020). Please see the code folder for information on how we produced our [interactive figure](https://anitato.shinyapps.io/Societal_Impact_CAProp20/) for the California Election Data Challenge at UC Davis during Fall 2020.

In California's current criminal justice system, people who commit property crimes
that are less than $950 in value (called "petty theft") can only be charged with
misdemeanors, as opposed to felonies. The maximum sentence for these petty theft misdemeanors is jail for one year. One of the changes that Proposition 20 would introduce is that people who commit petty theft crimes could be sentenced to up to a year in jail with misdemeanors (like current conditions) OR be sentenced to 16 months, 2 years, or 3 years in
prison with felonies. Crimes that could be charged as either misdemeanors or felonies are called wobbler crimes. Those who support the change from only misdemeanor to wobbler believe that it will make California safer, while opponents of this change believe
that sending people to prison produces a high cost to taxpayers.

*What is the cost to taxpayers for increasing the number of prison inmates as a result of Proposition 20? Does society save money if Prop 20 causes a reduction in crime rate in California, specifically because some property no longer gets stolen?*

Our interactive figure lets you find out the conditions in which society could save money with Prop 20's affect on petty theft classification. Below is a general description
of how we obtained the values used to make this interactive graph.

**Percent Reduction in Rates of Property Crimes Costing less than $950**
We focus on crimes committed that have a value of $950 or less, because Prop 20 introduces changes for that range of crimes. We used crime records from the California Department of Justice to find out how many property crimes below $950 are committed and the average cost of those crimes. By multiplying these two values, we get the total cost of petty theft to society in California. We calculate the fraction that society gets back based on the user’s choice for the percent reduction in property crimes that this proposition could lead to.

**Number of New Prison Inmates per Year under Prop 20**
This slider lets you choose from a plausible range of values for the number of
additional people per year that will be going to prison. We were able to estimate
this range because the change that Prop 20 proposes is actually a reversal of
what Proposition 27 introduced when it was passed in 2014. Specifically, Prop 47
made it so that petty thefts could no longer become felonies. By looking at FBI
prison records, we found a significant decrease in the rate of new property-related felonies after 2014, when Prop 47 passed. We assume that this reduction represents the number of people who would have been sentenced to prison with felonies if that were possible, but instead went to county jail for one year with a misdemeanor instead. The range of values provided are the 95% confidence interval of the difference in means between 2012-2014 (felonies allowed) and 2015-2016 (felonies not allowed). We note that this count is a conservative estimate because it excludes the convicted felons that went to county jail for their sentence. In 2011, California bill AB109 allowed the possibility for felons to serve their sentence in jails instead of prisons. We could not find jail records that allowed us to track the number of felons of property crimes in jail over time.  

**Average Sentence Length:**
The minimum and maximum are based on the range of sentence lengths for felons of property crimes: 16 months and 3 years, respectively. Since we are interested in the additional cost of Prop 20 relative to current conditions, we subtract the average sentence length by 1 because we assume that those who would be entering the prison system would have been sentenced to jail for the maximum time without Prop 20. The cost per year can be found at: https://lao.ca.gov/PolicyAreas/CJ/6_cj_inmatecost
