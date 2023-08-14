<?php

/**
 * A classe 'controller' é responsável por fazer o carregamento das views, concebe paginação e verifica nível de usuário
 * 
 * @author Joab Torres <joabtorres1508@gmail.com>
 * @version 1.0
 * @copyright  (c) 2018, Joab Torres Alencar - Analista de Sistemas 
 * @access public
 * @package core
 * @example classe controller
 */
class controller
{

    /**
     * Está função verifica se a $_SESSION['usuario_sig_cootax'] está inicializada, caso esteja então verifica se o usuario tem permissao de acesso e sua conta esteja ativa.
     * @return int 
     * @access protected
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function checkUser()
    {
        if (isset($_SESSION['usuario_sig_cootax']) && is_array($_SESSION['usuario_sig_cootax']) && isset($_SESSION['usuario_sig_cootax']['statu'])) {
            if ($_SESSION['usuario_sig_cootax']['statu'] == 1) {
                return $_SESSION['usuario_sig_cootax']['nivel'];
            }
        } else {
            $url = BASE_URL . "/login";
            header("location: {$url}");
            return 0;
        }
    }

    /**
     * Está função é responsável para carrega uma view;
     * @param String viewName - nome da view;
     * @param array $viewData - Dados para serem carregados na view
     * @access public
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function loadView($viewName, $viewData = array())
    {
        extract($viewData);
        include 'views/' . $viewName . ".php";
    }

    /**
     * Está função é responsável para carrega um template estático, a onde ela chama chama uma função lo;
     * @param String viewName - nome da view;
     * @param array $viewData - Dados para serem carregados na view
     * @access public
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function loadTemplate($viewName, $viewData = array())
    {
        include 'views/_template.php';
    }

    /**
     * Está função é responsável para carrega uma view dinamica dentro de um template estático
     * @param String viewName - nome da view;
     * @param array $viewData - Dados para serem carregados na view
     * @access public
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    public function loadViewInTemplate($viewName, $viewData = array())
    {
        extract($viewData);
        include 'views/' . $viewName . ".php";
    }

    /**
     * Está função é responsável para converte uma data do padrão 'ano-mes-dia' para 'dia/mes/ano'
     * @param String $date - data solicitada pelo parametro
     * r
     * @access protected
     * @return $date - data formatada no padrão brasileiro
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function formatDateView($date)
    {
        $arrayDate = explode("-", $date);
        if (count($arrayDate) == 3) {
            return $arrayDate[2] . '/' . $arrayDate[1] . '/' . $arrayDate[0];
        } else {
            return false;
        }
    }

    /**
     * Está função é responsável para converte uma data do padrão 'dia/mes/ano' para 'ano-mes-dia'
     * @param String $date - data solicitada pelo parametro
     * r
     * @access protected
     * @return $date - data formatada no padrão banco MySQL
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function formatDateBD($date)
    {
        $arrayDate = explode("/", $date);
        if (count($arrayDate) == 3) {
            return $arrayDate[2] . '-' . $arrayDate[1] . '-' . $arrayDate[0];
        } else {
            return false;
        }
    }

    /**
     * Está função é responsável para converte um double do tipo (9999.99) em (R$ 9.999,99)
     * @param double $valor - valor double do banco
     * @access protected
     * @return String $reais - valor formatado padrão R$
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function formatDinheiroView($valor)
    {
        return 'R$ ' . number_format($valor, 2, ',', '.');
    }

    /**
     * Está função é responsável para converte um double do tipo  (R$ 9.999,99) em (99999.99)
     * @param String $valor - Valor em reais
     * @access protected
     * @return double $valor - valor formatado padrão Mysql
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function formatDinheiroBD($valor)
    {
        if (strstr($valor, '.', true)) {
            return str_replace(',', '.', str_replace('.', '', str_replace('R$ ', '', strval($valor))));
        } else {
            return str_replace(',', '.', str_replace('R$ ', '', strval($valor)));
        }
    }
    /**
     * Está função é responsável para converte uma data do padrão 'ano-mes-dia' para 'dia de mes de ano'
     * @param string  $date - data solicitada pelo parametro
     * r
     * @access protected
     * @return null|string $resultado - retorna a data dia de mês de ano 15 de agosto de 2019
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function formatDateViewComplete(string $date): ?string
    {
        $arrayDate = explode("-", $date);
        if (count($arrayDate) == 3) {
            return $arrayDate[2] . ' de ' . $this->getMes($arrayDate[1]) . ' de ' . $arrayDate[0];
        } else {
            return null;
        }
    }

    /**
     * Está função é responsável para retorna o nome do més
     * @param string $mes = mês selecionado
     * @access protected
     * @return null|string $resultado
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function getMes(string $mes): ?string
    {
        $array = array('janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setemmbro', 'outubro', 'novembro', 'dezembro');
        $resultado = null;
        for ($i = 0; $i < count($array); $i++) {
            if (($i + 1) == $mes) {
                $resultado = $array[$i];
            }
        }
        return $resultado;
    }
    /**
     * Resonsavel por retorna o endereço completo
     *
     * @param array $endereco
     * @return string
     */
    protected function endereco(array $endereco): string
    {
        $endrecoCompleto = "";
        if (!empty($endereco["logradouro"])) {
            $endrecoCompleto .= $endereco['logradouro'];
        }

        if (!empty($endereco["numero"])) {
            $endrecoCompleto .= ", Nº {$endereco['numero']}";
        }
        if (!empty($endereco["bairro"])) {
            $endrecoCompleto .= ", Bairro {$endereco['bairro']}";
        }
        if (!empty($endereco["complemento"])) {
            $endrecoCompleto .= ", Complemento {$endereco['complemento']}";
        }
        if (!empty($endereco["cidade"])) {
            $endrecoCompleto .= " - {$endereco['cidade']}";
        }
        if (!empty($endereco["estado"])) {
            $endrecoCompleto .= "/{$endereco['estado']}";
        }
        if (!empty($endereco["cep"])) {
            $endrecoCompleto .= ", CEP: {$endereco['cep']}";
        }
        return $endrecoCompleto;
    }

    /**
     * Está função é responsável para retornar codigo da cooperativa;
     * @access protected
     * @author Joab Torres <joabtorres1508@gmail.com>
     */
    protected function getCodCooperativa()
    {
        if (isset($_SESSION['usuario_sig_cootax']) && !empty($_SESSION['usuario_sig_cootax']['cod_cooperativa'])) {
            return $_SESSION['usuario_sig_cootax']['cod_cooperativa'];
        } else {
            return 0;
        }
    }

    protected function checkFinancaAtual()
    {
        $financa = array();
        $crudModel = new crud_db();
        if (empty($_SESSION['financa_atual'])) {
            $financa['lucro'] = $crudModel->read('SELECT SUM(valor) as valor FROM sig_lucro WHERE data BETWEEN "' . date('o-m-01') . '" AND "' . date('o-m-31') . '"');
            $financa['lucro'] = $financa['lucro'][0];
            $financa['despesa'] = $crudModel->read('SELECT SUM(valor) as valor FROM sig_despesa WHERE data BETWEEN "' . date('o-m-01') . '" AND "' . date('o-m-31') . '"');
            $financa['despesa'] = $financa['despesa'][0];
            $financa['investimento'] = $crudModel->read('SELECT SUM(valor) as valor FROM sig_investimento WHERE data BETWEEN "' . date('o-m-01') . '" AND "' . date('o-m-31') . '"');
            $financa['investimento'] = $financa['investimento'][0];
            $_SESSION['financa_atual'] = $financa;
        }
        return $_SESSION['financa_atual'];
    }

    protected function checkStatusCooperado()
    {
        $cooperado = array();
        $cooperadoModel = new crud_db();
        if (empty($_SESSION['cooperado_status'])) {
            $cooperado['ativo'] = $cooperadoModel->read("SELECT COUNT(*) as qtd FROM sig_cooperado WHERE status=1");
            $cooperado['ativo'] = $cooperado['ativo'][0]['qtd'];
            $cooperado['inativo'] = $cooperadoModel->read("SELECT COUNT(*) as qtd FROM sig_cooperado WHERE status=0");
            $cooperado['inativo'] = $cooperado['inativo'][0]['qtd'];
            $_SESSION['cooperado_status'] = $cooperado;
        }
        return $_SESSION['cooperado_status'];
    }

    protected function checkCategoriaCooperado()
    {
        $cooperado = array();
        $cooperadoModel = new crud_db();
        if (empty($_SESSION['cooperado_categoria'])) {
            $cooperado['permissionario'] = $cooperadoModel->read("SELECT COUNT(*) as qtd FROM sig_cooperado WHERE tipo='Permissionário'");
            $cooperado['permissionario'] = $cooperado['permissionario'][0]['qtd'];
            $cooperado['auxiliar'] = $cooperadoModel->read("SELECT COUNT(*) as qtd FROM sig_cooperado WHERE tipo='Auxiliar'");
            $cooperado['auxiliar'] = $cooperado['auxiliar'][0]['qtd'];
            $cooperado['externo'] = $cooperadoModel->read("SELECT COUNT(*) as qtd FROM sig_cooperado WHERE tipo='Externo'");
            $cooperado['externo'] = $cooperado['externo'][0]['qtd'];
            $_SESSION['cooperado_categoria'] = $cooperado;
        }
        return $_SESSION['cooperado_categoria'];
    }
}
