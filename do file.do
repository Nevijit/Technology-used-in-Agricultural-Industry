use "C:\1 reference\test2\baseline_data_stata12.dta"
//begin task1//
clear
use "C:\1 reference\test2\baseline_data_stata12.dta"
drop d_code v_code a13 group b11 b12 d11 d13_q_01 d13_q_02 d13_q_03 d13_q_04 d13_q_05 d13_q_06 d13_q_07 d13_q_08 d13_q_09 d13_q_10 
drop d13_u_01 d13_u_02 d13_u_03 d13_u_04 d13_u_05 d13_u_06 d13_u_07 d13_u_08 d13_u_09 d13_u_10 
drop l11 l11_id l_1_code_01 l_1_code_02 l_1_code_03 l_1_code_04 l_1_code_05 l_1_code_06 l_1_code_07 l_1_code_08 l_1_code_09 l_1_code_10 l_1_code_11 l_1_code_12 l_1_code_13 l_1_code_14 l_1_code_15 l_1_code_16 l_1_code_17 l_1_code_18 l12_01 l12_02 l12_03 l12_04 l12_05 l12_06 l12_07 l12_08 l12_09 l12_10 l12_11 l12_12 l12_13 l12_14 l12_15 l12_16 l12_17 l12_18 
rename hhid ID
rename d6_code_1 Green_Manure
rename d6_code_2 Mulching
rename d6_code_3 Seedbed
rename d6_code_4 Wet_Dry
rename d6_code_5 Line_Planting
rename d6_code_6 Double_Transplant
rename d6_code_7 Dapog
rename g21 Inc_NonFarm
rename g_crops Inc_Crops
rename g_livestock Inc_livestock
rename g22 Inc_Agri
rename g23 Inc_Tree
rename Inc_livestock Inc_Livestock
rename g24 Inc_Rent
rename g25 Inc_LandSales
rename g26 Inc_Remitt
rename g27 Inc_IntDiv
rename g28 Inc_Pension
rename g29_men Inc_Men
rename g29_women Inc_Women
rename g29_child Inc_Child
rename g210_men Inc_MenSalary
rename g210_women Inc_WomenSalary
rename g210_child Inc_ChildSalary
rename g211 Inc_Gifts
rename g212 Inc_Other
rename d61_1 UseGreenManure
rename d61_2 UseMulching
rename d61_3 UseSeedbed
rename d61_4 UseWetDry
rename d61_5 UseLinePlanting
rename d61_6 UseDoubleTransplant
rename d61_7 UseDapong
label define G21 0 "0" 77 "0" 88 "0" 99 "0", replace
label define G210_CHILD 0 "0" 77 "0" 88 "0" 99 "0", replace
label define G210_CHILD 77 "refused", modify
label define G210_CHILD 88 "don't know", modify
label define G210_CHILD 99 "missing", modify
label define G21 77 "refused", modify
label define G21 88 "don't know", modify
label define G21 99 "missing", modify
label define G210_MEN 0 "0", modify
label define G210_WOMEN 0 "0" 77 "refused" 88 "don't know" 99 "missing", replace
label define G211 0 "0", modify
label define G212 0 "0" 77 "refused" 88 "don't know" 99 "missing", replace
label define G22 0 "0", modify
label define G23 0 "0", modify
label define G24 0 "0", modify
label define G25 0 "0", modify
label define G26 0 "0", modify
tostring Inc_IntDiv, generate(Inc2)
label define G27 0 "0", modify
label define G28 0 "0" 77 "refused" 88 "don't know" 99 "missing", replace
label define G29_CHILD 0 "0" 77 "refused" 88 "don't know" 99 "missing", replace
label define G29_MEN 0 "0" 77 "refused" 88 "don't know" 99 "missing", replace
label define G2_WOMEN 0 "0" 77 "refused" 88 "don't know" 99 "missing", replace
tab Inc_NonFarm
tab Inc_Crops
tab Inc_Livestock
codebook Inc_NonFarm
tab Inc_Other
tab Inc_Gifts
label define G211 99 "0", modify
label define G210_WOMEN 0 "0" 77 "refused" 88 "don't know" 99 "0", replace
label define G210_MEN 0 "0" 77 "refused" 88 "don't know" 99 "0", replace
label define G210_CHILD 0 "0" 77 "refused" 88 "don't know" 99 "0", replace
label define G21 0 "0" 77 "refused" 88 "don't know" 99 "0", replace
label define G212 99 "0", modify
label define G22 0 "0" 77 "refused" 88 "don't know" 99 "0", replace
label define G23 99 "0", modify
label define G24 99 "0", modify
label define G25 99 "0", modify
label define G26 0 "0" 77 "refused" 88 "don't know" 99 "0", replace
label define G27 0 "0" 77 "refused" 88 "don't know" 99 "0", replace
label define G28 99 "0", modify
label define G29_CHILD 0 "0" 77 "refused" 88 "don't know" 99 "0", replace
label define G29_MEN 99 "0", modify
label define G2_WOMEN 0 "0" 77 "refused" 88 "don't know" 99 "0", replace
generate Inc_Total = Inc_NonFarm + Inc_Crops + Inc_Livestock + Inc_Agri + Inc_Tree + Inc_Rent + Inc_LandSales + Inc_Remitt + Inc_IntDiv + Inc_Pension + Inc_Men + Inc_Women + Inc_Child + Inc_MenSalary + Inc_WomenSalary + Inc_ChildSalary + Inc_Gifts + Inc_Other, after(Inc_Other)
// drop Inc_other specify because it does not contain nummeric number that used for calculation. Moreover, the there are only few response on this variable//
sum Inc_NonFarm Inc_Crops Inc_Livestock Inc_Agri Inc_Tree Inc_Rent Inc_LandSales Inc_Remitt Inc_IntDiv Inc_Pension Inc_Men Inc_Women Inc_Child Inc_MenSalary Inc_WomenSalary Inc_ChildSalary Inc_Gifts Inc_Other Inc_Total
replace Inc_Agri = 0 if Inc_Agri ==-99
replace Inc_Men = 0 if Inc_Men ==-99
replace Inc_Gift = 0 if Inc_Gift ==-99
replace Inc_Gift = 0 if Inc_Gift ==-99
replace Inc_Agri = 0 if Inc_Agri==-88
replace Inc_Agri = 0 if Inc_Agri==-88
sum Inc_NonFarm Inc_Crops Inc_Livestock Inc_Agri Inc_Tree Inc_Rent Inc_LandSales Inc_Remitt Inc_IntDiv Inc_Pension Inc_Men Inc_Women Inc_Child Inc_MenSalary Inc_WomenSalary Inc_ChildSalary Inc_Gifts Inc_Total
//end task1//
//begin task2//
save "C:\1 reference\test3\clean dataset.dta"
tab Green_Manure
tab Mulching
replace Green_Manure = . if Green_Manure!=1
replace Green_Manure = . if Green_Manure=="mulching"
tab Green_Manure
tab Mulching
tab Seedbed
tab Wet_Dry
tab Line_Planting
tab Double_Transplant
graph bar (percent) Green_Manure (percent) Mulching (percent) Seedbed (percent) Wet_Dry (percent) Line_Planting (percent) Double_Transplant (mean) Dapog
graph bar (count)
graph bar (percent) Green_Manure (percent) Mulching (percent) Seedbed (percent) Wet_Dry (percent) Line_Planting (percent) Double_Transplant (percent) Dapog, cw
graph bar (percent) Green_Manure (percent) Mulching (percent) Seedbed (percent) Wet_Dry (percent) Line_Planting (percent) Double_Transplant (percent) Dapog, title(Percent of Various Technologies Used in Agricultural)
graph bar (percent) Green_Manure (percent) Mulching (percent) Seedbed (percent) Wet_Dry (percent) Line_Planting (percent) Double_Transplant (percent) Dapog, missing title(Percent of Various Technologies Used in Agricultural)
graph bar (percent) Green_Manure (percent) Mulching (percent) Seedbed (percent) Wet_Dry (percent) Line_Planting (percent) Double_Transplant (percent) Dapog, cw title(Percent of Various Technologies Used in Agricultural)
graph bar (percent) Green_Manure (percent) Mulching (percent) Seedbed (percent) Wet_Dry (percent) Line_Planting (percent) Double_Transplant (percent) Dapog, showyvars title(Percent of Various Technologies Used in Agricultural)
graph bar, title(Percent of Various Technologies Used in Agricultural)
graph bar (percent) Green_Manure (percent) Mulching (percent) Seedbed (percent) Wet_Dry (percent) Line_Planting (percent) Double_Transplant (percent) Dapog, title(Percent of Various Technologies Used in Agricultural)
graph save "Graph" "C:\1 reference\test3\Graph %of Tech Used.gph"
graph bar (count) UseGreenManure (count) UseMulching (count) UseSeedbed (count) UseWetDry (count) UseLinePlanting (count) UseDoubleTransplant (count) UseDapong, title(Frequency of Technologies Used in Agricultural)
graph save "Graph" "C:\1 reference\test3\Graph Frequency of Tech Used.gph"
replace UseGreenManure = . if UseGreenManure ==0
replace UseMulching = . if UseMulching ==0
replace UseSeedbed = . if UseSeedbed ==0
replace UseSeedbed = . if UseSeedbed ==0
replace UseWetDry = . if UseWetDry ==0
replace UseLinePlanting = . if UseLinePlanting ==0
replace UseDoubleTransplant = . if UseDoubleTransplant ==0
replace UseDapong = . if UseDapong==0
graph bar (count) UseGreenManure (count) UseMulching (count) UseSeedbed (count) UseWetDry (count) UseLinePlanting (count) UseDoubleTransplant (count) UseDapong, title(Frequency of Technologies Used in Agricultural)
graph save "Graph" "C:\1 reference\test3\Graph Frequency of Tech Used.gph", replace
//end of task 2//
save "C:\1 reference\test3\clean dataset.dta", replace
***** I have to reopen the dataset, because I had drop the varibles for landholding out of the dataset*****
use "C:\1 reference\test2\baseline_data_stata12.dta", clear
rename d13_q_01 Plot1
rename d13_q_02 Plot2
rename d13_q_03 Plot3
rename d13_q_04 Plot4
rename d13_q_05 Plot5
rename d13_q_06 Plot6
rename d13_q_07 Plot7
rename d13_q_08 Plot8
rename d13_q_09 Plot9
rename d13_q_10 Plot10
replace Plot1 = 0 if Plot1==.
replace Plot2 = 0 if Plot2==.
replace Plot3 = 0 if Plot3==.
replace Plot4 = 0 if Plot4==.
replace Plot5 = 0 if Plot5==.
replace Plot6 = 0 if Plot6==.
replace Plot7 = 0 if Plot7==.
replace Plot8 = 0 if Plot8==.
replace Plot9 = 0 if Plot9==.
replace Plot10 = 0 if Plot10==.
replace Plot10 = 0 if Plot10==.
generate Plot_Total2 = Plot1 + Plot2 + Plot3 + Plot4 + Plot5 + Plot6 + Plot7 + Plot8 + Plot9 + Plot10
sum Plot1 Plot2 Plot3 Plot4 Plot5 Plot6 Plot7 Plot8 Plot9 Plot10 Plot_Total2
drop d_code v_code a13 group b11 b12 d11 
drop d13_u_01 d13_u_02 d13_u_03 d13_u_04 d13_u_05 d13_u_06 d13_u_07 d13_u_08 d13_u_09 d13_u_10 d6_code_1 d6_code_2 d6_code_3 d6_code_4 d6_code_5 d6_code_6 d6_code_7 d61_1 d61_2 d61_3 d61_4 d61_5 d61_6 d61_7 g21 g_crops g_livestock g22 g23 g24 g25 g26 g27 g28 g29_men g29_women g29_child g210_men g210_women g210_child g211 g212 g212_spec l11 l11_id l_1_code_01 l_1_code_02 l_1_code_03 l_1_code_04 l_1_code_05 l_1_code_06 l_1_code_07 l_1_code_08 l_1_code_09 l_1_code_10 l_1_code_11 l_1_code_12 l_1_code_13 l_1_code_14 l_1_code_15 l_1_code_16 l_1_code_17 l_1_code_18 l12_01 l12_02 l12_03 l12_04 l12_05 l12_06 l12_07 l12_08 l12_09 l12_10 l12_11 l12_12 l12_13 l12_14 l12_15 l12_16 l12_17 l12_18 Plot_Total Plot_Total1 
save "C:\1 reference\test3\clean dataset for landholding.dta"
