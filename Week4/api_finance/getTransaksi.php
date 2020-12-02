<?php


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require 'koneksi.php';
    $response = array();
    $data = array();
    $tipe = $_POST['tipe'];
    $query = '';

    if ($tipe == 'all') {
        $query = getAll();
    } else {
        $query = byDate($tipe);
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

function byDate($tipe)
{
    $id_user = $_POST['id_user'];
    $value = $_POST['value'];
    $day = formatDate($value, 'day');
    $month = formatDate($value, 'month');
    $year = formatDate($value, 'year');
    $query = '';
    if ($tipe == 'today') {
        $query = "SELECT * FROM transaksi WHERE id_user='$id_user' AND day(create_at)='$day' AND month(create_at)='$month' AND year(create_at)='$year' ORDER BY create_at DESC";
    } else if ($tipe == 'month') {
        $query = "SELECT * FROM transaksi WHERE id_user='$id_user' AND month(create_at)='$month' AND year(create_at)='$year' ORDER BY create_at DESC";
    } else {
        $query = "SELECT * FROM transaksi WHERE id_user='$id_user' AND year(create_at)='$year' ORDER BY create_at DESC";
    }
    return $query;
}

function formatDate($value, $jenis)
{
    if ($jenis == 'day') {
        $result = substr($value, 8, 2);
        return $result;
    } else if ($jenis == 'month') {
        $result = substr($value, 5, 2);
        return $result;
    } else {
        $result = substr($value, 0, 4);
        return $result;
    }
}
