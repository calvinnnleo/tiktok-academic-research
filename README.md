Analisis Pengaruh Penggunaan TikTok terhadap IPK Mahasiswa
Proyek ini merupakan studi statistik untuk menguji hubungan antara frekuensi penggunaan TikTok dan prestasi akademik (diukur dengan IPK) pada mahasiswa. Analisis dilakukan menggunakan R dengan pendekatan kuantitatif, mencakup transformasi data, uji asumsi statistik, regresi linear, serta validasi model.

Tujuan Analisis
Mengukur kekuatan dan arah hubungan antara durasi penggunaan TikTok dan IPK
Menguji signifikansi statistik hubungan tersebut
Memvalidasi model regresi linear berdasarkan asumsi klasik
Memberikan interpretasi berbasis bukti untuk pengambilan keputusan akademik/pribadi
Metodologi
Transformasi Data
Variabel kategorikal dikonversi ke numerik:
IPK dikodekan sebagai titik tengah kategori (misal: 2,0–2,5 → 2,25)
Frekuensi penggunaan TikTok dikuantifikasi dalam jam per hari (misal: 1–2 jam → 1,5 jam)
Statistik Deskriptif
Dilaporkan mean, standar deviasi, skewness, dan kurtosis untuk kedua variabel utama.
Uji Normalitas
Menggunakan Shapiro-Wilk dan Anderson-Darling untuk memeriksa distribusi data dan residual.
Analisis Regresi Linear
Model:

IPK = β₀ + β₁ × Frekuensi_TikTok + ε

Dilengkapi uji asumsi klasik:
Normalitas residual (QQ-plot & uji formal)
Homoskedastisitas (uji Breusch-Pagan)
Autokorelasi (uji Durbin-Watson)
Multikolinearitas (VIF < 10)
Uji Korelasi & Hipotesis Non-Parametrik
Korelasi Spearman (untuk hubungan monotonik)
Uji Chi-square (untuk hubungan antar variabel kategorikal)
Uji Mann-Whitney dan Wilcoxon sebagai robustness check
Hasil Utama
Model regresi signifikan (p < 0,001):

IPK = 3,45 − 0,14 × Frekuensi_TikTok

Artinya, setiap peningkatan 1 jam/hari penggunaan TikTok berkaitan dengan penurunan rata-rata 0,14 poin IPK.
Koefisien determinasi (R²) = 0,287:
Model menjelaskan 28,7% variasi IPK; sisanya dipengaruhi oleh faktor lain (misal: motivasi, metode belajar, dukungan sosial).
Korelasi Spearman ρ = −0,42 (p < 0,001):
Menunjukkan hubungan negatif sedang yang konsisten, bahkan ketika asumsi normalitas tidak sepenuhnya terpenuhi.
Uji Chi-square (p = 0,016):
Terdapat hubungan signifikan antara kategori frekuensi TikTok dan distribusi IPK.
Semua asumsi regresi linear terpenuhi:
Residual terdistribusi normal
Tidak ada heteroskedastisitas (BP p = 0,21)
Tidak ada autokorelasi (DW = 1,93)
Tidak ada multikolinearitas (VIF = 1,00)
Kesimpulan
Terdapat hubungan negatif yang signifikan secara statistik antara durasi penggunaan TikTok dan IPK mahasiswa. Temuan ini mendukung hipotesis bahwa penggunaan media sosial berlebihan dapat berdampak pada kinerja akademik, khususnya dalam konteks digital distraction dan alokasi waktu belajar.

Model ini dapat digunakan sebagai dasar untuk:

Intervensi konseling akademik berbasis data
Sosialisasi digital wellness di lingkungan kampus
Studi lanjutan dengan variabel kontrol (misal: jam tidur, partisipasi kelas)
