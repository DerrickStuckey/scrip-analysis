## OpenPayments "General Payments" data exploration

openpayments <- read.csv("~/Desktop/2042_Labs/OpenPayments/12192014_RFRSHDTL/OPPR_RFRSH_DTL_GNRL_12192014.csv")

hist(openpayments$Submitting_Applicable_Manufacturer_or_Applicable_GPO_Name)

mfr_summary <- summary(openpayments$Submitting_Applicable_Manufacturer_or_Applicable_GPO_Name)

kowa_payments <- openpayments[openpayments$Submitting_Applicable_Manufacturer_or_Applicable_GPO_Name=="Kowa pharmaceutical Co.Ltd",]
