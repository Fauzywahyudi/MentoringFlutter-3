<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $data = array();
    $judul = $_POST['judul'];
    $isi = $_POST['isi'];
    $penulis = $_POST['penulis'];
    $sumber = $_POST['sumber'];
    $image = $_POST['image'];
    $query = "INSERT INTO `berita`( `judul`, `isi_berita`, `penulis`, `sumber`, `image`) VALUES ('$judul','$isi','$penulis','$sumber','$image')";

    $result = $kon->query($query);

    if ($result) {
        $response['value'] = 1;
        $response['message'] = "Tambah data Berhasil";
        $response['data'] = $data;
        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Tambah data Gagal";
        echo json_encode($response);
    }
}
