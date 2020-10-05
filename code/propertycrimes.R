############################################################
# this script cleans the California prison data from:
# United States Department of Justice. Office of Justice Programs. Bureau of Justice Statistics. National Corrections Reporting Program, 1991-2016: Selected Variables. Inter-university Consortium for Political and Social Research [distributor], 2018-08-30. https://doi.org/10.3886/ICPSR37021.v1
############################################################

# setwd("~/Documents/GitHub/")

load("Societal_Impact_CAProp20/data/37021-0001-Data.rda")

# get CA data only
ca.terms = da37021.0001[which(da37021.0001$STATE=="(06) California"),]

# data cleaning, remove parentheses numbers
ca.terms.clean = data.frame(lapply(ca.terms, function(x) gsub("\\([^\\)]+\\)\\s", "", x)))

# No. property crimes per year
propertycrimes = table(ca.terms.clean[which(ca.terms.clean$OFFGENERAL == "Property"), 6])

# output filtered and cleaned dataset
save(propertycrimes, file = "Societal_Impact_Prop20/data/propertycrimes.rda")