# Topic 2: Tabular and Graphical Representations

# a.
data <- read.csv("./Data/Disease_symptom_and_patient_profile_dataset.csv")
print(str(data))
print(head(data))

print("Length of the Dataset:")
print(nrow(data))

numeric_attr <- sum(sapply(data, is.numeric))
print("Number of numeric attributes:")
print(numeric_attr)

print("The value of the attribute 'Disease' of the 3rd record:")
print(data[3, "Disease"])

# b.
table <- table(data$Fever, data$Cough)
table <- addmargins(table)
print("Contigency table of absolute frequencies for Fever and Cough:")
print(table)

# c.
fatigue_table <- table(data$Fatigue)
print(fatigue_table)
jpeg("./plots/barplot.jpeg", width = 1000, height = 800, units = "px")
barplot(
    fatigue_table,
    main = "Frequency of Fatigue symptoms among patients",
    xlab = "Existence vs Absence",
    ylab = "Fatigue",
    col = rainbow(length(fatigue_table)),
    cex.main = 2,
    cex.axis = 2,
    cex.lab = 2
)
dev.off()

# d.
cholesterol_table <- table(data$Cholesterol.Level)
jpeg("./plots/piechart.jpeg", width = 800, height = 800, units = "px")
pie(
    cholesterol_table,
    main = "Distribution of cholesterol levels among patients",
    col = rainbow(length(cholesterol_table)),
    cex.main = 2,
    cex.axis = 2,
    cex.lab = 2
)
dev.off()

# e.
jpeg("./plots/boxplot.jpeg", width = 3000, height = 1080, units = "px")
boxplot(
    data$Age ~ data$Disease,
    data = data,
    main = "Distribution of age of patents with different diseases",
    xlab = "Disease",
    ylab = "Age",
    cex.main = 2,
    cex.lab = 2
)
dev.off()

# Topic 3: Correlation

# a.
StudentData <- read.csv("./Data/StudentPerformanceFactors.csv")
print(str(StudentData))

print("Length of the Dataset:")
print(nrow(StudentData))

print("Number of different attributes:")
print(length(attributes(StudentData)$names))

print("Names of numeric attributes:")
print(names(StudentData)[sapply(StudentData, is.numeric)])

# b.
StudentDataNumeric <- StudentData[sapply(StudentData, is.numeric)]
print("Numeric Attributes of the Dataset:")
print(head(StudentDataNumeric))

# c.
correlation_matrix <- cor(StudentDataNumeric, method = "pearson")
print("The correlation matrix:")
print(correlation_matrix)

jpeg("./plots/heatmap.jpeg", width = 800, height = 1000, units = "px")
heatmap(
    main = "Heatmap of the correlation matrix",
    correlation_matrix,
    Rowv = NA,
    Colv = NA
)
dev.off()

# d.
print(correlation_matrix["Attendance", "Hours_Studied"])
print(correlation_matrix["Attendance", "Exam_Score"])
print(correlation_matrix["Tutoring_Sessions", "Previous_Scores"])
print(correlation_matrix["Physical_Activity", "Sleep_Hours"])

# e.
print("Correlation value:")
print(correlation_matrix["Exam_Score", "Hours_Studied"])

# Topic 4: Data Frames

# a.
pokedex <- read.csv("./Data/pokedex.csv")
print(str(pokedex))

pokedex <- subset(pokedex, select = -Image)
pokedex$names <- pokedex$Name
pokedex <- subset(pokedex, select = -Name)

print("Final dataframe:")
print(str(pokedex))

View(pokedex[pokedex$names == "Omastar", ])

# b.
print("Number of pokemon that don't have second type:")
print(nrow(pokedex[is.na(pokedex$Type.2)]))

print("Number of pokemon whose speed is less than 60:")
print(nrow(pokedex[pokedex$Speed < 60, ]))

# c.
watertype_pokemon <- pokedex[(pokedex$Type.1 == "Water") | (pokedex$Type.2 == "Water"), ]
print("Average of attack of water type pokemon:")
print(mean(watertype_pokemon$Attack))

fairytype_pokemon <- pokedex[(pokedex$Type.1 == "Fairy") | (pokedex$Type.2 == "Fairy"), ]
print("Pokemon with the greatest HP value:")
print(fairytype_pokemon[which.max(fairytype_pokemon$HP), "names"])

# d.
min_max_norm <- function(x) {
    (x - min(x)) / (max(x) - min(x))
}

pokedex$NormHP <- min_max_norm(pokedex$HP)
pokedex$NormAttack <- min_max_norm(pokedex$Attack)
pokedex$NormDefense <- min_max_norm(pokedex$Defense)

print(head(pokedex))

pokedex_ordered_by_hormhp <- pokedex[order(pokedex$NormHP, decreasing = TRUE), ]
print("Top 3 highest NormHP Pokemon:")
print(pokedex_ordered_by_hormhp[1:3, "names"])

print("Median value of the NormAttack attribute:")
print(median(pokedex$NormAttack))

print("Average value of the NormDefense attribute:")
print(mean(pokedex$NormDefense))

# e.
pokedex$Performance <- (pokedex$NormHP * pokedex$NormAttack * pokedex$NormDefense) + 0.0002

pokedex$Grade <- with(
    pokedex, ifelse(
        Performance > 0 & Performance <= 0.15, "Weak",
        ifelse(
            Performance > 0.15 & Performance <= 0.2, "Normal", "Strong"
        )
    )
)
print(head(pokedex))

print("Number of Pokemon with strong grade:")
print(nrow(pokedex[pokedex$Grade == "Strong", ]))

print("Grade of Pokemon named 'Haunter':")
print(pokedex[pokedex$names == "Haunter", "Grade"])
