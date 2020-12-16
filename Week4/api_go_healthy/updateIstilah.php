<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $data = array();
    $istilah = $_POST['istilah'];
    $id = $_POST['id'];
    $penjelasan = $_POST['penjelasan'];
    $query = "UPDATE `istilah` SET `nama_istilah`='$istilah',`penjelasan`='$penjelasan' WHERE id_istilah='$id'";

    $result = $kon->query($query);

    if ($result) {
        $response['value'] = 1;
        $response['message'] = "Edit data Berhasil";
        $response['data'] = $data;
        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Edit data Gagal";
        echo json_encode($response);
    }
}
