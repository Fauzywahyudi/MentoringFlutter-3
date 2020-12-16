<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $data = array();
    $id = $_POST['id'];
    $judul = $_POST['judul'];
    $penulis = $_POST['penulis'];
    $sumber = $_POST['sumber'];
    $isi = $_POST['isi'];
    $image = $_POST['image'];
    $query = "UPDATE `berita` SET `judul`='$judul',`isi_berita`='$isi',`penulis`='$penulis',`sumber`='$sumber',`image`='$image' WHERE id_berita='$id'";

    $result = $kon->query($query);

    if ($result) {
        $response['value'] = 1;
        $response['message'] = "Edit data Berhasil";
        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Edit data Gagal";
        echo json_encode($response);
    }
}
