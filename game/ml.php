<?php
session_start();
require "../aksi/koneksi.php";

if(!isset($_SESSION['login'])){
    $notlogin = true;
}


$result = mysqli_query($conn, "SELECT * FROM game where nama_game = 'mobile legend' ");

$valorant = [];

while ($row = mysqli_fetch_assoc($result)) {
    $valorant[] = $row;
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MOBILE LEGEND</title>
    <link rel="stylesheet" href="../style/game.css">
</head>

<body>
    <div class="fContainer">
        <nav class="wrapper">
            <div class="brand">
                <div class="firstname">PlayPoint</div>
                <div class="lastname">Store</div>
            </div>
            <ul class="navigation">
                <?php 
                    if(isset($notlogin)){
                        echo "<li><a href='regis.php'>Regis</a></li>";
                        echo "<li><a href='login.php'>Login</a></li>";
                    }
                    else{
                        echo "<li><a href='#'>".$_SESSION["username"]."</a></li>";
                        echo "<li><a href='keranjang.php'>Keranjang</a></li>";
                        echo "<li><a href='historyuser.php'>History User</a></li>";
                        echo "<li><a href='logout.php'>Logout</a></li>";
                    }
                ?>
            </ul>
        </nav>
    </div>
    <div class="container">
        <div class="content-left">
            <img src="https://cdn.oneesports.id/cdn-data/wp-content/uploads/sites/2/2020/08/MobileLegendsBangBang_MLBB_appstore_officialart-450x257.jpg" alt="">
            <h1>Mobile Legend</h1>
            <p>Harga sudah termasuk PPN</p><br>
            <p>PlayPoint Store telah bekerja sama dengan Moonton untuk menawarkan top up Diamond yang mudah, aman, dan nyaman.</p><br>
            <p>Beli ml Diamond hanya dalam hitungan detik! cukup pilih jumlah Diamond yang Kamu inginkan, Masukan Id, selesaikan pembayaran, dan Diamond tersebut akan langsung masuk ke akun ml Kamu.</p><br>
            <p>Unduh dan mainkan ml sekarang!</p> 
            <a href="../index.php">kembali</a>
        </div>
        <div class="content-right">
            <h2>Pilih Nominal Top Up</h2>
            <div class="main-content">
                <?php $i = 1;
                foreach ($valorant as $vlr) : ?>
                    <div id="<?= "element",$i ?>" class="custom-div">
                        <img src="https://cdn1.codashop.com/S/content/common/images/denom-image/MLBB/100x100/50orless_MLBB_Diamonds.png" alt="">
                        <h4><?= $vlr["produk"] ?></h4>
                        <p style="color: #999;">Rp. <?= $vlr["harga"] ?></p>
                        <?php
                        if (isset($notlogin)) { ?>
                            <a style="display: none;" href="../keranjang.php?id=<?=$vlr["id_game"];?>">Beli</a>
                        <?php 
                        } else{ ?>
                            <a class="pesan" href="../keranjang.php?id=<?=$vlr["id_game"];?>">Beli</a>
                        <?php } ?>
                    </div>
                    <?php $i++;
                endforeach; ?>
            </div>
        </div>
    </div>
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section about">
            <h2>About</h2>
            <p>Website ini menyediakan layanan top-up untuk berbagai game populer. Kami berkomitmen untuk memberikan pengalaman terbaik kepada para gamer dalam melakukan transaksi pembelian diamond, coin, dan item permainan lainnya.</p>
            <div class="contact">
                <span><i class="fas fa-phone"></i> 123-456-789</span>
                <span><i class="fas fa-envelope"></i> info@PlayPointStore.com</span>
            </div>
            </div>

            <div class="footer-section links">
            <h2>Quick Links</h2>
            <ul>
                <li><a href="#">Beranda</a></li>
                <li><a href="#">Permainan</a></li>
                <li><a href="#">Tentang Kami</a></li>
                <li><a href="#">Kontak</a></li>
                <li><a href="#">Kebijakan Privasi</a></li>
            </ul>
            </div>
        </div>

        <div class="footer-bottom">
            &copy; 2024 GameStore - All Rights Reserved
        </div>
    </footer>
</body>
</html>