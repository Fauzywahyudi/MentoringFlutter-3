<?php


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require 'koneksi.php';
    $response = array();
    $id = $_POST['id_user'];
    $id_transaksi = $_POST['id_transaksi'];
    $jumlah = $_POST['jumlah'];
    $jenis = $_POST['jenis'];
    $queryUpdate = '';


    $queryDelete = "DELETE FROM transaksi WHERE id_transaksi='$id_transaksi'";

    if ($jenis == 'in') {
        $queryUpdate  = "UPDATE `user` SET `uang`= uang - $jumlah WHERE id_user='$id'";
    } else {
        $queryUpdate  = "UPDATE `user` SET `uang`= uang + $jumlah WHERE id_user='$id'";
    }
    //delete
    $sqlDelete = $kon->query($queryDelete);
    //update
    $sqlUpdate = $kon->query($queryUpdate);

    if ($sqlUpdate &&  $sqlDelete) {
        $sql = $kon->query("SELECT * FROM user WHERE id_user='$id'");
        $data = $sql->fetch_assoc();
        $response['value'] = 1;
        $response['message'] = "Berhasil dihapus";
        $response['data'] = $data;
        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Gagal dihapus";
        echo json_encode($response);
    }
}
