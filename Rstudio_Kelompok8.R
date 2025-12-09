# Memuat library yang dibutuhkan
library(tidyverse)   # untuk data manipulation dan visualisasi
library(nortest)     # untuk uji normalitas
library(moments)     # untuk skewness dan kurtosis
library(dplyr)       # untuk manipulasi data
library(ggplot2)     # untuk visualisasi

# Membaca data dari file CSV
data <- read.csv("C:/Users/Calvin Leo/Downloads/data_survei_tiktok.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)

# Fungsi untuk mengonversi IPK menjadi numerik
ipk_mapping <- function(ipk) {
  case_when(
    ipk == "Lebih dari 3,5" ~ 3.75,
    ipk == "3,1 - 3,5" ~ 3.3,
    ipk == "2,6 - 3,0" ~ 2.8,
    ipk == "2,0 - 2,5" ~ 2.25,
    TRUE ~ NA_real_  # NA untuk nilai yang tidak cocok
  )
}

# Fungsi untuk mengonversi frekuensi penggunaan TikTok menjadi numerik
freq_mapping <- function(freq) {
  case_when(
    freq == "Kurang dari 1 jam" ~ 0.5,
    freq == "1 - 2 jam" ~ 1.5,
    freq == "3 - 4 jam" ~ 3.5,
    freq == "Lebih dari 4 jam" ~ 5.0,
    TRUE ~ NA_real_  # NA untuk nilai yang tidak cocok
  )
}

# Transformasi data
transformed_data <- data %>%
  mutate(
    ipk_numeric = ipk_mapping(IPK),  # Ganti dengan nama kolom yang benar
    freq_numeric = freq_mapping(Frekuensi.Penggunaan.TikTok)  # Ganti dengan nama kolom yang benar
  )
# Cek hasil transformasi data
head(transformed_data)

# Statistik deskriptif untuk IPK
ipk_stats <- data.frame(
  mean = mean(transformed_data$ipk_numeric, na.rm = TRUE),
  sd = sd(transformed_data$ipk_numeric, na.rm = TRUE),
  skewness = moments::skewness(transformed_data$ipk_numeric, na.rm = TRUE),
  kurtosis = moments::kurtosis(transformed_data$ipk_numeric, na.rm = TRUE)
)

print("Statistik IPK:")
print(ipk_stats)

# Statistik deskriptif untuk frekuensi penggunaan TikTok
freq_stats <- data.frame(
  mean = mean(transformed_data$freq_numeric, na.rm = TRUE),
  sd = sd(transformed_data$freq_numeric, na.rm = TRUE),
  skewness = moments::skewness(transformed_data$freq_numeric, na.rm = TRUE),
  kurtosis = moments::kurtosis(transformed_data$freq_numeric, na.rm = TRUE)
)

print("Statistik Frekuensi Penggunaan TikTok:")
print(freq_stats)


# Uji normalitas
# Shapiro-Wilk test
shapiro_ipk <- shapiro.test(transformed_data$ipk_numeric)
shapiro_freq <- shapiro.test(transformed_data$freq_numeric)

# Anderson-Darling test
ad_ipk <- ad.test(transformed_data$ipk_numeric)
ad_freq <- ad.test(transformed_data$freq_numeric)



# Uji Shapiro-Wilk untuk normalitas IPK
shapiro_ipk <- shapiro.test(transformed_data$ipk_numeric)

# Uji Shapiro-Wilk untuk normalitas frekuensi penggunaan TikTok
shapiro_freq <- shapiro.test(transformed_data$freq_numeric)


# Uji Anderson-Darling untuk IPK
ad_ipk <- ad.test(transformed_data$ipk_numeric)

# Uji Anderson-Darling untuk frekuensi penggunaan TikTok
ad_freq <- ad.test(transformed_data$freq_numeric)

# Tampilkan hasil uji normalitas
print("Shapiro-Wilk Test for IPK:")
print(shapiro_ipk)

print("Shapiro-Wilk Test for Frequency:")
print(shapiro_freq)


print("Anderson-Darling Test for IPK:")
print(ad_ipk)

print("Anderson-Darling Test for Frequency:")
print(ad_freq)

# Ambil sampel IPK yang sudah dikonversi
ipk_sample <- transformed_data$ipk_numeric[!is.na(transformed_data$ipk_numeric)]

# Uji t-sampel satu populasi
mu <- 3.0  # nilai hipotesis
t_test_result <- t.test(ipk_sample, mu = mu)

# Tampilkan hasil uji t
print("T-Test Result for IPK:")
print(t_test_result)

# Memuat pustaka yang diperlukan
library(lmtest)  # Untuk uji Durbin-Watson
library(car)     # Untuk uji Breusch-Pagan
library(ggplot2) # Untuk visualisasi
library(tseries) # Untuk uji normalitas pada residu

# 1. Membuat Model Regresi
model_regresi <- lm(ipk_numeric ~ freq_numeric, data = transformed_data)

# 2. Uji Residu (Plot dan Uji Normalitas)
# Ambil residual dari model regresi
residuals <- residuals(model_regresi)

# Plot Residuals vs Fitted Values
plot(model_regresi$fitted.values, residuals, 
     main = "Plot Residuals vs Fitted Values",
     xlab = "Fitted Values", ylab = "Residuals")
abline(h = 0, col = "red")

# Q-Q plot untuk uji normalitas residuals
qqnorm(residuals, main = "Q-Q Plot of Residuals")
qqline(residuals, col = "red")

# Uji normalitas residuals dengan Shapiro-Wilk test
shapiro_residuals <- shapiro.test(residuals)
print(shapiro_residuals)

# 3. Uji Heteroskedastisitas (Breusch-Pagan Test)
bp_test <- bptest(model_regresi)
print(bp_test)

# 4. Uji Durbin-Watson (Autokorelasi Residuals)
dw_test <- durbinWatsonTest(model_regresi)
print(dw_test)

#uji multikoinearitas
str(transformed_data_clean)
levels(transformed_data_clean$Pengguna.Tiktok)  # Cek apakah ada lebih dari satu level
levels(transformed_data_clean$Lama.Buka.TikTok)  # Cek level variabel lainnya
transformed_data_clean$Pengguna.Tiktok <- droplevels(transformed_data_clean$Pengguna.Tiktok)
levels(transformed_data_clean$Pengguna.Tiktok)

model_regresi <- lm(ipk_numeric ~ freq_numeric + Lama.Buka.TikTok, data = transformed_data_clean)
summary(model_regresi)

library(car)

# Menghitung VIF untuk model regresi
vif_values <- vif(model_regresi)

# Tampilkan hasil VIF untuk memeriksa multikolinearitas
print("Variance Inflation Factor (VIF):")
print(vif_values)









# Reset plot layout
par(mfrow = c(1, 1))  # Kembali ke layout plot satu

# Transformasi data - pastikan library dplyr sudah dimuat
library(dplyr)

transformed_data <- transformed_data %>%
  mutate(
    kategori_ipk = case_when(
      ipk_numeric <= 2.5 ~ "Rendah",
      ipk_numeric <= 3.0 ~ "Sedang",
      ipk_numeric <= 3.5 ~ "Tinggi",
      TRUE ~ "Sangat Tinggi"
    ),
    kategori_freq = case_when(
      freq_numeric <= 1 ~ "Rendah",
      freq_numeric <= 2.5 ~ "Sedang",
      freq_numeric <= 4 ~ "Tinggi",
      TRUE ~ "Sangat Tinggi"
    ),
    freq_binary = ifelse(freq_numeric > median(freq_numeric, na.rm = TRUE), 
                        "Tinggi", 
                        "Rendah")
  )

# 1. One-Sample t-Test
t_test_ipk <- t.test(transformed_data$ipk_numeric, mu = 3.0)
print("Hasil Uji One-Sample t-Test untuk IPK:")
print(t_test_ipk)

# 2. Regresi Linear
model_regresi <- lm(ipk_numeric ~ freq_numeric, data = transformed_data)
print("Ringkasan Model Regresi:")
print(summary(model_regresi))

# 3. Koefisien Determinasi
r_squared <- summary(model_regresi)$r.squared
print("Koefisien Determinasi (R²):")
print(r_squared)

# 4. Korelasi Spearman
spearman_corr <- cor.test(transformed_data$ipk_numeric, 
                          transformed_data$freq_numeric, 
                          method = "spearman",
                          exact = FALSE)  # menghindari warning
print("Hasil Korelasi Spearman:")
print(spearman_corr)

# 5. Chi-square test
# Pastikan tidak ada NA dalam kategori
clean_data <- na.omit(transformed_data[, c("kategori_ipk", "kategori_freq")])
chi_square_test <- chisq.test(table(clean_data$kategori_ipk, 
                                    clean_data$kategori_freq),
                              simulate.p.value = TRUE)
print("Hasil Chi-square test:")
print(chi_square_test)

# 6. Mann-Whitney test
mann_whitney_test <- wilcox.test(ipk_numeric ~ freq_binary, 
                                 data = na.omit(transformed_data),
                                 exact = FALSE)
print("Hasil Mann-Whitney test:")
print(mann_whitney_test)

# 7. Wilcoxon one-sample test
wilcox_test <- wilcox.test(transformed_data$ipk_numeric,
                           mu = 3.0,
                           exact = FALSE)
print("Hasil Wilcoxon test (dibandingkan dengan IPK 3.0):")
print(wilcox_test)

