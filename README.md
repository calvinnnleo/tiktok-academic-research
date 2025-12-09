Analisis Pengaruh Penggunaan TikTok terhadap IPK Mahasiswa
Studi statistik untuk menguji hubungan antara frekuensi penggunaan TikTok dan prestasi akademik mahasiswa menggunakan analisis regresi linear dan metode statistik robust.
🎯 Tujuan Penelitian

Mengukur kekuatan dan arah hubungan antara durasi penggunaan TikTok dengan IPK
Menguji signifikansi statistik hubungan tersebut
Memvalidasi model regresi berdasarkan asumsi klasik
Memberikan rekomendasi berbasis bukti untuk pengambilan keputusan akademik

🛠️ Teknologi & Tools
Platform: R (4.0+) | RStudio
Libraries:
rtidyverse    # Data manipulation & visualisasi
nortest      # Uji normalitas (Anderson-Darling)
moments      # Skewness & kurtosis
lmtest       # Breusch-Pagan, Durbin-Watson
car          # VIF untuk multikolinearitas
📦 Instalasi
r# Install semua dependencies
install.packages(c("tidyverse", "nortest", "moments", "lmtest", "car"))

# Set working directory
setwd("path/to/project")

# Load data
data <- read.csv("data_survei_tiktok.csv", header = TRUE)
📊 Metodologi
1. Transformasi Data
Variabel kategorikal → numerik:

IPK: Titik tengah kategori (2,0–2,5 → 2,25 | 3,1–3,5 → 3,3)
Frekuensi TikTok: Jam per hari (<1 jam → 0,5 | 1–2 jam → 1,5)

2. Statistik Deskriptif
Mean, SD, skewness, kurtosis untuk eksplorasi awal distribusi data.
3. Uji Normalitas

Shapiro-Wilk test: Untuk sampel kecil-sedang
Anderson-Darling test: Lebih sensitif pada ekor distribusi

4. Model Regresi Linear
IPK = β₀ + β₁ × Frekuensi_TikTok + ε
Uji Asumsi Klasik:

✅ Normalitas residual (QQ-plot & Shapiro-Wilk)
✅ Homoskedastisitas (Breusch-Pagan test)
✅ Tidak ada autokorelasi (Durbin-Watson)
✅ Tidak ada multikolinearitas (VIF < 10)

5. Uji Robustness

Spearman correlation: Untuk hubungan monotonik
Chi-square test: Hubungan kategorikal
Mann-Whitney & Wilcoxon: Non-parametrik alternatif

📈 Hasil Utama
Model Regresi (p < 0.001)
IPK = 3.45 - 0.14 × Frekuensi_TikTok
Interpretasi:
Setiap peningkatan 1 jam/hari penggunaan TikTok berkorelasi dengan penurunan 0.14 poin IPK.
Metrik Model
IndikatorNilaiKesimpulanR²0.287Model menjelaskan 28.7% variasi IPKp-value< 0.001Hubungan signifikan secara statistikSpearman ρ-0.42Korelasi negatif sedangChi-squarep = 0.016Hubungan kategorikal signifikan
Validasi Asumsi ✅

Normalitas residual: Shapiro p = 0.123 ✓
Homoskedastisitas: BP p = 0.21 ✓
Autokorelasi: DW = 1.93 ✓
Multikolinearitas: VIF = 1.00 ✓

🎓 Kesimpulan & Implikasi
Temuan Kunci
Terdapat hubungan negatif signifikan antara durasi penggunaan TikTok dengan IPK mahasiswa. Model ini mendukung hipotesis bahwa penggunaan media sosial berlebihan dapat berdampak pada kinerja akademik melalui mekanisme:

Digital distraction selama waktu belajar
Berkurangnya alokasi waktu untuk tugas akademik
Sleep deprivation akibat scroll berlebihan

Keterbatasan

R² = 28.7% menunjukkan 71.3% variasi IPK dijelaskan faktor lain (motivasi, metode belajar, dukungan keluarga, kesehatan mental)
Data self-reported → potensi social desirability bias
Cross-sectional study → tidak dapat menunjukkan kausalitas definitif

Rekomendasi
Untuk Mahasiswa:

Batasi penggunaan TikTok <2 jam/hari
Gunakan app timer atau digital wellbeing tools
Prioritaskan jadwal belajar sebelum screen time

Untuk Institusi:

Implementasi program konseling akademik berbasis data
Workshop digital wellness & time management
Studi lanjutan dengan longitudinal design + variabel kontrol (jam tidur, partisipasi kelas, gaya belajar)

