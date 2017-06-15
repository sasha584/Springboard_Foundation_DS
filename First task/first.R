table(refine_original)
head(refine_original)
#1. Standartise company names and bring into lower case
company_name <- refine_original[, 1]
names_to_change <- unlist(company_name)

phil_changed <- c(gsub(".*(^p|^f).*", "phillips", names_to_change, ignore.case = TRUE))
akzo_changed <- c(gsub(".*^a.*", "akzo", phil_changed, ignore.case = TRUE))
van_changed <- c(gsub(".*^v.*", "van houten", akzo_changed, ignore.case = TRUE))
company <- c(gsub(".*^u.*", "unilever", van_changed, ignore.case = TRUE))

#2.Separate product code into product_code and product_number
p_c <- refine_original[, 2]
items <- unlist(p_c)
items_to_separate <- c(items)
product_number <- gsub("^.*-", "", items_to_separate)
product_code <- gsub("-.*$","",items_to_separate)

#3. Decode product_code into category of product
smartphone <- c(grepl("p", product_code))
tv <- c(grepl("v", product_code))
tablet <- c(grepl("q", product_code))
laptop <- c(grepl("x", product_code))

#4. Compile full adress for geocoding
city <- refine_original[, 4]
cities <- unlist(city)
cities_to_merge <- c(cities)

country <- refine_original[, 5]
countries <- unlist(country)
country_to_merge <- c(countries)

full_address <- with(refine_original, paste(address, city, country, sep = ", "))

#5. Create dummy variables for company and product category
phillips <- c(grepl("phillips", company))
akzo <- c(grepl("akzo", company))
van_houten <- c(grepl("van houten", company))
unilever <- c(grepl("unilever", company))
company_frame <- lapply(data.frame(phillips, akzo, van_houten, unilever), as.numeric)

product_frame <- lapply(data.frame(smartphone, tv, tablet, laptop), as.numeric)

#Compile all changes into data frame and export
refine_cleaned <- data.frame(company, company_frame, product_number, product_code, product_frame, full_address, refine_original[, 6], row.names = NULL)
write.csv(refine_cleaned, "refine_cleaned.csv")


















