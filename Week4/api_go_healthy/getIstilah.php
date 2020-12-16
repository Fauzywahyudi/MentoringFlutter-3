<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $data = array();
    $keyword = $_POST['keyword'];
    $sql = '';

    if (empty($keyword)) {
        $sql = $kon->query("SELECT * FROM `istilah` ORDER BY nama_istilah ASC");
    } else {
        $sql = $kon->query("SELECT * FROM `istilah` WHERE nama_istilah LIKE '%$keyword%' ORDER BY nama_istilah ASC");
    }

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
