Societal Impact and Cost of CA Prop 20
================
Lida Anita To, Sivan Yair, and Fernanda Guizar

University of California — Davis

Deptartment of Evolution & Ecology

-----

### **Interactive widget:**

**<https://anitato.shinyapps.io/Societal_Impact_CAProp20/>**

# California Proposition 20, Criminal Sentencing, Parole, and DNA Collection Initiative (2020)

This Git Repository contains the directions to produce a widget that
calculates the societal cost of increasing the California prison inmate
population size under the proposed Proposition 20.

California Proposition 20, the Criminal Sentencing, Parole, and DNA
Collection Initiative, is on the ballot in California as an initiated
state statute on November 3, 2020.

The proposed bill would:

1.  Add crimes to the list of violent felonies for which parole is
    restricted

2.  Allow certain types of theft and fraud crimes currently only
    chargeable as misdemeanors to be chargeable as felonies

3.  Require DNA collection for certain misdemeanors

**Supporters** believe Prop 20 would make California safer.

**Opponents** believe the bill adds stress to an already overcrowded
prison system and that maintaining prisoners for longer sentences would
be extremely costly.

## Questions

**What is the societal cost of increasing the number of prison inmates
as a result of Proposition 20?**

  - What is the cost of increasing the number of new “wobblers” in the
    prison system to taxpayers?

  - Does society save money if Prop 20 causes a reduction in crime rate
    in California? (Under the assumption that Prop 20 could potentially
    decrease the overall crime rate.)

### More Information on Prop 20:

Summary:

<https://ballotpedia.org/California_Proposition_20,_Criminal_Sentencing,_Parole,_and_DNA_Collection_Initiative_(2020)#Assembly_Bill_109_.282011.29>

Full statute text:

<https://vig.cdn.sos.ca.gov/2020/general/pdf/topl-prop20.pdf>

## The Data

**National Archive of Criminal Justice Data:**

United States Department of Justice. Office of Justice Programs. Bureau
of Justice Statistics. National Corrections Reporting Program,
1991-2016: Selected Variables. Inter-university Consortium for Political
and Social Research \[distributor\], 2018-08-30.
<https://doi.org/10.3886/ICPSR37021.v1>

  - This dataset includes every prison entry in the United States from
    1991-2016 and their unique-individual IDs, demographic data, and
    sentencing data. We filtered this dataset for California entries
    listed under “Property Crimes” (which include: larceny, burglary,
    fraud, and motor vehicle theft).
  - *Directions:*
    1.  Make a free account with NACJD
    2.  Download the 1991-2016 data in `R` format
    3.  Place the data in the `Societal_Impact_CAProp20/data/` directory
    4.  Process, clean, and filter the data using
        `Societal_Impact_CAProp20/code/propertycrimes.R`

**California Department of Justice:**

<https://openjustice.doj.ca.gov/data>

  - This dataset contains the total number of property crimes committed
    in California (including those in which perpetrators were not
    caught) every year since 1980. It includes information on the number
    of property crimes committed that were valued $50 or less, $50-200,
    $200-400, and $400+.
  - *Directions:*
    1.  Hello world
    2.  Hello again
    3.  And again

**Average cost of maintaining a single CA prison inmate per year**

<https://lao.ca.gov/PolicyAreas/CJ/6_cj_inmatecost>

## Method

In California’s current criminal justice system, people who commit
property crimes that are less than $950 in value (called “petty theft”)
can only be charged with misdemeanors, as opposed to felonies. The
maximum sentence for these petty theft misdemeanors is jail for one
year. One of the changes that Proposition 20 would introduce is that
people who commit petty theft crimes could be sentenced to up to a year
in jail with misdemeanors (like current conditions) OR be sentenced to
16 months, 2 years, or 3 years in prison with felonies. Crimes that
could be charged as either misdemeanors or felonies are called wobbler
crimes. Those who support the change from only misdemeanor to wobbler
believe that it will make California safer, while opponents of this
change believe that sending people to prison produces a high cost to
taxpayers.

What is the cost to taxpayers for increasing the number of prison
inmates as a result of Proposition 20? Does society save money if Prop
20 causes a reduction in crime rate in California, specifically because
some property no longer gets stolen?

Our interactive figure lets you find out the conditions in which society
could save money with Prop 20’s affect on petty theft classification.
Below is a general description of how we obtained the values used to
make this interactive graph.

**Percent Reduction in Rates of Property Crimes Costing less than
$950:** We focus on crimes committed that have a value of $950 or less,
because Prop 20 introduces changes for that range of crimes. We used
crime records from the California Department of Justice to find out how
many property crimes below $950 are committed and the average cost of
those crimes. By multiplying these two values, we get the total cost of
petty theft to society in California. We calculate the fraction that
society gets back based on the user’s choice for the percent reduction
in property crimes that this proposition could lead to.

**Number of New Prison Inmates per Year under Prop 20:** This slider
lets you choose from a plausible range of values for the number of
additional people per year that will be going to prison. We were able to
estimate this range because the change that Prop 20 proposes is actually
a reversal of what Proposition 27 introduced when it was passed in 2014.
Specifically, Prop 47 made it so that petty thefts could no longer
become felonies. By looking at FBI prison records, we found a
significant decrease in the rate of new property-related felonies after
2014, when Prop 47 passed. We assume that this reduction represents the
number of people who would have been sentenced to prison with felonies
if that were possible, but instead went to county jail for one year with
a misdemeanor instead. The range of values provided are the 95%
confidence interval of the difference in means between 2012-2014
(felonies allowed) and 2015-2016 (felonies not allowed). We note that
this count is a conservative estimate because it excludes the convicted
felons that went to county jail for their sentence. In 2011, California
bill AB109 allowed the possibility for felons to serve their sentence in
jails instead of prisons. We could not find jail records that allowed us
to track the number of felons of property crimes in jail over time.

**Average Sentence Length:** The minimum and maximum are based on the
range of sentence lengths for felons of property crimes: 16 months and 3
years, respectively. Since we are interested in the additional cost of
Prop 20 relative to current conditions, we subtract the average sentence
length by 1 because we assume that those who would be entering the
prison system would have been sentenced to jail for the maximum time
without Prop 20. The cost per year can be found at:
<https://lao.ca.gov/PolicyAreas/CJ/6_cj_inmatecost>

## R Shiny

Code for the R Shiny interactive widget can be found in
`Societal_Impact_CAProp20/code/CAProp20_rshiny.R`

**You can interact with the live widget
[here](https://anitato.shinyapps.io/Societal_Impact_CAProp20/).**

This widget allows you to calculate the net annual cost of the increase
in prison population as a result of Proposition 20. There are sliders
for
