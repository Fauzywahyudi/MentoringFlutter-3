<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $data = array();
    $tipe = $_POST['tipe'];
    $query = "";

    if ($tipe == 'all') {
        $query = "SELECT id_informasi, judul, jenis,image,sumber,create_at FROM informasi";
    } else if ($tipe == 'byid') {
        $id = $_POST['id'];
        $query = "SELECT penjelasan FROM informasi WHERE id_informasi='" . $id . "'";
    } else {
        $query = "SELECT id_informasi, judul, jenis, image,sumber,create_at FROM informasi WHERE jenis='$tipe'";
    }
    $result = $kon->query($query);
    while ($fetchData = $result->fetch_assoc()) {
        $data[] = $fetchData;
    }

    if ($result) {
        $response['value'] = 1;
        $response['message'] = "Load Berhasil";
        $response['data'] = $data;
        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Load Gagal";
        echo json_encode($response);
    }
}
