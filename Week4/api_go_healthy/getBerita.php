<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $response = array();
    $data = array();

    $sql = $kon->query("SELECT * FROM berita ORDER BY posted_at DESC");
    while ($fetchData = $sql->fetch_assoc()) {
        $data[] = $fetchData;
    }
    if ($sql) {
        $response['value'] = 1;
        $response['message'] = "Berhasil load data";
        $response['data'] = $data;
        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Gagal load data";
        echo json_encode($response);
    }
}
