<?php
ob_start()
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/gif" href="<?php echo BASE_URL ?>/assets/imagens/icon.png" sizes="32x32" />
    <meta property="ogg:title" content="<?= SITE_NAME ?>">
    <meta property="ogg:description" content="<?= SITE_NAME ?>">
    <title> <?= SITE_NAME ?></title>
    <link media="print" rel="stylesheet" href="<?php echo BASE_URL ?>/assets/css/relatorio_pdf.css">
</head>

<body>
    <div id="header">
        <table width="100%">
            <tr>
                <td Align="center"><img src="<?= "assets/imagens/logo-relatorio.png" ?>" style="display: block; width: 3cm" /></td>
            </tr>
            <tr>
                <td Align="center">
                    <h4> <?= !empty($empresa['nome_siglas']) ? "{$empresa['nome_siglas']} - " : ""; ?> <?= $empresa['nome_completo'] ?> </h4>
                    <p style="font-size: 8pt;">
                        <?php echo $empresa['endereco'] ?> - CEP: <?php echo $empresa['cep'] ?><br />
                        Contato: <?php echo $empresa['telefone'] ?> | <?php echo $empresa['email'] ?> <br />
                        CNPJ <?php echo $empresa['cnpj'] ?>
                    </p>
                </td>
            </tr>
            <tr>
                <td>
                    <hr>
                </td>
            </tr>
        </table>
    </div>
    <mains>
        <table width="100%">
            <tr>
                <td Align="center">
                    <br>
                    <h2>DECLARAÇÃO DE CONFORMIDADE</h2>
                    <br>
                    <br>
                </td>
            </tr>
            <tr>
                <td Align="justify">
                    <p>
                        Declaramos para os devindos fins que o Sr(a): <b><?= $socio['nome_completo'] ?></b>, condutor(a) autônomo(a) portador(a) do número RG: <b><?= $socio['rg'] ?></b>, CPF: <b><?= $socio['cpf'] ?></b> e domiciliado(a) na <b><?= $socio['endereco'] ?></b>, é um membro associado nesta entidade, trabalha como taxista permissionário e está em dias com suas obrigações conforme informações prestadas nesta entidade.
                    </p>
                </td>
            </tr>
            <tr>
                <td Align="justify">
                    <br />
                    <p>
                        <b>OBS:</b> <i>
                            proprietário com veículo acima do ano autorizado à exercer atividade de motorista de taxi, cabe ao órgão fiscalizador do Município se deve ou não fazer a liberação de alvará.
                        </i>
                    </p>
                </td>
            </tr>
            <tr>
                <td Align="right">
                    <br />
                    <p>
                        Itaituba/PA, <?= $this->formatDateViewComplete(date("Y-m-d", time())) ?>.
                    </p>
                    <br />
                </td>
            </tr>
            <tr>
                <td Align="right">
                    <br />
                    <p>
                        <u>(Valida por trinta dias)</u>
                    </p>
                </td>
            </tr>
            <tr>
                <td Align="center">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    _______________________________________________ <br />
                    <b><?= $empresa['nome_presidente'] ?></b> <br />
                    PRESIDENTE
                </td>
            </tr>
        </table>
    </mains>
</body>

</html>
<?php
$html = ob_get_contents();
ob_end_clean();
$mpdf = new \Mpdf\Mpdf(['mode' => 'utf-8']);
$mpdf->WriteHTML($html);
$arquivo = 'ficha_do_servidor_' . md5(time()) . '.pdf';
$mpdf->Output($arquivo, 'I');
?>