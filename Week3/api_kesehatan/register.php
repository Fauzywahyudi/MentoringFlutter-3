<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $username = $_POST['username'];
    $pass = md5($_POST['password']);
    $nama = $_POST['nama'];

    $sql = $kon->query("SELECT * FROM user WHERE username='$username'");
    $resultCek = $sql->fetch_array();

    if (isset($resultCek)) {
        $response['value'] = 2;
        $response['message'] = "username telah terdaftar";
        echo json_encode($response);
    } else {
        $sql = $kon->query("INSERT INTO `user`(`username`, `password`, `nama_lengkap`) VALUES ('$username','$pass','$nama')");

        if ($sql) {
            $response['value'] = 1;
            $response['message'] = "Berhasil didaftarkan";
            echo json_encode($response);
        } else {
            $response['value'] = 0;
            $response['message'] = "Gagal didaftarkan";
            echo json_encode($response);
        }
    }
}
