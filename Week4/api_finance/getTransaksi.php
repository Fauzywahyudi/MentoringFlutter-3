<?php


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require 'koneksi.php';
    $response = array();
    $data = array();
    $tipe = $_POST['tipe'];
    $query = '';

    if ($tipe == 'all') {
        $query = getAll();
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

    // $fo = fopen("myjson.json", "w");

    // //write the json string in file
    // $fr = fwrite($fo, $json);
}

function getAll()
{
    $id_user = $_POST['id_user'];
    $query = "SELECT * FROM transaksi WHERE id_user='$id_user' ORDER BY create_at DESC";
    return $query;
}
