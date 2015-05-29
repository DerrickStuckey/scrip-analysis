## Eli Lilly Payments/Prozac Prescriptions Analysis

prozac_prescribers <- read.delim("../cms-merge/data/prozac_prescribers.txt")
lilly_payments <- read.csv("../cms-merge/data/eli_lilly_payments.csv")
npi_profile_merge <- read.csv("../cms-merge/data/initial_merge.csv")

npi_lilly_merge <- merge(lilly_payments, npi_profile_merge, by.x = "Physician_Profile_ID", by.y = "OpProfileId")

prozac_relevant <- data.frame("NPI"=lipitor_prescribers$NPI,"TOTAL_CLAIM_COUNT"=lipitor_prescribers$TOTAL_CLAIM_COUNT)
npi_lilly_relevant <- data.frame("NPI"=npi_lilly_merge$NPI, "Total_Payment_Value"=npi_lilly_merge$Total_Payment_Value)

prozac_lipitor_merge <- merge(prozac_relevant, npi_lilly_relevant, by=c("NPI"))

