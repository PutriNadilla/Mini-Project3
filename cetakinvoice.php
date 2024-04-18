<?php
session_start();
require "./aksi/koneksi.php";

if(!isset($_SESSION['login'])){
    header('Location: login.php');
    exit;
}

$id_pembayaran = $_GET['id'];

// Query untuk mendapatkan data pembayaran berdasarkan id_pembayaran
$query = "SELECT * FROM pembayaran WHERE id_pembayaran = '$id_pembayaran'";
$result = mysqli_query($conn, $query);
$pembayaran = mysqli_fetch_assoc($result);

// Query untuk mendapatkan data user berdasarkan id_user
$id_user = $pembayaran['id_user'];
$query_user = "SELECT * FROM user WHERE id_user = '$id_user'";
$result_user = mysqli_query($conn, $query_user);
$user = mysqli_fetch_assoc($result_user);

// Query untuk mendapatkan data game berdasarkan id_game
$id_game = $pembayaran['id_game'];
$query_game = "SELECT * FROM game WHERE id_game = '$id_game'";
$result_game = mysqli_query($conn, $query_game);
$game = mysqli_fetch_assoc($result_game);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice Pembayaran</title>
    <link rel="stylesheet" href="./style/cetakinvoice.css">
</head>
<body>
    <div class="invoice-container">
        <h2>Invoice Pembayaran</h2>
        <div class="invoice-details">
            <p><strong>Nomor Invoice:</strong> <?= $pembayaran['id_pembayaran'] ?></p>
            <p><strong>Tanggal Pembayaran:</strong> <?= $pembayaran['tanggal_bayar'] ?></p>
            <p><strong>Nama Pelanggan:</strong> <?= $user['username'] ?></p>
            <p><strong>ID Game Pelanggan:</strong> <?= $pembayaran['gameid'] ?></p>
            <p><strong>Top Up Game:</strong> <?= $game['nama_game'] ?></p>
            <p><strong>Produk:</strong> <?= $game['produk'] ?></p>
            <p><strong>Harga:</strong> <?= $game['harga'] ?></p>
            <p><strong>Jumlah:</strong> <?= $pembayaran['jumlah'] ?></p>
            <p><strong>Total Pembayaran:</strong> <?= $pembayaran['total'] ?></p>
        </div>
    </div>

    <div class="button-container">
        <a href="historyuser.php" class="button">Kembali ke History User</a>
    </div>
</body>
</html>

