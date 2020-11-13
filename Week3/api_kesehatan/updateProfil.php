<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $data = array();
    $id_user = $_POST['id_user'];
    $nama = $_POST['nama'];
    $alamat = $_POST['alamat'];
    $jk = $_POST['jk'];

    $sql = $kon->query("UPDATE `user` SET`nama_lengkap`='$nama',`jk`='$jk',`alamat`='$alamat' WHERE id_user='$id_user'");
    $sqlGet = $kon->query("SELECT * FROM user WHERE id_user='$id_user'");
    $result = $sqlGet->fetch_array();
    if ($sql && $sqlGet) {
        $response['value'] = 1;
        $response['message'] = "Berhasil load data";
        $response['data'] = $result;
        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Gagal load data";
        echo json_encode($response);
    }
}
