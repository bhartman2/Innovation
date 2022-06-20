EUcountries=c(
"AT - Austria",
"BE - Belgium",
"BG - Bulgaria",
"CY - Cyprus",
"CZ - Czechia",
"DE - Germany",
"DK - Denmark",
"EE - Estonia",
"ES - Spain",
"FI - Finland",
"FR - France",
"GR - Greece",
"HR - Croatia",
"HU - Hungary",
"IE - Ireland",
"IT - Italy",
"LT - Lithuania",
"LU - Luxembourg",
"LV - Latvia",
"MT - Malta",
"NL - Netherlands",
"PO - Poland",
"PT - Portugal",
"RO - Romania",
"SE - Sweden",
"SI - Slovenia",
"SK - Slovakia")

EU_countries=str_split_fixed(EUcountries," - ",2)

EU_countries_df = data.frame(alpha2=EU_countries[,1], cname=EU_countries[,2])

EU_countries_df


