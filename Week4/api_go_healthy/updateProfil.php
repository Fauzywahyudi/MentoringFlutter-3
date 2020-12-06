<?php


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require 'koneksi.php';
    $response = array();
    $email = $_POST['email'];
    $nama = $_POST['nama'];
    $idUser = $_POST['idUser'];
    $jenisKelamin = $_POST['jenisKelamin'];
    $alamat = $_POST['alamat'];


    $queryCek = "SELECT * FROM `user` WHERE email='$email' AND id_user !='$idUser'";
    $queryUpdate = "UPDATE `user` SET `email`='$email',`nama_lengkap`='$nama',`jenis_kelamin`='$jenisKelamin',`alamat`='$alamat',update_at=NOW() WHERE id_user='$idUser'";

    $resultCek = $kon->query($queryCek);
    $dataCek = $resultCek->fetch_assoc();

    if (isset($dataCek)) {
        $response['value'] = 2;
        $response['message'] = "Email telah terdaftar";
        echo json_encode($response);
    } else {

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
    }
}
