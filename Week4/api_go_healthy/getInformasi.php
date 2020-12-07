<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $data = array();
    $id = $_POST['id_tips'];
    $query = "SELECT * FROM informasi WHERE id_tips='$id'";

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
