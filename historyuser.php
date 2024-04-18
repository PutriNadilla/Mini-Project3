<?php
session_start();
require "./aksi/koneksi.php";

// Fungsi untuk mendapatkan riwayat pembayaran
function getPaymentHistory($conn, $username, $keyword = null) {
    if($username == "admin"){
        if(isset($keyword)){
            $query = "SELECT * FROM pembayaran pbr
                JOIN user usr ON pbr.id_user = usr.id_user
                JOIN game gm ON pbr.id_game = gm.id_game
                WHERE usr.username LIKE '%$keyword%'";
        } else {
            $query = "SELECT * FROM pembayaran pbr
                JOIN user usr ON pbr.id_user = usr.id_user
                JOIN game gm ON pbr.id_game = gm.id_game
                ORDER BY pbr.id_game";
        }
    } else {
        if(isset($keyword)){
            $query = "SELECT * FROM pembayaran pbr
                JOIN user usr ON pbr.id_user = usr.id_user
                JOIN game gm ON pbr.id_game = gm.id_game
                WHERE gm.nama_game LIKE '%$keyword%' AND usr.username = '$username'";
        } else {
            $query = "SELECT * FROM pembayaran pbr
                JOIN user usr ON pbr.id_user = usr.id_user
                JOIN game gm ON pbr.id_game = gm.id_game
                WHERE usr.username = '$username'";
        }
    }

    $result = mysqli_query($conn, $query);
    $history = [];

    while ($row = mysqli_fetch_assoc($result)) {
        $history[] = $row;
    }

    return $history;
}

$username = isset($_SESSION['username']) ? $_SESSION['username'] : null;
$history = [];

// Memeriksa jika pengguna masuk atau sebagai admin
if(isset($_SESSION['login'])){
    if($_SESSION['username'] == "admin"){
        $username = $_SESSION['username'];
        $history = getPaymentHistory($conn, $username, isset($_GET['keyword']) ? $_GET['keyword'] : null);
    } else {
        $username = $_SESSION['username'];
        $history = getPaymentHistory($conn, $username, isset($_GET['keyword']) ? $_GET['keyword'] : null);
    }
} else {
    header('Location: login.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./style/formadmin.css">
    <title>History Pemesanan</title>
</head>

<body>
    <div class="fContainer">
        <nav class="wrapper">
            <a href="index.php">
                <div class="brand">
                    <div class="firstname">PlayPoint</div>
                    <div class="lastname">Store</div>
                </div>
            </a>
            <?php if(isset($_SESSION['login'])) : ?>
                <?php if($_SESSION['username'] == "admin") : ?>
                    <ul class="navigation">
                        <li><a href="formadmin.php">Menu</a></li>
                        <li><a href="historyuser.php">History User</a></li>
                        <li><a href="logout.php">Logout</a></li>
                    </ul>
                <?php else: ?>
                    <ul class="navigation">
                        <li><a href="#"><?php echo $_SESSION["username"]; ?></a></li>
                        <li><a href="index.php">Main Content</a></li>
                        <li><a href="keranjang.php">Keranjang</a></li>
                        <li><a href="historyuser.php">History User</a></li>
                        <li><a href="logout.php">Logout</a></li>
                    </ul>
                <?php endif; ?>
            <?php else : ?>
                <ul class="navigation">
                    <li><a href="regis.php">Regis</a></li>
                    <li><a href="login.php">Login</a></li>
                </ul>
            <?php endif; ?>
        </nav>
    </div>

    <h1>Riwayat Pemesanan</h1>
    <form action="" method="get">
        <input type="text" name="keyword" id="">
    </form>
    <table border="1">
        <tr>
            <th>No</th>
            <th>Username</th>
            <th>Nama Game</th>
            <th>Produk</th>
            <th>Jumlah</th>
            <th>Total</th>
            <th>Game ID</th>
            <th>Tanggal Pembayaran</th>
            <th>Email</th>
            <th>Aksi</th>
        </tr>
        <?php $i = 1;
        foreach ($history as $htr) : ?>
            <tr>
                <td><?= $i; ?> </td>
                <td><?php echo $htr["username"] ?> </td>
                <td><?= $htr["nama_game"] ?></td>
                <td><?php echo $htr["produk"] ?></td>
                <td><?php echo $htr["jumlah"] ?></td>
                <td><?php echo $htr["total"] ?></td>
                <td><?= $htr["gameid"] ?></td>
                <td><?= $htr["tanggal_bayar"] ?></td>
                <td><?= $htr["email"] ?> </td>
                <td>
                    <div class="print-button-container">
                        <a href="cetakinvoice.php?id=<?= $htr['id_pembayaran'] ?>" class="print-button">
                            <span>Cetak Invoice</span>
                        </a>
                    </div>
                </td>
            </tr>
            <?php $i++;
        endforeach; ?>
    </table>

</body>
</html>
