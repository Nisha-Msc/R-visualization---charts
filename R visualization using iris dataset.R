# Load necessary libraries
library(ggplot2)
library(corrgram)
library(treemap)

# Load the Iris dataset
data("iris")

# Q-Q Plot for Sepal Length
qqnorm(iris$Sepal.Length, main = "Q-Q Plot of Sepal Length")
qqline(iris$Sepal.Length, col = "blue", lwd = 2)

# Boxplot for Sepal Length by Species
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_boxplot() +
  labs(title = "Boxplot of Sepal Length by Species", x = "Species", y = "Sepal Length") +
  theme_minimal()

# Dot plot for Sepal Length
ggplot(iris, aes(x = Sepal.Length)) +
  geom_dotplot(binwidth = 0.1, fill = "blue") +
  labs(title = "Dot Plot of Sepal Length", x = "Sepal Length", y = "Count") +
  theme_minimal()

# Bubble plot for Sepal Width vs Sepal Length with Petal Length as bubble size
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, size = Petal.Length, color = Species)) +
  geom_point(alpha = 0.7) +
  labs(title = "Bubble Plot of Sepal Dimensions", x = "Sepal Length", y = "Sepal Width") +
  theme_minimal()

# Heatmap for correlation matrix
cor_matrix <- cor(iris[, 1:4])
image(cor_matrix, main = "Correlation Heatmap", col = heat.colors(10))

# Mosaic plot for Species
mosaicplot(table(iris$Species), main = "Mosaic Plot of Species", color = c("red", "green", "blue"))

# Corrgram for numeric variables
corrgram(iris[, 1:4], order = TRUE, lower.panel = panel.shade, upper.panel = panel.pie, text.panel = panel.txt)

# Tree Map for Species Count
species_count <- as.data.frame(table(iris$Species))
treemap(species_count,
        index = "Var1",
        vSize = "Freq",
        title = "Treemap of Species Count")



