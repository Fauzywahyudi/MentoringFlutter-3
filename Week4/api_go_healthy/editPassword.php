<?php


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require 'koneksi.php';
    $response = array();
    $password = md5($_POST['password']);
    $passwordNew = md5($_POST['passwordNew']);
    $idUser = $_POST['idUser'];

    $queryCek = "SELECT * FROM `user` WHERE password='$password' AND id_user ='$idUser'";
    $queryUpdate = "UPDATE `user` SET `password`='$passwordNew',update_at=NOW() WHERE id_user='$idUser'";

    $resultCek = $kon->query($queryCek);
    $dataCek = $resultCek->fetch_assoc();

    if (isset($dataCek)) {
        $sqlUpdate = $kon->query($queryUpdate);
        $queryGet = "SELECT * FROM user WHERE id_user='$idUser'";

        $sqlGet = $kon->query($queryGet);

        $resultGet = $sqlGet->fetch_assoc();

        if ($sqlUpdate && $sqlGet) {
            $response['value'] = 1;
            $response['message'] = "Berhasil diupdate";
            $response['data'] = $resultGet;
            echo json_encode($response);
        } else {
            $response['value'] = 0;
            $response['message'] = "Gagal diupdate";
            echo json_encode($response);
        }
    } else {
        $response['value'] = 0;
        $response['message'] = "Password tidak sama";
        echo json_encode($response);
    }
}
