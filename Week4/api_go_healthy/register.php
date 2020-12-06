<?php


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require 'koneksi.php';
    $response = array();
    $email = $_POST['email'];
    $pass = md5($_POST['password']);
    $nama = $_POST['nama'];


    $queryCek = "SELECT * FROM `user` WHERE email='$email'";
    $queryInsert = "INSERT INTO `user`(`email`, `nama_lengkap`, `password`) VALUES ('$email','$nama','$pass')";

    $resultCek = $kon->query($queryCek);
    $dataCek = $resultCek->fetch_assoc();

    if (isset($dataCek)) {
        $response['value'] = 2;
        $response['message'] = "Email telah terdaftar";
        echo json_encode($response);
    } else {
        $sqlInsert = $kon->query($queryInsert);

        if ($sqlInsert) {
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
