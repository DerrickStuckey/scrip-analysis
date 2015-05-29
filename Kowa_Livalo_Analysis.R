## Kowa Pharmaceuticals Payments/Livalo Prescriptions Analysis

livalo_prescribers <- read.delim("../cms-merge/data/livalo_prescribers.txt")
kowa_payments <- read.csv("../cms-merge/data/kowa_payments.csv")
npi_profile_merge <- read.csv("../cms-merge/data/initial_merge.csv")

npi_kowa_merge <- merge(kowa_payments, npi_profile_merge, by.x = "Physician_Profile_ID", by.y = "OpProfileId")

livalo_relevant <- data.frame("NPI"=livalo_prescribers$NPI,"TOTAL_CLAIM_COUNT"=livalo_prescribers$TOTAL_CLAIM_COUNT)
npi_kowa_relevant <- data.frame("NPI"=npi_kowa_merge$NPI, "Total_Payment_Value"=npi_kowa_merge$Total_Payment_Value)

#set of Livalo prescribers receiving payments from Kowa
livalo_kowa_merge <- merge(livalo_relevant, npi_kowa_relevant, by=c("NPI"))

#set of Livalo prescribers not receiving payments from Kowa
livalo_prescribers_unpaid <- livalo_prescribers[! livalo_prescribers$NPI %in% livalo_kowa_merge$NPI,]

t_test_results <- t.test(livalo_kowa_merge$TOTAL_CLAIM_COUNT, livalo_prescribers_unpaid$TOTAL_CLAIM_COUNT)
