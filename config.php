<?php

/*
 * config.php  - Este arquivo contem informações referente a: Conexão com banco de dados e URL Pádrão
 */


/*
 * Environment.php - define o ambiente que desejo acessa
 * 	development - desenvolvimento
 * 	prodution - repositório web
 */
define("ENVIRONMENT", "development");
define("SITE_NAME", "SIGETAXI - Sistema de Informação de Gerencial de Empresa de Taxi");

$config = array();
if (ENVIRONMENT == 'development') {
    //Raiz
    define("BASE_URL", "https://localhost/sigetaxi");
    //Nome do banco
    $config['dbname'] = 'sigtaxi';
    //host
    $config['host'] = 'localhost';
    //usuario
    $config['dbuser'] = 'root';
    //senha
    $config['dbpass'] = '';
} else {
    //Raiz
    define("BASE_URL", "https://sig.cootax.com.br");
    //Nome do banco
    $config['dbname'] = 'BANCO_DE_DADOS';
    //host
    $config['host'] = 'localhost';
    //usuario
    $config['dbuser'] = 'USUARIO_MYSQL';
    //senha
    $config['dbpass'] = 'SENHA_DO_USUÁRIO';
}
