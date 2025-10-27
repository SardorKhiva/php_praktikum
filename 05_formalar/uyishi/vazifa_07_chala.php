<?php
if (isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === "POST") {
    $bytes = '';
    $kilobytes = '';
    $megabytes = '';
    $gigabytes = '';
    $terabytes = '';
    $ok = !empty($_POST['bytes']) ||
        !empty($_POST['kilobytes']) ||
        !empty($_POST['megabytes']) ||
        !empty($_POST['gigabytes']) ||
        !empty($_POST['terabytes']);

    switch ($ok) {
        case 'bytes':
        {
            if ($_POST['bytes'] > 0) {
                $bytes = doubleval(trim($_POST['bytes']));
                $kilobytes = $bytes / 1024;
                $megabytes = $bytes / 1024 / 1024;
                $gigabytes = $bytes / 1024 / 1024 / 1024;
                $terabytes = $bytes / 1024 / 1024 / 1024 / 1024;
            }
            break;
        }

        case 'kilobytes':
        {
            if ($_POST['kilobytes'] > 0) {
                $kilobytes = doubleval(trim($_POST['kilobytes']));
                $bytes = $kilobytes * 1024;
                $megabytes = $bytes / 1024 / 1024;
                $gigabytes = $bytes / 1024 / 1024 / 1024;
                $terabytes = $bytes / 1024 / 1024 / 1024 / 1024;
            }
            break;
        }

        case 'megabytes':
        {
            if ($_POST['megabytes'] > 0) {
                $megabytes = doubleval(trim($_POST['megabytes']));
                $bytes = $megabytes * 1024 * 1024;
                $kilobytes = $megabytes * 1024;
                $gigabytes = $megabytes / 1024 / 1024;
                $terabytes = $megabytes / 1024 / 1024 / 1024;
            }
            break;
        }

        case 'gigabytes':
        {
            if ($_POST['gigabytes'] > 0) {
                $gigabytes = doubleval(trim($_POST['gigabytes']));
                $bytes = $gigabytes * 1024 * 1024 * 1024;
                $kilobytes = $gigabytes * 1024 * 1024;
                $megabytes = $gigabytes * 1024;
                $terabytes = $gigabytes / 1024 / 1024 / 1024;
            }
            break;
        }

        case 'terabytes':
        {
            if ($_POST['terabytes'] > 0) {
                $terabytes = doubleval(trim($_POST['terabytes']));
                $bytes = $terabytes * 1024 * 1024 * 1024 * 1024;
                $kilobytes = $terabytes * 1024 * 1024 * 1024;
                $megabytes = $terabytes * 1024 * 1024;
                $gigabytes = $terabytes * 1024;
            }
            break;
        }

    }
}
?>

    <!DOCTYPE html>
    <html lang="uz">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Data Converter</title>
        <style>
            /* Sahifa stillari */
            body {
                font-family: Arial, sans-serif; /* Matn shrifti */
                margin: 0; /* marginlarni olib tashlash */
                padding: 0; /* paddinglarni olib tashlash */
                display: flex; /* Flexbox - mazmunni markazlashtirish */
                justify-content: center; /* Gorizontal bo'yicha markazlashtirish */
                align-items: center; /* Vertikal bo'yicha markazlashtirish */
                min-height: 100vh; /* Ekran balandligi */
                background: #1e90ff; /* Ko'k fon */
                color: #fff; /* oq rangli matn */
            }

            /* Barcha bloklar uchun konteyner */
            .converter-container {
                display: flex; /* Flexbox bloklarni qatorlarga to'g'irlash */
                gap: 20px; /* bloklar orasidagi masofa */
                justify-content: center;
                align-items: center;
                max-width: 100%;
                height: auto;
            }

            /*har bir alohida blok */
            .unit-block {
                background: #fff; /* oq fon */
                color: #333; /* qora matn */
                padding: 20px; /* ichki oraliq */
                border-radius: 10px; /* burchaklarni aylana qilish */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* blok uchun soya */
                text-align: center; /* matnni markazlashtirish */
                width: 150px; /* Ruxsat etilgan blok kengligi */
            }

            /* ma'lumot kiritish: */
            .unit-block input {
                display: block; /* blok element qilish */
                margin: 0 auto; /* kiritish maydonini markazlashtirish */
                width: 100%; /* butun enni olsin */
                padding: 10px; /* ichki oraliq */
                border: 1px solid #ddd; /* ochiq ramka */
                border-radius: 5px; /* burchaklarni aylanasimon qilish */
                font-size: 18px; /* matn hajmi */
                text-align: center; /* maydon ichidagi matnni markazlashtirish*/
                background: #f9f9f9; /* ochiq fon*/
                color: #333; /* qora rangli matn */
            }

            /* o'lchov birligi nishoni */
            .unit-block .unit-label {
                display: block; /* blok element */
                font-size: 16px; /* shrift hajmi */
                margin: 10px 0; /* tepadan va pasdan oraliq qoldirish */
                color: #666; /* kulrang matn */
            }

            /* tugmalar uchun konteyner */
            .button-group {
                display: flex; /* tugmalar uchun Flexbox  */
                justify-content: center; /* tugmalarni markazlashtirish */
                gap: 10px; /* tugmalar oarsidagi masofa */
            }

            /* tugmalar uchun stillar */
            .button-group button {
                background: #eee; /* yorqin fon */
                border: none; /* qolipni olib tashlash */
                border-radius: 5px; /* burchaklarni aylana qilish */
                padding: 10px 15px; /* ichki oraliq maydon */
                cursor: pointer; /* kursor borganda ko'rinishi o'zgarishi */
                font-size: 16px; /* matn o'lchovi */
                color: #333; /* qora matn */
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* tugmalar uchun soya */
                transition: background 0.3s; /* Fon rangining silliq o'zgarishi */
            }

            /* tugmalar uchun hover effekt */
            .button-group button:hover {
                background: #ddd; /* kursor yurigandagi orqa fon rangi */
            }
        </style>
    </head>
    <body>
    <!-- asosiy konteyner -->
    <form method="post">
        <div class="converter-container">
            <!-- "Bytes" konteyneri -->
            <div class="unit-block">
                <input type="number"
                       id="bytes"
                       name="bytes"
                       placeholder="0"
                       value="<?php echo number_format($bytes, 2, '.', ' '); ?>">
                <label for="bytes" class="unit-label">Bytes</label>
                <div class="button-group">
                    <button>→</button>
                </div>
            </div>

            <!-- "Kilobytes" bloki -->
            <div class="unit-block">
                <input type="number"
                       name="kilobytes"
                       placeholder="0"
                       value="<?php echo number_format($kilobytes, 2, '.', ' ') ?? ''; ?>">
                <span class="unit-label">Kilobytes</span>
                <div class="button-group">
                    <button>←</button>
                    <button>→</button>
                </div>
            </div>

            <!-- "Megabytes" -->
            <div class="unit-block">
                <input type="number"
                       name="megabytes"
                       placeholder="0"
                       value="<?php echo number_format($megabytes, 2, '.', ' ') ?? ''; ?>">
                <span class="unit-label">Megabytes</span>
                <div class="button-group">
                    <button>←</button>
                    <button>→</button>
                </div>
            </div>

            <!-- "Gigabytes" -->
            <div class="unit-block">
                <input type="number"
                       name="gigabytes"
                       placeholder="0"
                       value="<?php echo number_format($gigabytes, 2, '.', ' ') ?? ''; ?>">
                <span class="unit-label">Gigabytes</span>
                <div class="button-group">
                    <button>←</button>
                    <button>→</button>
                </div>
            </div>

            <!-- "Terabytes" -->
            <div class="unit-block">
                <input type="number"
                       name="terabytes"
                       placeholder="0"
                       value="<?php echo number_format($terabytes, 2, '.', ' ') ?? ''; ?>">
                <span class="unit-label">Terabytes</span>
                <div class="button-group">
                    <button>←</button>
                </div>
            </div>
        </div>
    </form>
    </body>
    </html>

<?php
//$bytes = $kilobytes = $megabytes = $gigabytes = $terabytes = 0;
?>