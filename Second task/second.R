
#1.Find missing values in embarked column and replace it with "S"

titanic3$embarked[which(is.na(titanic3$embarked))] <- "S"

#2.Replace NA with calculated values in age column

titanic3$age[which(is.na(titanic3$age))] <- mean(titanic3$age, na.rm = TRUE)

#3. Replace NA with "None" in boat column
titanic3$boat[which(is.na(titanic3$boat))] <- "None"
titanic3$boat

#4. Add column "has_cabin_number" with 1 / 0 value to indicate who has number in "cabin" column
has_cabin_number <- c(!(is.na(titanic3$cabin)))
titanic3$has_cabin_number <- as.numeric(has_cabin_number)

write.table(titanic3, file = "titanic_cleaned.csv")





