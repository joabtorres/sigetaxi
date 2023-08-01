<?php

function create_image($user)
{
    $fontname = array('ubuntu_regular' => 'assets/fonts/ubuntu-regular.ttf');
    $i = 30;
    $quality = 100;
    $largura = 1500;
    $altura = 849;
    $height = 0;
    $file = "uploads/operacao/recibo_taxi_temp.jpg";
    $imagemOriginal = 'assets/imagens/recibo_taxi.jpg';

    // if the file already exists dont create it again just serve up the original	
    if (file_exists($file)) {
        unlink($file);
    }
    // define the base image that we lay our text on

    list($larguraOriginal, $alturaOriginal) = getimagesize($imagemOriginal);
    $ratio = $larguraOriginal / $alturaOriginal;

    if ($largura / $altura > $ratio) {
        $largura = $altura * $ratio;
    } else {
        $altura = $largura / $ratio;
    }
    $imagemFinal = imagecreatetruecolor($largura, $altura);
    $im = imagecreatefromjpeg($imagemOriginal);

    // setup the text colours
    $color['black'] = imagecolorallocate($im, 0, 0, 0);

    // this defines the starting height for the text block
    $y = imagesy($im) - $height - 565;

    foreach ($user as $value) {
        imagettftext($im, $value['font-size'], 0, $value['x'], $value['y'], $color[$value['color']], $fontname[$value['font-family']], $value['name']);
    }
    // create the image
    imagecopyresampled($imagemFinal, $im, 0, 0, 0, 0, $largura, $altura, $larguraOriginal, $alturaOriginal);
    imagejpeg($imagemFinal, $file, $quality);

    return $file;
}

$user = array(
    array(
        'name' => $cidade['nome_siglas'] . ' - ' . $cidade['nome_completo'],
        'font-size' => '22',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 250,
        'y' => 70
    ),
    array(
        'name' => $cidade['endereco'] . ' - CEP: ' . $cidade['cep'],
        'font-size' => '18',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 250,
        'y' => 100
    ),
    array(
        'name' => (!empty($cidade['url_site']) ?  $cidade['url_site'] . ' | ' : "") . $cidade['email'] . ' | CNPJ ' . $cidade['cnpj'],
        'font-size' => '18',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 250,
        'y' => 130

    ),
    array(
        'name' => $cooperado['nome_completo'],
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 500,
        'y' => 750,
    ),
    array(
        'name' => strtoupper($cooperado['placa']),
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 420,
        'y' => 838,
    ),
    array(
        'name' =>  strtoupper($cooperado['nz']),
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 880,
        'y' => 838,
    ), array(
        'name' => $cooperado['celular_1'],
        'font-size' => '30',
        'color' => 'black',
        'font-family' => 'ubuntu_regular',
        'x' => 1500,
        'y' => 838,
    )
);
// run the script to create the image
$filename = create_image($user);

ob_start();
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Recibo de Táxi</title>
</head>

<body>
    <img src="<?=  $filename; ?>" style="border: 2px solid #ccc; display:  block; margin: 3px auto; width: 550px;" />
    <img src="<?= $filename; ?>" style="border: 2px solid #ccc; display:  block; margin: 3px auto; width: 550px;" />
    <img src="<?= $filename; ?>" style="border: 2px solid #ccc; display:  block; margin: 3px auto; width: 550px;" />
</body>

</html>


<?php
$html = ob_get_contents();
ob_end_clean();
$mpdf = new \Mpdf\Mpdf(['mode' => 'utf-8']);
$mpdf->WriteHTML($html);
$mpdf->Output();
?>