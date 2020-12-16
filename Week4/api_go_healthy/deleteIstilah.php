<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $data = array();
    $id = $_POST['id'];
    $query = "DELETE FROM `istilah` WHERE id_istilah='$id'";

    $result = $kon->query($query);

    if ($result) {
        $response['value'] = 1;
        $response['message'] = "Hapus data Berhasil";
        $response['data'] = $data;
        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Hapus data Gagal";
        echo json_encode($response);
    }
}
