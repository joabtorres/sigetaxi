<?php

function create_image($user, $url)
{
    $fontname = array('ubuntu_regular' => 'assets/fonts/ubuntu-regular.ttf');
    $i = 30;
    $quality = 1000;
    $largura = 1500;
    $altura = 2119;
    $height = 0;
    $file = "uploads/operacao/carteira_temp.jpg";
    $imagemOriginal = 'assets/imagens/carteira_empresa.jpg';
    $imagemCooperado = $url;

    // if the file already exists dont create it again just serve up the original	
    if (file_exists($file)) {
        unlink($file);
    }
    // define the base image that we lay our text on

    list($larguraOriginal, $alturaOriginal) = getimagesize($imagemOriginal);
    list($larguraCooperado, $alturaCooperado) = getimagesize($imagemCooperado);

    $ratio = $larguraOriginal / $alturaOriginal;

    if ($largura / $altura > $ratio) {
        $largura = $altura * $ratio;
    } else {
        $altura = $largura / $ratio;
    }
    $imagemFinal = imagecreatetruecolor($largura, $altura);
    $im = imagecreatefromjpeg($imagemOriginal);
    $imagem_cooperado = imagecreatefromjpeg($imagemCooperado);

    // setup the text colours
    $color['black'] = imagecolorallocate($im, 0, 0, 0);

    // this defines the starting height for the text block
    $y = imagesy($im) - $height - 1360;

    foreach ($user as $value) {
        imagettftext($im, $value['font-size'], 0, $value['x'], $value['y'], $color[$value['color']], $fontname[$value['font-family']], $value['text']);
    }
    // create the image
    imagecopyresampled($imagemFinal, $im, 0, 0, 0, 0, $largura, $altura, $larguraOriginal, $alturaOriginal);
    imagecopyresampled($imagemFinal, $imagem_cooperado, 38, 260, 0, 0, 327, 430, $larguraCooperado, $alturaCooperado);
    imagejpeg($imagemFinal, $file, $quality);

    return $file;
}

function center_text($string, $font_size, $fontname)
{


    $image_width = 1100;
    $dimensions = imagettfbbox($font_size, 0, $fontname, $string);

    return ceil(($image_width - $dimensions[4]) / 2);
}

$user = array(
    array(
        'text' => $empresa['nome_siglas'] . ' - ' . $empresa['nome_completo'],
        'font-size' => '22',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 300,
        'y' => 80
    ),
    array(
        'text' => $empresa['endereco'] . ' - CEP: ' . $empresa['cep'],
        'font-size' => '20',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 300,
        'y' => 120
    ),
    array(
        'text' => (!empty($empresa['url_site']) ? $empresa['url_site'] . ' | ' : "") . (!empty($empresa['email']) ? "E-mail: " . $empresa['email']  : "") . (!empty($empresa['cnpj']) ? ' | CNPJ: ' . $empresa['cnpj']  : ""),
        'font-size' => '18',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 300,
        'y' => 160
    ),
    array(
        'text' => $cooperado['nome_completo'],
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 560,
        'y' => 410
    ),
    array(
        'text' => $cooperado['cnh'],
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 560,
        'y' => 560
    ),
    array(
        'text' => $cooperado['cat'],
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 1270,
        'y' => 560
    ), array(
        'text' => $cooperado['cpf'],
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 560,
        'y' => 720
    ),
    array(
        'text' => str_pad(strval($cooperado['cod_cooperado']), 5, '0', STR_PAD_LEFT),
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 1270,
        'y' => 720
    ), array(
        'text' => $cooperado['rg'],
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 560,
        'y' => 870
    ),
    array(
        'text' => !empty($cooperado['data_inscricao']) ? $this->formatDateView($cooperado['data_inscricao']) : '',
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 1270,
        'y' => 870
    ), array(
        'text' => $cooperado['tipo'],
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 100,
        'y' => 1080
    ), array(
        'text' => $cooperado['genero'],
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 700,
        'y' => 1080
    ), array(
        'text' => $cooperado['nacionalidade'],
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 1340,
        'y' => 1080
    ),
    array(
        'text' => $cooperado['pai'],
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 100,
        'y' => 1230
    ), array(
        'text' => $cooperado['mae'],
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 100,
        'y' => 1370
    ), array(
        'text' => !empty($cooperado['data_inicial']) ? $this->formatDateView($cooperado['data_inicial']) : '',
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 100,
        'y' => 1530
    ),
    array(
        'text' => !empty($cooperado['data_validade']) ? $this->formatDateView($cooperado['data_validade']) : '',
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 1070,
        'y' => 1530
    )
);
// run the script to create the image
$imagem = !empty($cooperado['imagem']) ? $cooperado['imagem'] : 'assets/imagens/foto_ilustrato3x4.jpg';
$filename = create_image($user, $imagem);
ob_start();
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Carteira</title>
</head>

<body>
    <img src='<?= "{$filename}" ?>' style="display:  block; margin: 3px auto; width: 310px;" />
</body>

</html>

<?php
$html = ob_get_contents();
ob_end_clean();
$mpdf = new \Mpdf\Mpdf(['mode' => 'utf-8']);
$mpdf->WriteHTML($html);
$mpdf->Output();
?>