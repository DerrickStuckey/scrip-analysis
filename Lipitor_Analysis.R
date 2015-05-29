## Pfizer Payments/Lipitor Prescriptions Analysis

lipitor_prescribers <- read.delim("../cms-merge/data/lipitor_prescribers.txt")
pfizer_payments <- read.csv("../cms-merge/data/pfizer_payments.csv")
npi_profile_merge <- read.csv("../cms-merge/data/initial_merge.csv")

npi_pfizer_merge <- merge(pfizer_payments, npi_profile_merge, by.x = "Physician_Profile_ID", by.y = "OpProfileId")

lipitor_relevant <- data.frame("NPI"=lipitor_prescribers$NPI,"TOTAL_CLAIM_COUNT"=lipitor_prescribers$TOTAL_CLAIM_COUNT)
npi_pfizer_relevant <- data.frame("NPI"=npi_pfizer_merge$NPI, "Total_Payment_Value"=npi_pfizer_merge$Total_Payment_Value)

lipitor_pfizer_merge <- merge(lipitor_relevant, npi_pfizer_relevant, by=c("NPI"))
