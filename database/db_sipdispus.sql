-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for db_sipdispus
CREATE DATABASE IF NOT EXISTS `db_sipdispus` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_sipdispus`;

-- Dumping structure for table db_sipdispus.jabatan
CREATE TABLE IF NOT EXISTS `jabatan` (
  `id_jabatan` int NOT NULL AUTO_INCREMENT,
  `jabatan` varchar(1024) NOT NULL,
  `bidang` varchar(255) NOT NULL,
  `nama_lengkap` varchar(1024) NOT NULL,
  `nip` varchar(1024) NOT NULL,
  PRIMARY KEY (`id_jabatan`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_sipdispus.jabatan: ~8 rows (approximately)
INSERT INTO `jabatan` (`id_jabatan`, `jabatan`, `bidang`, `nama_lengkap`, `nip`) VALUES
	(1, 'Kepala Dinas', '-', 'Eko', '102910293101'),
	(2, 'Sekretaris Dinas', 'Sekretaris 1', 'Nurul', '102910293123'),
	(3, 'Kepala Bidang Pelayanan Perpustakaan', 'Pelayanan Perpustakaan', 'Liana', '102910293105'),
	(4, 'Kepala Bidang Arsip Dinamis', 'Arsip Dinamis', 'Ratri', '102910293102'),
	(5, 'Kepala Bidang Arsip Statis', 'Arsip Statis', 'Nana', '102910293103'),
	(6, 'Admin', '-', 'Admin', '102910293111'),
	(7, 'Staff Arsip Dinamis', 'Arsip Dinamis', 'Sarah', '102910293131'),
	(8, 'Staff Arsip Dinamis', 'Arsip Dinamis', 'Aliya', '102910293132');

-- Dumping structure for table db_sipdispus.komponen
CREATE TABLE IF NOT EXISTS `komponen` (
  `id_komponen` int NOT NULL AUTO_INCREMENT,
  `komponen` varchar(1024) NOT NULL,
  PRIMARY KEY (`id_komponen`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_sipdispus.komponen: ~4 rows (approximately)
INSERT INTO `komponen` (`id_komponen`, `komponen`) VALUES
	(1, 'Perencanaan Kinerja'),
	(2, 'Pengukuran Kinerja'),
	(3, 'Pelaporan Kinerja'),
	(4, 'Evaluasi Akuntabilitas Kinerja Internal');

-- Dumping structure for table db_sipdispus.penilaian
CREATE TABLE IF NOT EXISTS `penilaian` (
  `id_penilaian` int NOT NULL AUTO_INCREMENT,
  `id_u` int NOT NULL,
  `id_jabatan` int NOT NULL,
  `id_subkomponen` int NOT NULL,
  `tanggal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nilai` float NOT NULL,
  `kualitas` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hasil` float NOT NULL,
  `kualitas_hasil` varchar(10) NOT NULL,
  `predikat` varchar(50) NOT NULL,
  `catatan` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `daftar_evidence` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `kesimpulan_evaluasi` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_penilaian`),
  KEY `id_subkomponen` (`id_subkomponen`),
  KEY `id_opd` (`id_jabatan`),
  KEY `id_u` (`id_u`),
  CONSTRAINT `FK_penilaian_jabatan` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON UPDATE CASCADE,
  CONSTRAINT `FK_penilaian_subkomponen` FOREIGN KEY (`id_subkomponen`) REFERENCES `subkomponen` (`id_subkomponen`) ON UPDATE CASCADE,
  CONSTRAINT `FK_penilaian_users` FOREIGN KEY (`id_u`) REFERENCES `users` (`id_u`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table db_sipdispus.penilaian: ~12 rows (approximately)
INSERT INTO `penilaian` (`id_penilaian`, `id_u`, `id_jabatan`, `id_subkomponen`, `tanggal`, `nilai`, `kualitas`, `hasil`, `kualitas_hasil`, `predikat`, `catatan`, `daftar_evidence`, `kesimpulan_evaluasi`) VALUES
	(1, 5, 7, 1, '29/11/2023', 97, 'AA', 91.75, 'AA', 'Sangat Memuaskan', '-', '-', 'Pertahankan kinerja!'),
	(2, 5, 7, 2, '29/11/2023', 88, 'A', 91.75, 'AA', 'Sangat Memuaskan', '-', '-', 'Pertahankan kinerja!'),
	(3, 5, 7, 3, '29/11/2023', 76, 'BB', 91.75, 'AA', 'Sangat Memuaskan', '-', '-', 'Pertahankan kinerja!'),
	(4, 5, 7, 4, '29/11/2023', 89, 'A', 91.75, 'AA', 'Sangat Memuaskan', '-', '-', 'Pertahankan kinerja!'),
	(5, 5, 7, 5, '29/11/2023', 97, 'AA', 91.75, 'AA', 'Sangat Memuaskan', '-', '-', 'Pertahankan kinerja!'),
	(6, 5, 7, 6, '29/11/2023', 99, 'AA', 91.75, 'AA', 'Sangat Memuaskan', '-', '-', 'Pertahankan kinerja!'),
	(7, 5, 7, 7, '29/11/2023', 95, 'AA', 91.75, 'AA', 'Sangat Memuaskan', '-', '-', 'Pertahankan kinerja!'),
	(8, 5, 7, 8, '29/11/2023', 87, 'A', 91.75, 'AA', 'Sangat Memuaskan', '-', '-', 'Pertahankan kinerja!'),
	(9, 5, 7, 9, '29/11/2023', 89, 'A', 91.75, 'AA', 'Sangat Memuaskan', '-', '-', 'Pertahankan kinerja!'),
	(10, 5, 7, 10, '29/11/2023', 98, 'AA', 91.75, 'AA', 'Sangat Memuaskan', '-', '-', 'Pertahankan kinerja!'),
	(11, 5, 7, 11, '29/11/2023', 94, 'AA', 91.75, 'AA', 'Sangat Memuaskan', '-', '-', 'Pertahankan kinerja!'),
	(12, 5, 7, 12, '29/11/2023', 92, 'AA', 91.75, 'AA', 'Sangat Memuaskan', '-', '-', 'Pertahankan kinerja!');

-- Dumping structure for table db_sipdispus.subkomponen
CREATE TABLE IF NOT EXISTS `subkomponen` (
  `id_subkomponen` int NOT NULL AUTO_INCREMENT,
  `id_komponen` int NOT NULL,
  `subkomponen` varchar(1024) NOT NULL,
  `kriteria` varchar(5000) NOT NULL,
  `bobot` float NOT NULL,
  PRIMARY KEY (`id_subkomponen`),
  KEY `id_komponen` (`id_komponen`),
  CONSTRAINT `subkomponen_ibfk_1` FOREIGN KEY (`id_komponen`) REFERENCES `komponen` (`id_komponen`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_sipdispus.subkomponen: ~12 rows (approximately)
INSERT INTO `subkomponen` (`id_subkomponen`, `id_komponen`, `subkomponen`, `kriteria`, `bobot`) VALUES
	(1, 1, 'Dokumen Perencanaan Kinerja telah Tersedia', '<p>1.&nbsp;Terdapat pedoman teknis perencanaan kinerja.</p>\r\n\r\n<p>2.&nbsp;Terdapat dokumen perencanaan kinerja jangka panjang.</p>\r\n\r\n<p>3.&nbsp;Terdapat dokumen perencanaan kinerja jangka menengah.</p>\r\n\r\n<p>4.&nbsp;Terdapat dokumen perencanaan kinerja jangka pendek.</p>\r\n\r\n<p>5.&nbsp;Terdapat dokumen perencanaan aktivitas yang mendukung kinerja.</p>\r\n\r\n<p>6.&nbsp;Terdapat dokumen perencanaan anggaran yang mendukung kinerja.</p>\r\n', 6),
	(2, 1, 'Dokumen Perencanaan kinerja telah memenuhi standar yang baik, yaitu untuk mencapai hasil, dengan ukuran kinerja yang SMART, menggunakan penyelarasan (cascading) disetiap level secara logis, serta memperhatikan kinerja bidang lain (crosscutting)', '<p>1.&nbsp;Dokumen Perencanaan Kinerja telah diformalkan.</p>\r\n\r\n<p>2.&nbsp;Dokumen Perencanaan Kinerja telah dipublikasikan tepat waktu.</p>\r\n\r\n<p>3.&nbsp;Dokumen Perencanaan Kinerja telah menggambarkan Kebutuhan atas Kinerja sebenarnya yang perlu dicapai.</p>\r\n\r\n<p>4.&nbsp;Kualitas Rumusan Hasil (Tujuan/Sasaran) telah jelas menggambarkan kondisi kinerja yang akan dicapai.</p>\r\n\r\n<p>5.&nbsp;Ukuran Keberhasilan (Indikator Kinerja) telah memenuhi kriteria SMART.</p>\r\n\r\n<p>6.&nbsp;Indikator Kinerja Utama (IKU) telah menggambarkan kondisi Kinerja Utama yang harus dicapai, tertuang secara berkelanjutan (sustainable - tidak sering diganti dalam 1 periode Perencanaan Strategis).</p>\r\n\r\n<p>7.&nbsp;Target yang ditetapkan dalam Perencanaan Kinerja dapat dicapai (achievable), menantang, dan realistis.</p>\r\n\r\n<p>8.&nbsp;Setiap Dokumen Perencanaan Kinerja menggambarkan hubungan yang berkesinambungan, serta selaras antara Kondisi/Hasil yang akan dicapai di setiap level jabatan (Cascading).</p>\r\n\r\n<p>9.&nbsp;Perencanaan kinerja dapat memberikan informasi tentang hubungan kinerja, strategi, kebijakan, bahkan aktivitas antar bidang/dengan tugas dan fungsi lain yang berkaitan (Crosscutting).</p>\r\n\r\n<p>10.&nbsp;Setiap unit/satuan kerja merumuskan dan menetapkan Perencanaan Kinerja.</p>\r\n\r\n<p>11.&nbsp;Setiap pegawai merumuskan dan menetapkan Perencanaan Kinerja.</p>\r\n', 9),
	(3, 1, 'Perencanaan Kinerja telah dimanfaatkan untuk mewujudkan hasil yang berkesinambungan', '<p>1.&nbsp;Anggaran yang ditetapkan telah mengacu pada Kinerja yang ingin dicapai.</p>\r\n\r\n<p>2.&nbsp;Aktivitas yang dilaksanakan telah mendukung Kinerja yang ingin dicapai.</p>\r\n\r\n<p>3.&nbsp;Target yang ditetapkan dalam Perencanaan Kinerja telah dicapai dengan baik, atau setidaknya masih on the right track.</p>\r\n\r\n<p>4.&nbsp;Rencana aksi kinerja dapat berjalan dinamis karena capaian kinerja selalu dipantau secara berkala.</p>\r\n\r\n<p>5.&nbsp;Terdapat perbaikan/penyempurnaan Dokumen Perencanaan Kinerja yang ditetapkan dari hasil analisis perbaikan kinerja sebelumnya.</p>\r\n\r\n<p>6.&nbsp;Terdapat perbaikan/penyempurnaan Dokumen Perencanaan Kinerja dalam mewujudkan kondisi/hasil yang lebih baik.</p>\r\n\r\n<p>7.&nbsp;Setiap unit/satuan kerja memahami dan peduli, serta berkomitmen dalam mencapai kinerja yang telah direncanakan.</p>\r\n\r\n<p>8.&nbsp;Setiap Pegawai memahami dan peduli, serta berkomitmen dalam mencapai kinerja yang telah direncanakan.</p>\r\n', 15),
	(4, 2, 'Pengukuran Kinerja telah dilakukan', '<p>1.&nbsp;Terdapat pedoman teknis pengukuran kinerja dan pengumpulan data kinerja.</p>\r\n\r\n<p>2.&nbsp;Terdapat Definisi Operasional yang jelas atas kinerja dan cara mengukur indikator kinerja.</p>\r\n\r\n<p>3.&nbsp;Terdapat mekanisme yang jelas terhadap pengumpulan data kinerja yang dapat diandalkan.</p>\r\n', 6),
	(5, 2, 'Pengukuran Kinerja telah menjadi kebutuhan dalam mewujudkan Kinerja secara Efektif dan Efisien dan telah dilakukan secara berjenjang dan berkelanjutan', '<p>1.&nbsp;Pimpinan selalu teribat sebagai pengambil keputusan (Decision Maker) dalam mengukur capaian kinerja.</p>\r\n\r\n<p>2.&nbsp;Data kinerja yang dikumpulkan telah relevan untuk mengukur capaian kinerja yang diharapkan.</p>\r\n\r\n<p>3.&nbsp;Data kinerja yang dikumpulkan telah mendukung capaian kinerja yang diharapkan.</p>\r\n\r\n<p>4.&nbsp;Pengukuran kinerja telah dilakukan secara berkala.</p>\r\n\r\n<p>5.&nbsp;Setiap level organisasi melakukan pemantauan atas pengukuran capaian kinerja unit dibawahnya secara berjenjang.</p>\r\n\r\n<p>6.&nbsp;Pengumpulan data kinerja telah memanfaatkan Teknologi Informasi (Aplikasi).</p>\r\n\r\n<p>7.&nbsp;Pengukuran capaian kinerja telah memanfaatkan Teknologi Informasi (Aplikasi).</p>\r\n', 9),
	(6, 2, 'Pengukuran Kinerja telah dijadikan dasar dalam pemberian Reward dan Punishment, serta penyesuaian strategi dalam mencapai kinerja yang efektif dan efisien', '<p>1.&nbsp;Pengukuran Kinerja telah menjadi dasar dalam penyesuaian (pemberian/pengurangan) tunjangan kinerja/penghasilan.</p>\r\n\r\n<p>2.&nbsp;Pengukuran Kinerja telah menjadi dasar dalam penempatan/penghapusan Jabatan baik struktural maupun fungsional.</p>\r\n\r\n<p>3.&nbsp;Pengukuran kinerja telah mempengaruhi penyesuaian (Refocusing) Organisasi.</p>\r\n\r\n<p>4.&nbsp;Pengukuran kinerja telah mempengaruhi penyesuaian Strategi dalam mencapai kinerja.</p>\r\n\r\n<p>5.&nbsp;Pengukuran kinerja telah mempengaruhi penyesuaian Kebijakan dalam mencapai kinerja.</p>\r\n\r\n<p>6.&nbsp;Pengukuran kinerja telah mempengaruhi penyesuaian Aktivitas dalam mencapai kinerja.</p>\r\n\r\n<p>7.&nbsp;Pengukuran kinerja telah mempengaruhi penyesuaian Anggaran dalam mencapai kinerja.</p>\r\n\r\n<p>8.&nbsp;Terdapat efisiensi atas penggunaan anggaran dalam mencapai kinerja.</p>\r\n\r\n<p>9.&nbsp;Setiap unit/satuan kerja memahami dan peduli atas hasil pengukuran kinerja.</p>\r\n\r\n<p>10.&nbsp;Setiap pegawai memahami dan peduli atas hasil pengukuran kinerja.</p>\r\n', 15),
	(7, 3, 'Terdapat Dokumen Laporan yang menggambarkan ', '<p>1.&nbsp;Dokumen Laporan Kinerja telah disusun.</p>\r\n\r\n<p>2.&nbsp;Dokumen Laporan Kinerja telah disusun secara berkala.</p>\r\n\r\n<p>3.&nbsp;Dokumen Laporan Kinerja telah diformalkan.</p>\r\n\r\n<p>4.&nbsp;Dokumen Laporan Kinerja telah direviu.</p>\r\n\r\n<p>5.&nbsp;Dokumen Laporan Kinerja telah dipublikasikan.</p>\r\n\r\n<p>6.&nbsp;Dokumen Laporan Kinerja telah disampaikan tepat waktu.</p>\r\n', 3),
	(8, 3, 'Dokumen Laporan Kinerja telah memenuhi Standar menggambarkan Kualitas atas Pencapaian Kinerja, informasi keberhasilan/kegagalan kinerja serta upaya perbaikan/penyempurnaannya', '<p>1.&nbsp;Dokumen Laporan Kinerja disusun secara berkualitas sesuai dengan standar.</p>\r\n\r\n<p>2.&nbsp;Dokumen Laporan Kinerja telah mengungkap seluruh informasi tentang pencapaian kinerja.</p>\r\n\r\n<p>3.&nbsp;Dokumen Laporan Kinerja telah menginfokan analisis dan evaluasi realisasi kinerja dengan target tahunan.</p>\r\n\r\n<p>4.&nbsp;Dokumen Laporan Kinerja telah menginfokan analisis dan evaluasi realisasi kinerja dengan target jangka menengah.</p>\r\n\r\n<p>5.&nbsp;Dokumen Laporan Kinerja telah menginfokan analisis dan evaluasi realisasi kinerja dengan realisasi kinerja tahun-tahun sebelumnya.</p>\r\n\r\n<p>6.&nbsp;Dokumen Laporan Kinerja telah menginfokan analisis dan evaluasi realisasi kinerja dengan realiasi kinerja di level nasional/internasional (Benchmark Kinerja).</p>\r\n\r\n<p>7.&nbsp;Dokumen Laporan Kinerja telah menginfokan kualitas atas keberhasilan/kegagalan mencapai target kinerja beserta upaya nyata dan/atau hambatannya.</p>\r\n\r\n<p>8.&nbsp;Dokumen Laporan Kinerja telah menginfokan efisiensi atas penggunaan sumber daya dalam mencapai kinerja.</p>\r\n\r\n<p>9.&nbsp;Dokumen Laporan Kinerja telah menginfokan upaya perbaikan dan penyempurnaan kinerja ke depan (Rekomendasi perbaikan kinerja).</p>\r\n\r\n<p>10.&nbsp;Dokumen Laporan Kinerja telah menginfokan efisiensi atas penggunaan sumber daya dalam mencapai kinerja.</p>\r\n', 4.5),
	(9, 3, 'Pelaporan Kinerja telah memberikan dampak yang besar dalam penyesuaian strategi/kebijakan dalam mencapai kinerja berikutnya', '<p>1.&nbsp;Informasi dalam laporan kinerja selalu menjadi perhatian utama pimpinan (Bertanggung Jawab).</p>\r\n\r\n<p>2.&nbsp;Penyajian informasi dalam laporan kinerja menjadi kepedulian seluruh pegawai.</p>\r\n\r\n<p>3.&nbsp;Informasi dalam laporan kinerja berkala telah digunakan dalam penyesuaian aktivitas untuk mencapai kinerja.</p>\r\n\r\n<p>4.&nbsp;Informasi dalam laporan kinerja berkala telah digunakan dalam penyesuaian penggunaan anggaran untuk mencapai kinerja.</p>\r\n\r\n<p>5.&nbsp;Informasi dalam laporan kinerja telah digunakan dalam evaluasi pencapaian keberhasilan kinerja.</p>\r\n\r\n<p>6.&nbsp;Informasi dalam laporan kinerja telah digunakan dalam penyesuaian perencanaan kinerja yang akan dihadapi berikutnya.</p>\r\n\r\n<p>7.&nbsp;Informasi dalam laporan kinerja selalu mempengaruhi perubahan budaya kinerja organisasi.</p>\r\n', 7.5),
	(10, 4, 'Evaluasi Akuntabilitas Kinerja Internal telah dilaksanakan ', '<p>1.&nbsp;Terdapat pedoman teknis Evaluasi Akuntabilitas Kinerja Internal.</p>\r\n\r\n<p>2.&nbsp;Evaluasi Akuntabilitas Kinerja Internal telah dilaksanakan pada seluruh unit kerja/perangkat daerah.</p>\r\n\r\n<p>3.&nbsp;Evaluasi Akuntabilitas Kinerja Internal telah dilaksanakan secara berjenjang.</p>\r\n', 5),
	(11, 4, 'Evaluasi Akuntabilitas Kinerja Internal telah dilaksanakan secara berkualitas dengan Sumber Daya yang memadai', '<p>1.&nbsp;Evaluasi Akuntabilitas Kinerja Internal telah dilaksanakan sesuai standar.</p>\r\n\r\n<p>2.&nbsp;Evaluasi Akuntabilitas Kinerja Internal telah dilaksanakan oleh SDM yang memadai.</p>\r\n\r\n<p>3.&nbsp;Evaluasi Akuntabilitas Kinerja Internal telah dilaksanakan dengan pendalaman yang memadai.</p>\r\n\r\n<p>4.&nbsp;Evaluasi Akuntabilitas Kinerja Internal telah dilaksanakan pada seluruh unit kerja/perangkat daerah.</p>\r\n\r\n<p>5.&nbsp;Evaluasi Akuntabilitas Kinerja Internal telah dilaksanakan menggunakan Teknologi Informasi (Aplikasi).</p>\r\n', 7.5),
	(12, 4, 'Implementasi SAKIP telah meningkat karena evaluasi Akuntabilitas Kinerja Internal sehingga memberikan kesan yang nyata (dampak) dalam efektifitas dan efisiensi Kinerja', '<p>1.&nbsp;Seluruh rekomendasi atas hasil evaluasi akuntablitas kinerja internal telah ditindaklanjuti.</p>\r\n\r\n<p>2.&nbsp;Telah terjadi peningkatan implementasi SAKIP dengan melaksanakan tindak lanjut atas rerkomendasi hasil evaluasi akuntablitas Kinerja internal.</p>\r\n\r\n<p>3.&nbsp;Hasil Evaluasi Akuntabilitas Kinerja Internal telah dimanfaatkan untuk perbaikan dan peningkatan akuntabilitas kinerja.</p>\r\n\r\n<p>4.&nbsp;Hasil dari Evaluasi Akuntabilitas Kinerja Internal telah dimanfaatkan dalam mendukung efektifitas dan efisiensi kinerja.</p>\r\n\r\n<p>5.&nbsp;Telah terjadi perbaikan dan peningkatan kinerja dengan memanfaatkan hasil evaluasi akuntablitas kinerja internal.</p>\r\n', 12.5);

-- Dumping structure for table db_sipdispus.users
CREATE TABLE IF NOT EXISTS `users` (
  `id_u` int NOT NULL AUTO_INCREMENT,
  `id_jabatan` int NOT NULL,
  `nama_user` varchar(1024) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(225) NOT NULL,
  `foto_profil` varchar(255) NOT NULL,
  `level` varchar(1024) NOT NULL,
  `is_trash` tinyint NOT NULL DEFAULT '1' COMMENT '1 = aktif | 2 = nonaktif',
  PRIMARY KEY (`id_u`),
  KEY `id_opd` (`id_jabatan`),
  CONSTRAINT `FK_users_jabatan` FOREIGN KEY (`id_jabatan`) REFERENCES `jabatan` (`id_jabatan`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table db_sipdispus.users: ~7 rows (approximately)
INSERT INTO `users` (`id_u`, `id_jabatan`, `nama_user`, `username`, `password`, `foto_profil`, `level`, `is_trash`) VALUES
	(1, 6, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'cd1e846ee121ba9eb53addb9aee6ae2c.jpg', 'Admin', 1),
	(2, 1, 'Eko', 'eko12345', 'd403d1715ca3f7ef5a7bd79df12b9817', 'da175d381ec8b418466f294a8c07fdb1.jpg', 'Penilai', 1),
	(3, 2, 'Nurul', 'nurul123', '55811d685377dc59c4f23b946670dcca', '5071d6f085ed6a5fe5d958c289415f1b.jpg', 'Penilai', 1),
	(4, 6, 'Admin Kedua', 'adminkedua', '8f1b8c1bb2622e1f02f15bc864d3a93a', 'fb04e11d6f19d1c37585a4001b442df5.jpg', 'Admin', 1),
	(5, 3, 'Liana', 'liana123', '8f074325ee71f9c2583a8790d76140a9', '3c37c933f1d655c980956a6fb646220f.jpg', 'Penilai', 1),
	(11, 7, 'Sarah', 'sarah123', 'ec26202651ed221cf8f993668c459d46', '683d9dfd0010f1f08fcdbf69eee541ba.jpg', 'Ternilai', 1),
	(12, 8, 'Aliya', 'aliya123', 'cd7e281471277cbef956155941ca3f61', '69372cb9bc2f9768cbafc0122a59a50e.jpg', 'Ternilai', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
