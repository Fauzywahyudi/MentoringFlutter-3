<?php


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require 'koneksi.php';
    $response = array();
    $id = $_POST['id_user'];
    $jumlah = $_POST['jumlah'];
    $jenis = $_POST['jenis'];
    $deskripsi = $_POST['deskripsi'];
    $queryUpdate = '';


    $queryInsert = "INSERT INTO `transaksi`(`id_user`, `jenis_transaksi`, `jumlah_transaksi`, `deskripsi`) VALUES ('$id','$jenis','$jumlah','$deskripsi')";
    if ($jenis == 'in') {
        $queryUpdate = "UPDATE `user` SET `uang`= uang + $jumlah WHERE id_user='$id'";
    } else {
        $queryUpdate = "UPDATE `user` SET `uang`= uang - $jumlah WHERE id_user='$id'";
    }
    $sqlInsert = $kon->query($queryInsert);
    $sqlUpdate = $kon->query($queryUpdate);

    if ($sqlInsert && $sqlUpdate) {
        $sql = $kon->query("SELECT * FROM user WHERE id_user='$id'");
        $data = $sql->fetch_assoc();
        $response['value'] = 1;
        $response['message'] = "Berhasil ditambahkan";
        $response['data'] = $data;
        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Gagal ditambahkan";
        echo json_encode($response);
    }
}
