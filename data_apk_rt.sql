CREATE DATABASE Apk_RT;
USE Apk_RT;

CREATE TABLE tb_pengurus(
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama VARCHAR(225) NOT NULL,
jenis_kelamin ENUM("L","P"),
alamat VARCHAR(255),
jabatan ENUM("KETEUA RT","WAKIL RT","SEKRETARIS","BENDAHARA"),
email VARCHAR(64) NOT NULL,
no_hp VARCHAR(20)
)ENGINE=INNODB;

CREATE TABLE tb_kk(
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
kepala_keluarga VARCHAR(255) NOT NULL,
alamat VARCHAR(255),
rt VARCHAR(255),
jumlah_anggota VARCHAR(255) NOT NULL,
nik VARCHAR(20) NOT NULL,
agama ENUM("PROTESTAN","KATOLIK","ISLAM","HINDU","BUDHA","KONGHUCU"),
tb_pengurus_id INT UNSIGNED,
FOREIGN KEY(tb_pengurus_id) REFERENCES tb_pengurus(id) ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE tb_warga(
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
nik VARCHAR(20) NOT NULL,
nama VARCHAR(255) NOT NULL,
tempat_lahir VARCHAR(255),
tanggal_lahir DATE,
alamat VARCHAR(255),
tb_kk_id INT UNSIGNED,
FOREIGN KEY (tb_kk_id) REFERENCES tb_kk(id) ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE tb_uang_kas(
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
keterangan VARCHAR(255),
pemasukan DECIMAL(10,2) NOT NULL,
pengeluaran DECIMAL(10,2),
saldo_akhir DECIMAL(10,2) NOT NULL,
tgl_transaksi DATE,
tb_pengurus_id INT UNSIGNED,
tb_warga_id INT UNSIGNED,
FOREIGN KEY (tb_pengurus_id) REFERENCES tb_pengurus(id) ON UPDATE CASCADE,
FOREIGN KEY (tb_warga_id) REFERENCES tb_warga(id) ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE tb_pengumuman(
id_pengumuman INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
judul_pengumuman VARCHAR(255) NOT NULL,
isi_pengumuman VARCHAR(500),
tanggal DATE,
tb_pengurus_id INT UNSIGNED,
FOREIGN KEY (tb_pengurus_id) REFERENCES tb_pengurus(id) ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE tb_pengaduan(
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
nik VARCHAR(20) NOT NULL,
nama VARCHAR(255),
tanggal_pengaduan DATE,
deskripsi_pengaduan VARCHAR(500),
status_pengaduan VARCHAR(255),
tb_warga_id INT UNSIGNED,
FOREIGN KEY (tb_warga_id) REFERENCES tb_warga(id) ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE tb_calon(
id_calon INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama VARCHAR(255) NOT NULL,
no_kandidat VARCHAR(20),
visi_misi VARCHAR(500),
tb_warga_id INT UNSIGNED,
FOREIGN KEY (tb_warga_id) REFERENCES tb_warga(id) ON UPDATE CASCADE
)ENGINE=INNODB;

CREATE TABLE tb_voting(
id_voting INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
nama_pemilih VARCHAR(255) NOT NULL,
tanggal_mulai DATE,
tanggal_selesai DATE,
keterangan VARCHAR(255),
tb_calon_id_calon INT UNSIGNED,
tb_warga_id INT UNSIGNED,
FOREIGN KEY (tb_calon_id_calon) REFERENCES tb_calon(id_calon) ON UPDATE CASCADE,
FOREIGN KEY (tb_warga_id) REFERENCES tb_warga(id) ON UPDATE CASCADE
)ENGINE=INNODB;
