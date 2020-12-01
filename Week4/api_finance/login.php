<?php
require 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $email = $_POST['email'];
    $pass = md5($_POST['password']);

    $queryCek = "SELECT * FROM user WHERE email='$email' AND password='$pass'";

    $sqlCek = $kon->query($queryCek);

    $resultCek = $sqlCek->fetch_assoc();

    if (isset($resultCek)) {
        $response['value'] = 1;
        $response['message'] = "Login berhasil";
        $response['data'] = $resultCek;
        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Email atau Password Salah";
        echo json_encode($response);
    }
}
