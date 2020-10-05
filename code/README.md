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

## R Shiny

Code for the R Shiny interactive widget can be found in
`Societal_Impact_CAProp20/code/CAProp20_rshiny.R`

**You can interact with the live widget
[here](https://anitato.shinyapps.io/Societal_Impact_CAProp20/).**

This widget allows you to calculate the net annual cost of the increase
in prison population as a result of Proposition 20. There are sliders
for

<https://lao.ca.gov/PolicyAreas/CJ/6_cj_inmatecost>