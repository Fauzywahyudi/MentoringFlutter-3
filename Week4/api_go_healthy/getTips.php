<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $response = array();
    $data = array();
    $query = "SELECT * FROM tips";

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
