Analisis Pengaruh Penggunaan TikTok terhadap IPK Mahasiswa
Proyek analisis statistik untuk meneliti hubungan antara frekuensi penggunaan TikTok dengan IPK mahasiswa menggunakan R.
📊 Deskripsi
Penelitian ini menganalisis data survei mahasiswa untuk mengetahui apakah terdapat korelasi antara durasi penggunaan TikTok dengan prestasi akademik (IPK). Analisis menggunakan berbagai metode statistik termasuk regresi linear, uji normalitas, dan uji korelasi.
🛠️ Teknologi

R (4.0+)
RStudio (recommended)

Libraries:

tidyverse - Data manipulation & visualisasi
nortest - Uji normalitas
moments - Skewness & kurtosis
lmtest - Uji Durbin-Watson
car - Uji multikolinearitas (VIF)
tseries - Time series analysis

📦 Instalasi
r# Install packages
install.packages(c("tidyverse", "nortest", "moments", 
                   "lmtest", "car", "tseries"))

# Load libraries
library(tidyverse)
library(nortest)
library(moments)
library(lmtest)
library(car)
📁 Data
File: data_survei_tiktok.csv
Variabel:

IPK - Kategori IPK (2,0-2,5 / 2,6-3,0 / 3,1-3,5 / >3,5)
Frekuensi.Penggunaan.TikTok - Durasi harian (<1 jam / 1-2 jam / 3-4 jam / >4 jam)
Lama.Buka.TikTok - Lama membuka TikTok
Pengguna.Tiktok - Status pengguna

🚀 Cara Menggunakan
r# 1. Set working directory
setwd("path/to/your/folder")

# 2. Load data
data <- read.csv("data_survei_tiktok.csv", header = TRUE)

# 3. Jalankan script
source("Rstudio_Kelompok8.R")
📈 Analisis yang Dilakukan
1. Transformasi Data

Konversi IPK kategori → numerik (2.25 - 3.75)
Konversi frekuensi → jam per hari (0.5 - 5.0)

2. Statistik Deskriptif

Mean, SD, Skewness, Kurtosis untuk IPK dan frekuensi

3. Uji Normalitas

Shapiro-Wilk test
Anderson-Darling test

4. Uji Hipotesis

One-sample t-test (H₀: μ = 3.0)
Mann-Whitney test
Wilcoxon test

5. Analisis Regresi

Model: IPK ~ Frekuensi TikTok
Koefisien determinasi (R²)
Uji asumsi klasik:

Normalitas residual
Heteroskedastisitas (Breusch-Pagan)
Autokorelasi (Durbin-Watson)
Multikolinearitas (VIF)



6. Uji Korelasi

Spearman correlation
Chi-square test

📊 Output Visualisasi

Residuals vs Fitted Values plot
Q-Q plot untuk normalitas
Scatter plot IPK vs Frekuensi TikTok

📝 Hasil Analisis
Statistik Deskriptif

IPK: Mean = 3.12 (SD = 0.45)
Frekuensi TikTok: Mean = 2.34 jam/hari (SD = 1.52)

Model Regresi
IPK = 3.45 - 0.14 × Frekuensi_TikTok

R² = 0.287 (Model signifikan, p < 0.001)
Koefisien = -0.14: Setiap +1 jam TikTok → IPK turun 0.14 poin
Semua asumsi regresi terpenuhi ✅

Uji Korelasi

Spearman ρ = -0.42 (p < 0.001) → Korelasi negatif sedang
Chi-square (p = 0.016) → Ada hubungan signifikan

🎯 Kesimpulan
Ada hubungan negatif signifikan antara penggunaan TikTok dengan IPK mahasiswa. Mahasiswa yang menggunakan TikTok >2.5 jam/hari cenderung memiliki IPK lebih rendah. Model menjelaskan 28.7% variasi IPK, sisanya dipengaruhi faktor lain.
🔍 Interpretasi
P-value < 0.05: Ada hubungan signifikan antara penggunaan TikTok dan IPK
R² > 0.5: Model memiliki kemampuan prediksi yang baik
VIF < 10: Tidak ada masalah multikolinearitas
