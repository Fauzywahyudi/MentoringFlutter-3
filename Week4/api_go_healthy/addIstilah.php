<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $data = array();
    $istilah = $_POST['istilah'];
    $penjelasan = $_POST['penjelasan'];
    $query = "INSERT INTO `istilah`( `nama_istilah`, `penjelasan`) VALUES ('$istilah','$penjelasan')";

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
