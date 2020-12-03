-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Des 2020 pada 18.17
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_finance_app`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `informasi`
--

CREATE TABLE `informasi` (
  `id_informasi` int(11) NOT NULL,
  `jenis` varchar(10) NOT NULL,
  `judul` text NOT NULL,
  `penjelasan` longtext NOT NULL,
  `image` text NOT NULL,
  `sumber` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `informasi`
--

INSERT INTO `informasi` (`id_informasi`, `jenis`, `judul`, `penjelasan`, `image`, `sumber`, `create_at`) VALUES
(1, 'finance', 'Apa Itu Investasi', 'Secara umum, pengertian dari investasi adalah penanaman aset atau dana yang dilakukan oleh sebuah perusahaan atau perorangan untuk jangka waktu tertentu demi memperoleh imbal balik yang lebih besar di masa depan. Ada banyak hal yang terlibat dalam aktivitas ini, dan beberapa di antaranya adalah jumlah dana dan tujuan dari investasi itu sendiri.\r\n\r\nBagi yang sudah lama melibatkan diri dalam dunia penanaman modal, baik lokal maupun internasional, istilah ‘berinvestasi’ bukanlah sesuatu yang asing. Namun bagi pemula, penjelasan singkat dan jelas mengenai pengertian dasar dan cara berinvestasi sangatlah dibutuhkan. Berikut adalah penjabaran sederhana untuk Anda yang tertarik dan masih baru dalam aktivitas ini.\r\n\r\nSeperti yang sudah disinggung di atas, investasi adalah salah satu cara dalam mengembangkan jumlah uang atau harta yang Anda miliki saat ini. Sederhananya, Anda bermaksud untuk memperoleh dana lebih dari keuntungan di masa depan untuk mencapai tujuan tertentu. Sebut saja tujuan Anda adalah ingin membangun rumah, menyekolahkan anggota keluarga, atau membuka usaha.', 'finance1.jpg', 'https://www.akseleran.co.id/', '2020-12-02 15:44:40'),
(2, 'finance', 'Panduan Sederhana dalam Cara Berinvestasi', 'Ada banyak istilah dalam aktivitas berinvestasi yang menuntut rangkaian penjelasan panjang. Namun untuk tahap awal, Anda bisa fokus pada poin-poin dasar seperti berikut\r\n\r\nMemiliki tujuan jelas. Kenapa tujuan (objective) dalam berinvestasi sangat penting? Hal ini karena jika Anda tidak memiliki tujuan yang jelas, maka akan sulit menentukan langkah apa yang harus diambil selanjutnya. Tujuan akan memengaruhi investasi seperti apa yang sebaiknya Anda ambil, mulai dari segi jangka waktu, jenisnya, hingga di mana Anda ingin menempatkan investasi tersebut.\r\nMenilai seberapa banyak modal yang bisa Anda siapkan. Modal (capital) ini membahas seputar dana atau aset yang Anda miliki sekarang. Saat ini, berinvestasi dengan modal Rp100.000 atau kurang dari itu sudah mungkin untuk Anda lakukan. Modal juga mempengaruhi jenis investasi, misalnya emas, saham, atau properti.\r\nMemahami risiko pada diri sebagai investor dan jenis investasi yang diambil. Segala hal yang berhubungan dengan perputaran uang memang tidak akan terlepas dari faktor untung-rugi. Yang dimaksud dengan risiko pada diri sendiri adalah kemampuan secara finansial. Ketika Anda memutuskan untuk berinventasi, hal pertama yang Anda lakukan tentu saja menyiapkan sejumlah dana, baik saat akan memulai maupun selama prosesnya. Dalam hal ini, lebih dulu terlepas dari utang dan memilki kondisi pendapatan yang stabil dan dana ekstra adalah beberapa hal yang patut diperhatikan.\r\nLalu yang kedua adalah mengerti risiko dari berbagai jenis investasi. Dalam berinvestasi, imbal balik (return) dan risiko (risk) akan selalu beriringan. Ada jenis investasi yang memiliki risiko kerugian tinggi namun justru mampu menghasilkan imbal balik yang besar. Sebut saja saham di mana tidak jarang jenis investasi ini malah membuat seorang investor gigit jari karena tidak mendapatkan apa-apa. Kemudian jenis lainnya adalah emas. Harga emas cenderung merambat naik setiap tahunnya meskipun potensi imbal hasilnya tidak sebesar saham. Karena kondisinya yang stabil dan mudah dipahami, sebagian besar masyarakat masih menggemari jenis investasi ini.', 'finance2.jpg', 'https://www.akseleran.co.id/', '2020-12-02 15:44:53'),
(3, 'finance', 'Apa Itu Diversifikasi?', 'Untuk memperoleh hasil yang diharapkan, berbagai strategi penanaman modal memang sebaiknya dilakukan. Salah satu strategi yang paling sering dilakukan adalah dengan sistem diversifikasi atau menyebar modal yang dimiliki ke beberapa jenis investasi. Diversifikasi juga bisa diterapkan ke dalam satu jenis investasi.\r\n\r\nMisalnya, si investor memilih investasi saham, dan dia menyebarnya tidak hanya pada satu perusahaan saja melainkan lebih. Hal ini bertujuan untuk memperkecil risiko kerugian pada return nanti. Atau bisa dibilang, jika salah satu perusahaan bangkrut, maka posisi investor masih relatif aman dengan adanya saham pada perusahaan lainnya.\r\n\r\nCara lain diversifikasi investasi adalah menyebar investasi ke berbagai jenis instrumen investasi lainnya. Ini adalah salah satu cara menurunkan risiko dalam berinvestasi yang umum dilakukan.', 'finance3.jpg', 'https://www.akseleran.co.id/', '2020-12-02 15:44:53'),
(4, 'finance', 'Saat yang Tepat dan Jangka Waktu', 'Poin terakhir ini tampak sederhana namun memiliki pengaruh yang besar. Apa pun jenis investasi Anda, waktu mempengaruhi tingkat keuntungan yang didapatkan. Adanya efek compounding atau bunga berbunga menyebabkan keuntungan akan semakin besar ketika kita semakin cepat memulai investasi.\r\n\r\nDengan jangka waktu investasi yang ada, semakin dini Anda memulai, maka semakin cepat pula Anda ‘memanennya’. Sebagai contoh, jika dalam beberapa tahun ke depan, salah satu anggota keluarga akan mulai masuk sekolah dan membutuhkan biaya sekolah, maka berinvestasi dari sekarang adalah pilihan bijak. Dan jika bermasalah pada modal yang minim, Anda bisa mulai mencari tipe dan tempat berinvestasi yang tidak memerlukan dana besar.\r\n\r\nItulah hal-hal dasar seputar cara berinvestasi yang sebaiknya dipahami oleh para pemula. Jika masih mengalami kesulitan, pastikan untuk mengikuti manual (panduan) khusus yang disediakan oleh pihak-pihak pialang (perantara) investasi. Untuk tahapan standar, sangat mudah menemukannya di situs-situs internet.\r\n\r\nAtau, jika ingin memperoleh pengetahuan yang lebih mendetail, Anda bisa menggunakan penasihat khusus. Untuk jasa seperti ini, Anda tentu harus menyiapkan dana tersendiri.', 'finance4.jpg', 'https://www.akseleran.co.id/', '2020-12-02 15:44:53'),
(6, 'tips', '7 Tips Perencanaan Keuangan Untuk Pemula', 'Setelah kita memiliki penghasilan, tentunya kita ingin uang kita terus berlipat dan bertambah, bukan? Resiko inflasi dan kemungkinan besarnya biaya administrasi perbankan bisa menjadi hal yang menyebalkan yang berujung pada tergerusnya uang kita di bank. Jadi, apa salahnya kita mulai mengalokasikan uang kita dalam investasi yang sehat? Berikut tips perencanaan keuangan sederhana, buat kita yang ingin memulai namun belum tahu harus mulai dari mana.\r\n\r\n \r\n\r\n1. Mulailah dari Sekarang\r\n\r\nSering sekali saya mendengar curhatan teman atau klien yang berkata,”Duh, coba saya tahu sejak dulu.” Ada penyesalan yang tersirat di sini.\r\n\r\nSebenarnya investasi tidak pernah ada kata terlambat. Kita masih bisa melakukannya, selama kita melakukannya dan mau memulainya sekarang. Sesederhana karena semakin kita muda, maka resiko bisa diminimalisir dan hasil bisa semakin besar, sementara dana yang kita investasikan bisa jauh lebih kecil untuk hasil yang sama besar.\r\n\r\nWaktu adalah teman baik kita. Manfaatkan dengan memulai investasi sekarang.\r\n\r\n \r\n\r\n2. Konsultasi atau Berbicaralah Dengan Seseorang yang Paham\r\n\r\nAda banyak buku dan blod serta artikel tentang investasi. Mungkin kita bisa mengerti dan memahaminya, namun akan beda hasilnya kalau kita berkonsultasi langsung dengan para ahli perencana keuangan karena apa yang kita butuhkan bisa spesifik dijelaskan dan diarahkan sesuai dengan kebutuhan keuangan kita.\r\n\r\nLagipula, kita akan memiliki kebebasan untuk bertanya lebih detail dan belajar bukan?\r\n\r\n \r\n\r\n3. Miliki Tujuan Keuangan\r\n\r\nTujuan keuangan adalah peta hidup kita. Kalau kita memiliki tujuan keuangan yang spesifik, maka kita akan tahu apa yang harus kita lakukan dan bagaimana mencapainya.\r\n\r\nMisal: Kebutuhan Dana Pensiun. Kita ingin pension 30 tahun lagi misalnya, maka instrument investasi yang tepat adalah yang memberikan imbal balik besar untuk jangka panjang seperti saham dan reksadana.\r\n\r\nDan dengan memiliki tujuan keuangan, akan lebih memudahkan kita untuk memonitor perkembangannya apakah sesuai dengan target atau tidak.\r\n\r\n \r\n\r\n4. Mulailah Berinvestasi Dari Yang Sederhana\r\n\r\nKalau kita masih takut atau ragu untuk memulai berinvestasi di saham, lihat ke sekeliling produk yang ada di rumah kita. Apakah produknya terdaftar di bursa efek? Produk-produk rumah tangga sederhana seperti Blue Band, sudah ada mungkin malah sebelum kita lahir.\r\n\r\nKalau kita telah percaya dengan produknya selama lebih dari puluhan tahun, kenapa tidak kita memiliki perusahaannya? Atau mulai dari Bank yang ATMnya tersimpan manis di dalam dompet? Atau kita miliki saja perusahaan yang hasil produknya adalah merk-merk pakaian yang selalu kita beli dan merupakan clothing line wajib isi lemari, tempat ngopi favorit, atau burger kesukaan adik kecil kita.\r\n\r\n \r\n\r\n5. Berinvestasilah Sejauh Isi Dompet\r\n\r\nInvestasi ga selalunya harus mahal dan berjuta-juta. Ada beberapa saham pilihan yang harganya mulai daro Rp. 700,00 perlembar saham atau Rp. 70.000,00 per lot. Saham-saham perbankan berkisar antara Rp. 4.000,- sampai Rp. 11.000,- atau sekitar paling mahal sejutaan. Atau saham Unilever juga bisa kita miliki dengan modal Rp. 4 jutaan.\r\n\r\nMasih merasa ragu dan mahal? Kita bisa coba dengan mulai berinvestasi di reksadana saja. Reksadana bisa kita miliki mulai dari Rp. 100.000,- Dan dengan system autodebit, kita tidak usah perlu khawatir lagi lupa berinvestasi karena kemudahan yang diberikan.\r\n\r\n \r\n\r\n6. Diversifikasi\r\n\r\n‘Jangan menaruh telur dalam satu keranjang’, pasti kita pernah mendengar istilah itu. Analogi sederhana dengan maksud supaya hasil investasi kita tidak semuanya jatuh apabila kondisi pasar sedang tidak kondusif.\r\n\r\nBisa saja kita berinvestasi di saham perbankan, property, konstruksi, tambang, consumer goods, dan hanya memiliki satu jenis saham di setiap bidang. Bisa. Dan ini sudah termasuk diversifikasi.\r\n\r\nUntuk pemula, baiknya memang kita hanya memiliki 5 – 7 jenis saham yang kita nyaman untuk berinvestasi jangka panjang.\r\n\r\nReksadana sendiri sudah memiliki diversifikasi yang seimbang dalam portfolionya, sehingga kalau kita memiliki waktu yang sibuk untuk memilih dan dana yang terbatas, beli saja reksadana, karena sudah ada manager investasinya yang kompeten dalam mengatur hasil baik untuk investasi kita.\r\n\r\n \r\n\r\n7. Independen\r\n\r\nBerpangku pada broker memang enak. Sudah ada manager investasi yang membantu kita mengatur kapan waktu yang tepat untuk menjual atau membeli saham. Namun dengan bersikap independen dan melakukan sendiri proses belajar dan mengetahui berita-berita pendukung, otomatis memang ada kerja extra yang dilakukan, tapi I am my own master. Selain ilmu kita sendiri yang bertambah, kita akan lebih tahu tentang ekomoni Negara Indonesia sendiri.', 'tips1.png', 'https://arkanafinance.co.id/', '2020-12-02 15:47:53'),
(8, 'tips', '11 Cara Mengelola Keuangan dengan Baik dan Benar', 'Keuangan adalah sebuah hal yang sangat penting Anda kelola. Mengelola keuangan memang tidak akan semudah seperti yang Anda lihat di televisi ataupun seminar. Namun bagaimanapun juga Anda tetap harus berusaha untuk mengetahui cara mengelola keuangan dengan baik dan benar.\r\n\r\nSebenarnya mengelola keuangan ada banyak cara. Anda tentu harus memilih cara manakah yang paling sesuai untuk Anda. Beberapa faktor seperti seberapa besar gaji Anda, seberapa besar pengeluaran Anda, apa saja tanggungan Anda, hingga rencana kedepan Anda akan menentukan bagaimana cara yang tepat untuk mengelola keuangan. Berikut adalah cara mengatur keuangan bulanan yang tepat untuk Anda.\r\n\r\n1. Buatlah anggaran keuangan\r\nMembuat anggaran adalah salah satu cara agar uang dapat Anda gunakan dengan tepat. Usahakan selalu membuat skala prioritas. Skala prioritas akan menghindarkan Anda membeli sesuatu yang tidak Anda butuhkan. Selain itu anggaran keuangan akan memberi gambaran seberapa besar pengeluaran bulanan Anda.\r\n\r\n \r\n\r\n2. Lunasi hutang Anda\r\nCara mengelola keuangan yang baik dan benar adalah dengan tidak memiliki hutang. Berhutang memang tidak ada salahnya tetapi hutang akan membuat keuangan Anda tidak akan bertumbuh dan justru terbebani. Jika memang Anda harus berhutang maka Anda harus memperhatikan besaran bunga dan juga jangka waktu melunasi hutang Anda tersebut.\r\n\r\n \r\n\r\n3. Bayangkan Anda di masa tua\r\nIngin seperti apakah Anda dimasa tua nanti akan menentukan arah pengelolaan keuangan Anda. Apakah Anda ingin hidup sederhana di desa atau Anda ingin masa tua Anda dihabiskan dengan berlibur semuanya membutuhkan perencanaan keuangan yang matang. Perencanaan keuangan harus dimulai dari pengelolaan keuangan yang baik.\r\n\r\n \r\n\r\n4. Siapkan asuransi\r\nCara mengatur keuangan di masa sulit salah satunya adalah dengan menyiapkan dana khusus untuk asuransi. Dengan asuransi Anda tidak perlu khawatir jika sewaktu-waktu terjadi sesuatu yang tidak Anda inginkan. Namun Anda perlu memilih asuransi yang terpercaya, mudah dalam melakukan pencairan dana, serta premi yang ringan sesuai kemampuan.\r\n\r\n \r\n\r\n5. Investasikan uang Anda\r\nMenginvestasikan uang adalah suatu keharusan di masa kini. Investasi saat ini dapat Anda lakukan dengan nominal yang relatif rendah. Selain itu saat ini Anda juga bisa memilih cukup banyak pilihan produk investasi.\r\n\r\nInvestasi memiliki beberapa macam mulai dari yang memiliki risiko rendah hingga tinggi. Investasi akan memberikan keuntungan untuk Anda dimasa depan.\r\n\r\n6. Simpan uang receh\r\nJangan pernah sepelekan uang receh yang Anda miliki. Anda bisa memanfaatkan celengan agar Anda bisa menyimpan uang receh Anda. Tanpa terasa uang receh yang Anda kumpulkan dapat Anda gunakan untuk keperluan tersier Anda. \r\n\r\n \r\n\r\n7. Jangan lupa menabung\r\nMenabung memang sangatlah penting dalam mengelola keuangan dengan benar. Sepertinya semua orang sudah tahu mengenai pentingnya menabung. Tetapi satu hal yang penting adalah Anda sebaiknya tidak menyimpan uang terlalu banyak dalam tabungan.\r\n\r\nHal tersebut adalah karena uang Anda akan termakan inflasi. Investasi adalah sesuatu yang harus Anda pertimbangkan ketika mengelola keuangan Anda.\r\n\r\n \r\n\r\n8. Pisahkan berbagai kebutuhan\r\nPada dasarnya Anda dapat membagi kebutuhan Anda berdasarkan waktunya seperti jangka pendek, menengah, dan masa depan.  Kebutuhan jangka pendek tentu harus Anda utamakan dalam pemenuhannya tetapi Anda juga harus mempertimbangkan kebutuhan masa depan Anda.\r\n\r\n \r\n\r\n9. Catat keuangan bulanan\r\nPencatatan keuangan bulanan Anda akan membantu Anda mengevaluasi pengelolaan keuangan Anda. Anda akan mengetahui sektor mana saja yang masih bisa Anda hemat dan sektor mana yang lebih bisa Anda prioritaskan.\r\n\r\n \r\n\r\n10. Kendalikan diri\r\nPikiran dan psikologi Anda dalam mengelola uang sangatlah penting untuk diperhatikan. Ada banyak orang yang sangat boros ketika sedang mendapatkan banyak uang. Pada kasus seperti itu sebenarnya pikiran dan psikologi orang yang lebih berperan dalam mengelola keuangan.\r\n\r\nAnda harus bisa menahan diri mengendalikan berbagai keinginan Anda. Pahami lagi mengenai keinginan dan kebutuhan.\r\n\r\n \r\n\r\n11. Kunjungi konsultan keuangan\r\nSeperti yang sudah dikatakan di atas bahwa pengelolaan keuangan satu orang dengan orang lainnya berbeda-beda. Maka dari itu sebaiknya Anda berkonsultasi dengan seseorang yang lebih ahli. Pasalnya banyak faktor yang dapat mempengaruhi pengelolaan keuangan seseorang. Konsultan keuangan dapat memberikan saran-saran yang dapat memperbaiki pengelolaan uang Anda.???\r\n\r\n\r\n\r\nMengelola Keuangan Menurut Orang Sukses\r\nWarren Buffet yang merupakan pria paling kaya pada nomor tiga pada tahun 2015 mengatakan Anda harus menggunakan uang di bawah pendapatan yang Anda miliki. Jika Anda memiliki pengeluaran yang sama besar atau bahkan lebih besar dari gaji Anda maka keuangan Anda akan hancur cepat atau lambat. Anda tidak akan bisa mengalokasikan uang Anda untuk menabung, asuransi, atau bahkan investasi.\r\n\r\nJack Ma yang merupakan seorang pengusaha sukses mengatakan jika Anda harus merencanakan masa depan Anda dengan matang. Sukses yang diraih oleh Jack Ma merupakan sesuatu yang sudah direncanakannya sejak lama. Banyak orang yang terlalu fokus akan hari ini dan melupakan masa depan.\r\n\r\nCarlos Slim yang merupakan pengusaha besar asal Amerika Selatan berpendapat jika Anda harus berusaha mengembangkan atau menumbuhkan uang yang Anda miliki. Ada banyak orang yang memiliki tujuan untuk bisa hidup dari pertumbuhan uang yang Anda miliki saat ini.\r\n\r\nMemang uang bukanlah segalanya dalam hidup. Namun cara mengelola keuangan yang tepat akan membantu Anda untuk menata hidup lebih baik. Mengatur keuangan sejak dini akan membantu Anda menyiapkan segala sesuatunya di masa depan. Selain itu Anda juga bisa memastikan kehidupan Anda dapat berjalan dengan baik untuk dirimu, bahkan tidak hanya Anda sendiri tetapi juga orang terdekat.', 'tips2.jpg', 'https://www.modalrakyat.id/', '2020-12-02 15:50:31'),
(9, 'tips', '5 Tips Mengatur Keuangan yang Akan Membuat Anda Tidak Pernah Merasa Kehabisan Uang', 'Kebanyakan orang biasanya akan menghabiskan uang yang dihasilkan secara foya-foya pada masa awal bulan, dan mulai berhemat di saat akhir bulan.\r\n\r\nDi saat akhir bulan, pengeluaran akan berusaha sangat di hemat karena uang gaji yang diterima mungkin sudah habis saat berada di masa akhir bulan.\r\n\r\nApakah Anda mengalami hal yang sama? Jika ya, tentunya hal itu sangat tidak nyaman-kan? Anda harus menunggu sampai awal bulan jika ingin melakukan sesuatu, dengan alasan karena Anda tidak memiliki uang lagi.\r\n\r\nPastinya, Anda tentu tidak ingin terus-menerus merasakan hal seperti ini. Nah, untuk menghindari hal ini terjadi, berikut adalah 5 tips yang akan membuat Anda tidak pernah merasa kehabisan uang:\r\n\r\n1. Buatlah Budget Harian, Mingguan, atau Bulanan yang Akan Memberi Batasan Pada Pengeluaran Anda\r\n\r\n\r\n5 Tips Mengatur Keuangan yang Akan Membuat Anda Tidak Pernah Merasa Kehabisan Uang – Kebanyakan orang biasanya akan menghabiskan uang yang dihasilkan secara foya-foya pada masa awal bulan, dan mulai berhemat di saat akhir bulan.\r\n\r\nDi saat akhir bulan, pengeluaran akan berusaha sangat di hemat karena uang gaji yang diterima mungkin sudah habis saat berada di masa akhir bulan.\r\n\r\nBaca Juga: Tips Keuangan: Ikuti Tips Ini Demi Mempersiapkan dan Menghemat Biaya Pernikahan\r\n\r\nApakah Anda mengalami hal yang sama? Jika ya, tentunya hal itu sangat tidak nyaman-kan? Anda harus menunggu sampai awal bulan jika ingin melakukan sesuatu, dengan alasan karena Anda tidak memiliki uang lagi.\r\n\r\nPastinya, Anda tentu tidak ingin terus-menerus merasakan hal seperti ini. Nah, untuk menghindari hal ini terjadi, berikut adalah 5 tips yang akan membuat Anda tidak pernah merasa kehabisan uang:\r\n\r\nDaftar Isi [Tutup]\r\n\r\n1 5 Tips Mengatur Keuangan yang Akan Membuat Anda Tidak Pernah Merasa Kehabisan Uang\r\n1.1 1. Buatlah Budget Harian, Mingguan, atau Bulanan yang Akan Memberi Batasan Pada Pengeluaran Anda\r\n1.2 2. Berhematlah Dalam Urusan Makanan\r\n1.3 3. Manfaatkan Setiap Diskon dan Promo yang Ada\r\n1.4 4. Hindari Berbelanja Secara Berlebihan\r\n1.5 5. Cari Penghasilan Tambahan Untuk Menambah Pundi-Pundi Keuangan\r\n2 Simulasi Pendanaan KoinWorks\r\n2.1 Ketahui profil risiko investasi Anda\r\n2.2 Profil Risiko\r\n2.3 Jumlah dan Jangka Waktu Investasi\r\n2.4 Perkenalkan diri Anda\r\n2.5 Rekomendasi Diversifikasi\r\n2.5.1 Mulai Mendanai\r\n5 Tips Mengatur Keuangan yang Akan Membuat Anda Tidak Pernah Merasa Kehabisan Uang\r\n1. Buatlah Budget Harian, Mingguan, atau Bulanan yang Akan Memberi Batasan Pada Pengeluaran Anda\r\nMembuat Anggaran Untuk Beragam Kebutuhan Keuangan\r\nMeski hal ini terkesan simpel untuk dilakukan, namun pada kenyataannya tidak banyak orang yang sungguh-sungguh membuat budget untuk mengatur keuangannya secara lebih baik.\r\n\r\nCobalah untuk menerapkan hal ini untuk mengatur budget uang yang Anda keluarkan. Contohnya adalah jika Anda memiliki gaji Rp 6 juta, dan Anda ingin menabung sebesar Rp 2 juta setiap bulannya, maka Anda dapat menggunakan Rp 4juta lainnya untuk memenuhi biaya hidup, seperti:\r\n\r\nBiaya makan satu bulan: Rp 1juta\r\nBiaya pulsa internet: Rp 100ribu\r\nKebutuhan sehari-hari (pasta gigi, sabun muka, dan kebutuhan lainnya.): Rp 300ribu\r\nBensin: Rp 300ribu\r\nUang darurat: Rp 300ribu\r\nBayar Cicilan: Rp 2juta\r\nKalau sudah di-break down seperti ini, pastinya lebih mudah bukan mengatur aliran uang Anda?\r\n\r\n2. Berhematlah Dalam Urusan Makanan\r\n\r\nDi tengah kota metropolitan saat ini, banyak sekali terdapat restoran yang sangat menggoda untuk dikunjungi.\r\n\r\nApa saja yang Anda inginkan untuk dimakan, hampir dalam sekejap dapat ditemukan, mulai dari makanan bergaya kebaratan, asia, bahkan makanan khas Indonesia sekalipun.\r\n\r\nNamun, tentunya makanan yang Anda makan direstoran akan dengan cepat menguras kocek secara berlebih. Jika Anda tidak ingin kehabisan uang di saat tanggal tua, cobalah untuk mengontrol diri dalam memilih makanan yang dimakan.\r\n\r\nHal ini bukan berarti Anda tidak dapat makan di restoran loh! Ingat, Anda tetap dapat menikmati makanan di restoran, hanya saja Anda harus mengatur intensitasnya jika Anda memang merasa uang yang dimiliki ingin diporsikan untuk hal-hal yang lebih penting di masa depan.\r\n\r\n3. Manfaatkan Setiap Diskon dan Promo yang Ada\r\n\r\nDi tengah perkembangan bisnis yang pesat di masa ini, semua orang berlomba-lomba membuka bisnisnya.\r\n\r\nSemua bisnis berlomba-lomba untuk memberikan promo yang dapat menarik pelanggan lebih lagi. Nah, Anda sebagai konsumen dapat secara pintar dan bijak memanfaatkan kesempatan yang ada.\r\n\r\nManfaatkan setiap diskon yang diberikan oleh berbagai tipe produk. Untuk mengetahui produk apakah yang sedang dalam program diskon, Anda dapat mengunduh beberapa aplikasi seperti groupon, dealoka, atau aplikasi sejenis lainnya.\r\n\r\n4. Hindari Berbelanja Secara Berlebihan\r\n\r\nJika Anda tidak ingin bersedih ketika tanggal tua mulai datang, cobalah untuk mengontrol diri untuk tidak berbelanja secara berlebihan saat menerima gaji di awal bulan.\r\n\r\nPrioritaskan apa yang menjadi kebutuhan dan keinginan. Jika yang Anda beli hanya sekedar untuk memenuhi keinginan semata, maka jangan lakukan itu.\r\n\r\nMembuang uang untuk membeli suatu barang yang sesungguhnya tidak dibutuhkan bukanlah hal bijak yang dapat Anda lakukan.\r\n\r\nAda pepatah mengatakan bahwa “Apabila Anda membuang-buang uang untuk hal yang tidak diperlukan, maka Anda akan menjual barang yang Anda perlukan dikemudian hari. ”Bersikaplah bijaklah dalam berbelanja bila tak ingin kehabisan uang di akhir bulan.\r\n\r\n5. Cari Penghasilan Tambahan Untuk Menambah Pundi-Pundi Keuangan\r\n\r\nJika Anda ingin menikmati hidup, dan tidak ingin merasa kesusahan karena harus berhemat maka cara lain yang dapat Anda lakukan adalah dengan mencari penghasilan tambahan.\r\n\r\nSemakin besar penghasilan yang Anda dapatkan, semakin besar pula uang yang dapat Anda nikmati dalam memenuhi biaya hidup.\r\n\r\nUntuk mencari penghasilan tambahan, biasanya ada beberapa cara yang dapat dilakukan, mulai dari mencari pekerjaan tambahan, membuka bisnis, berjualan online, maupun berinvestasi.\r\n\r\nYa, dengan berinvestasi Anda secara tidak langsung akan mendapatkan penghasilan tambahan loh! Contohnya saja:\r\n\r\nDengan modal awal mulai dari Rp 100 ribu, Anda bisa mendapatkan bunga pengembalian efektif mulai dari 18% per tahun.', 'tips.jpg', 'https://koinworks.com/', '2020-12-02 16:00:59');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `jenis_transaksi` varchar(10) NOT NULL,
  `jumlah_transaksi` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `uang` int(11) NOT NULL DEFAULT 0,
  `password` text NOT NULL,
  `jenis_kelamin` varchar(10) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `informasi`
--
ALTER TABLE `informasi`
  ADD PRIMARY KEY (`id_informasi`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `informasi`
--
ALTER TABLE `informasi`
  MODIFY `id_informasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
