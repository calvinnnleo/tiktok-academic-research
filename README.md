# 📊 Analisis Pengaruh Penggunaan TikTok terhadap IPK Mahasiswa 🎓

[](https://www.r-project.org/)
[](https://www.rstudio.com/)
[](https://www.google.com/search?q=LICENSE)

Studi statistik ini menguji hubungan antara **frekuensi penggunaan aplikasi TikTok** dan **prestasi akademik (IPK) mahasiswa** menggunakan Analisis Regresi Linear.

## 🎯 Tujuan Penelitian

### Mengukur dan Menguji Hubungan

  * Mengukur kekuatan dan arah hubungan antara durasi penggunaan TikTok dengan IPK.
  * Menguji signifikansi statistik dari hubungan tersebut.

### Validasi dan Rekomendasi

  * Memvalidasi model regresi berdasarkan asumsi klasik.
  * Memberikan rekomendasi berbasis bukti untuk pengambilan keputusan akademik.

-----

## 🛠️ Teknologi & Tools

Proyek ini dikembangkan menggunakan **R (4.0+)** di lingkungan **RStudio**. Berikut adalah *libraries* yang digunakan:

### Libraries Utama

  * **`tidyverse`**: Manipulasi data dan visualisasi.
  * **`nortest` & `moments`**: Uji normalitas (Anderson-Darling, Skewness & Kurtosis).
  * **`lmtest`**: Uji asumsi regresi (Breusch-Pagan, Durbin-Watson).
  * **`car`**: Uji multikolinearitas (VIF).

### 📦 Instalasi

```r
# Install semua dependencies
install.packages(c("tidyverse", "nortest", "moments", "lmtest", "car"))

# Contoh pemuatan data
# data <- read.csv("data_survei_tiktok.csv", header = TRUE)
```

-----

## 📊 Metodologi

### 1\. Transformasi Data

Variabel kategorikal diubah menjadi nilai numerik representatif (titik tengah):

  * **IPK**: Titik tengah kategori (misalnya, 3.1–3.5 $\rightarrow 3.3$).
  * **Frekuensi TikTok**: Jam per hari (misalnya, \<1 jam $\rightarrow 0.5$; 1–2 jam $\rightarrow 1.5$).

### 2\. Analisis Statistik

  * **Statistik Deskriptif**: Mean, SD, Skewness, Kurtosis.
  * **Uji Normalitas**: Shapiro-Wilk dan Anderson-Darling.

### 3\. Model Regresi Linear

Model digunakan: $IPK = \beta₀ + \beta₁ \times Frekuensi\_TikTok + \varepsilon$.

#### Validasi Asumsi Klasik

  * **Normalitas residual** (QQ-plot & Shapiro-Wilk).
  * **Homoskedastisitas** (Breusch-Pagan test).
  * **Tidak ada autokorelasi** (Durbin-Watson test).
  * **Tidak ada multikolinearitas** ($VIF < 10$).

### 4\. Uji Robustness

Menggunakan **Spearman Correlation** dan **Chi-square test** untuk memvalidasi temuan dengan metode non-parametrik.

-----

## 📈 Hasil Utama

### Model Regresi

Analisis menemukan hubungan yang **sangat signifikan** ($p < 0.001$):
$$IPK = 3.45 - 0.14 \times Frekuensi\_TikTok$$

#### Interpretasi

Setiap peningkatan **1 jam per hari** dalam penggunaan TikTok berkorelasi dengan penurunan rata-rata **IPK sebesar 0.14 poin**.

### Metrik Kinerja Model

  * **Nilai $R^2$**: **0.287**
      * **Interpretasi**: Model menjelaskan **28.7%** dari variasi IPK.
  * **$p$-value Model**: **$< 0.001$**
      * **Interpretasi**: Hubungan ini signifikan secara statistik.
  * **Korelasi Spearman ($\rho$)**: **$-0.42$** (Korelasi negatif sedang).
  * **Chi-square test**: **$p = 0.016$** (Hubungan kategorikal signifikan).

### Validasi Asumsi Klasik ✅

Semua asumsi model regresi linear terpenuhi, menjamin validitas model:

  * **Normalitas Residual**: Shapiro $p = 0.123$ ($\checkmark$).
  * **Homoskedastisitas**: Breusch-Pagan $p = 0.21$ ($\checkmark$).
  * **Autokorelasi**: Durbin-Watson $DW = 1.93$ ($\checkmark$).
  * **Multikolinearitas**: VIF $= 1.00$ ($\checkmark$).

-----

## 🎓 Kesimpulan & Implikasi

### Temuan Kunci

Terdapat **hubungan negatif signifikan** antara durasi penggunaan TikTok dan kinerja akademik mahasiswa. Dampak ini terkait dengan *digital distraction*, berkurangnya waktu belajar, dan *sleep deprivation*.

### Keterbatasan

  * **$R^2$ Rendah**: Mayoritas (71.3%) variasi IPK dijelaskan oleh faktor lain (misalnya, motivasi, kesehatan mental).
  * **Studi *Cross-sectional***: Hanya membuktikan **korelasi**, bukan kausalitas definitif.

### Rekomendasi

  * **Untuk Mahasiswa**: Batasi penggunaan TikTok **$< 2$ jam/hari**.
  * **Untuk Institusi**: Implementasikan program **konseling akademik** dan ***workshop* digital wellness** berbasis data.
  * **Studi Lanjutan**: Disarankan desain **longitudinal** untuk menguji kausalitas dan memasukkan variabel kontrol seperti jam tidur dan gaya belajar.
