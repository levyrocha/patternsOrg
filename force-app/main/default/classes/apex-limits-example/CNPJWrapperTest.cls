@IsTest
public class CNPJWrapperTest {
	
	static testMethod void testParse() {
		String json = '{'+
		'  \"cnpj_raiz\": \"text\",'+
		'  \"razao_social\": \"text\",'+
		'  \"capital_social\": \"text\",'+
		'  \"responsavel_federativo\": \"text\",'+
		'  \"atualizado_em\": \"2025-07-16T01:14:37.949Z\",'+
		'  \"porte\": {'+
		'    \"id\": \"text\",'+
		'    \"descricao\": \"text\"'+
		'  },'+
		'  \"natureza_juridica\": {'+
		'    \"id\": \"text\",'+
		'    \"descricao\": \"text\"'+
		'  },'+
		'  \"qualificacao_do_responsavel\": {'+
		'    \"id\": 1,'+
		'    \"descricao\": \"text\"'+
		'  },'+
		'  \"socios\": ['+
		'    {'+
		'      \"cpf_cnpj_socio\": \"text\",'+
		'      \"nome\": \"text\",'+
		'      \"tipo\": \"text\",'+
		'      \"data_entrada\": \"2025-07-16\",'+
		'      \"cpf_representante_legal\": \"text\",'+
		'      \"nome_representante\": \"text\",'+
		'      \"faixa_etaria\": \"text\",'+
		'      \"atualizado_em\": \"2025-07-16T01:14:37.949Z\",'+
		'      \"pais_id\": \"text\",'+
		'      \"qualificacao_socio\": {'+
		'        \"id\": 1,'+
		'        \"descricao\": \"text\"'+
		'      },'+
		'      \"qualificacao_representante\": \"text\",'+
		'      \"pais\": {'+
		'        \"id\": \"text\",'+
		'        \"iso2\": \"text\",'+
		'        \"iso3\": \"text\",'+
		'        \"nome\": \"text\",'+
		'        \"comex_id\": \"text\"'+
		'      }'+
		'    }'+
		'  ],'+
		'  \"simples\": {'+
		'    \"simples\": \"text\",'+
		'    \"data_opcao_simples\": \"2025-07-16\",'+
		'    \"data_exclusao_simples\": \"2025-07-16\",'+
		'    \"mei\": \"text\",'+
		'    \"data_opcao_mei\": \"2025-07-16\",'+
		'    \"data_exclusao_mei\": \"2025-07-16\",'+
		'    \"atualizado_em\": \"2025-07-16T01:14:37.949Z\"'+
		'  },'+
		'  \"estabelecimento\": {'+
		'    \"cnpj\": \"text\",'+
		'    \"atividades_secundarias\": ['+
		'      {'+
		'        \"id\": \"text\",'+
		'        \"secao\": \"text\",'+
		'        \"divisao\": \"text\",'+
		'        \"grupo\": \"text\",'+
		'        \"classe\": \"text\",'+
		'        \"subclasse\": \"text\",'+
		'        \"descricao\": \"text\"'+
		'      }'+
		'    ],'+
		'    \"cnpj_raiz\": \"text\",'+
		'    \"cnpj_ordem\": \"text\",'+
		'    \"cnpj_digito_verificador\": \"text\",'+
		'    \"tipo\": \"text\",'+
		'    \"nome_fantasia\": \"text\",'+
		'    \"situacao_cadastral\": \"text\",'+
		'    \"data_situacao_cadastral\": \"2025-07-16\",'+
		'    \"data_inicio_atividade\": \"2025-07-16\",'+
		'    \"nome_cidade_exterior\": \"text\",'+
		'    \"tipo_logradouro\": \"text\",'+
		'    \"logradouro\": \"text\",'+
		'    \"numero\": \"text\",'+
		'    \"complemento\": \"text\",'+
		'    \"bairro\": \"text\",'+
		'    \"cep\": \"text\",'+
		'    \"ddd1\": \"text\",'+
		'    \"telefone1\": \"text\",'+
		'    \"ddd2\": \"text\",'+
		'    \"telefone2\": \"text\",'+
		'    \"ddd_fax\": \"text\",'+
		'    \"fax\": \"text\",'+
		'    \"email\": \"text\",'+
		'    \"situacao_especial\": \"text\",'+
		'    \"data_situacao_especial\": \"2025-07-16\",'+
		'    \"atualizado_em\": \"2025-07-16T01:14:37.949Z\",'+
		'    \"atividade_principal\": {'+
		'      \"id\": \"text\",'+
		'      \"secao\": \"text\",'+
		'      \"divisao\": \"text\",'+
		'      \"grupo\": \"text\",'+
		'      \"classe\": \"text\",'+
		'      \"subclasse\": \"text\",'+
		'      \"descricao\": \"text\"'+
		'    },'+
		'    \"pais\": {'+
		'      \"id\": \"text\",'+
		'      \"iso2\": \"text\",'+
		'      \"iso3\": \"text\",'+
		'      \"nome\": \"text\",'+
		'      \"comex_id\": \"text\"'+
		'    },'+
		'    \"estado\": {'+
		'      \"id\": 1,'+
		'      \"nome\": \"text\",'+
		'      \"sigla\": \"text\",'+
		'      \"ibge_id\": 1'+
		'    },'+
		'    \"cidade\": {'+
		'      \"id\": 1,'+
		'      \"nome\": \"text\",'+
		'      \"ibge_id\": 1,'+
		'      \"siafi_id\": \"text\"'+
		'    },'+
		'    \"motivo_situacao_cadastral\": \"text\",'+
		'    \"inscricoes_estaduais\": ['+
		'      {'+
		'        \"inscricao_estadual\": \"text\",'+
		'        \"ativo\": true,'+
		'        \"atualizado_em\": \"2025-07-16T01:14:37.949Z\",'+
		'        \"estado\": {'+
		'          \"id\": 1,'+
		'          \"nome\": \"text\",'+
		'          \"sigla\": \"text\",'+
		'          \"ibge_id\": 1'+
		'        }'+
		'      }'+
		'    ]'+
		'  }'+
		'}';
		CNPJWrapper r = CNPJWrapper.fromJson(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CNPJWrapper.Estabelecimento objEstabelecimento = new CNPJWrapper.Estabelecimento(System.JSON.createParser(json));
		System.assert(objEstabelecimento != null);
		System.assert(objEstabelecimento.cnpj == null);
		System.assert(objEstabelecimento.atividades_secundarias == null);
		System.assert(objEstabelecimento.cnpj_raiz == null);
		System.assert(objEstabelecimento.cnpj_ordem == null);
		System.assert(objEstabelecimento.cnpj_digito_verificador == null);
		System.assert(objEstabelecimento.tipo == null);
		System.assert(objEstabelecimento.nome_fantasia == null);
		System.assert(objEstabelecimento.situacao_cadastral == null);
		System.assert(objEstabelecimento.data_situacao_cadastral == null);
		System.assert(objEstabelecimento.data_inicio_atividade == null);
		System.assert(objEstabelecimento.nome_cidade_exterior == null);
		System.assert(objEstabelecimento.tipo_logradouro == null);
		System.assert(objEstabelecimento.logradouro == null);
		System.assert(objEstabelecimento.numero == null);
		System.assert(objEstabelecimento.complemento == null);
		System.assert(objEstabelecimento.bairro == null);
		System.assert(objEstabelecimento.cep == null);
		System.assert(objEstabelecimento.ddd1 == null);
		System.assert(objEstabelecimento.telefone1 == null);
		System.assert(objEstabelecimento.ddd2 == null);
		System.assert(objEstabelecimento.telefone2 == null);
		System.assert(objEstabelecimento.ddd_fax == null);
		System.assert(objEstabelecimento.fax == null);
		System.assert(objEstabelecimento.email == null);
		System.assert(objEstabelecimento.situacao_especial == null);
		System.assert(objEstabelecimento.data_situacao_especial == null);
		System.assert(objEstabelecimento.atualizado_em == null);
		System.assert(objEstabelecimento.atividade_principal == null);
		System.assert(objEstabelecimento.pais == null);
		System.assert(objEstabelecimento.estado == null);
		System.assert(objEstabelecimento.cidade == null);
		System.assert(objEstabelecimento.motivo_situacao_cadastral == null);
		System.assert(objEstabelecimento.inscricoes_estaduais == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CNPJWrapper.Qualificacao_do_responsavel objQualificacao_do_responsavel = new CNPJWrapper.Qualificacao_do_responsavel(System.JSON.createParser(json));
		System.assert(objQualificacao_do_responsavel != null);
		System.assert(objQualificacao_do_responsavel.id == null);
		System.assert(objQualificacao_do_responsavel.descricao == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CNPJWrapper.Simples objSimples = new CNPJWrapper.Simples(System.JSON.createParser(json));
		System.assert(objSimples != null);
		System.assert(objSimples.simples == null);
		System.assert(objSimples.data_opcao_simples == null);
		System.assert(objSimples.data_exclusao_simples == null);
		System.assert(objSimples.mei == null);
		System.assert(objSimples.data_opcao_mei == null);
		System.assert(objSimples.data_exclusao_mei == null);
		System.assert(objSimples.atualizado_em == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CNPJWrapper objCNPJWrapper = new CNPJWrapper(System.JSON.createParser(json));
		System.assert(objCNPJWrapper != null);
		System.assert(objCNPJWrapper.cnpj_raiz == null);
		System.assert(objCNPJWrapper.razao_social == null);
		System.assert(objCNPJWrapper.capital_social == null);
		System.assert(objCNPJWrapper.responsavel_federativo == null);
		System.assert(objCNPJWrapper.atualizado_em == null);
		System.assert(objCNPJWrapper.porte == null);
		System.assert(objCNPJWrapper.natureza_juridica == null);
		System.assert(objCNPJWrapper.qualificacao_do_responsavel == null);
		System.assert(objCNPJWrapper.socios == null);
		System.assert(objCNPJWrapper.simples == null);
		System.assert(objCNPJWrapper.estabelecimento == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CNPJWrapper.Socios objSocios = new CNPJWrapper.Socios(System.JSON.createParser(json));
		System.assert(objSocios != null);
		System.assert(objSocios.cpf_cnpj_socio == null);
		System.assert(objSocios.nome == null);
		System.assert(objSocios.tipo == null);
		System.assert(objSocios.data_entrada == null);
		System.assert(objSocios.cpf_representante_legal == null);
		System.assert(objSocios.nome_representante == null);
		System.assert(objSocios.faixa_etaria == null);
		System.assert(objSocios.atualizado_em == null);
		System.assert(objSocios.pais_id == null);
		System.assert(objSocios.qualificacao_socio == null);
		System.assert(objSocios.qualificacao_representante == null);
		System.assert(objSocios.pais == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CNPJWrapper.Atividades_secundarias objAtividades_secundarias = new CNPJWrapper.Atividades_secundarias(System.JSON.createParser(json));
		System.assert(objAtividades_secundarias != null);
		System.assert(objAtividades_secundarias.id == null);
		System.assert(objAtividades_secundarias.secao == null);
		System.assert(objAtividades_secundarias.divisao == null);
		System.assert(objAtividades_secundarias.grupo == null);
		System.assert(objAtividades_secundarias.classe == null);
		System.assert(objAtividades_secundarias.subclasse == null);
		System.assert(objAtividades_secundarias.descricao == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CNPJWrapper.Pais objPais = new CNPJWrapper.Pais(System.JSON.createParser(json));
		System.assert(objPais != null);
		System.assert(objPais.id == null);
		System.assert(objPais.iso2 == null);
		System.assert(objPais.iso3 == null);
		System.assert(objPais.nome == null);
		System.assert(objPais.comex_id == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CNPJWrapper.Inscricoes_estaduais objInscricoes_estaduais = new CNPJWrapper.Inscricoes_estaduais(System.JSON.createParser(json));
		System.assert(objInscricoes_estaduais != null);
		System.assert(objInscricoes_estaduais.inscricao_estadual == null);
		System.assert(objInscricoes_estaduais.ativo == null);
		System.assert(objInscricoes_estaduais.atualizado_em == null);
		System.assert(objInscricoes_estaduais.estado == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CNPJWrapper.Porte objPorte = new CNPJWrapper.Porte(System.JSON.createParser(json));
		System.assert(objPorte != null);
		System.assert(objPorte.id == null);
		System.assert(objPorte.descricao == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CNPJWrapper.Estado objEstado = new CNPJWrapper.Estado(System.JSON.createParser(json));
		System.assert(objEstado != null);
		System.assert(objEstado.id == null);
		System.assert(objEstado.nome == null);
		System.assert(objEstado.sigla == null);
		System.assert(objEstado.ibge_id == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		CNPJWrapper.Cidade objCidade = new CNPJWrapper.Cidade(System.JSON.createParser(json));
		System.assert(objCidade != null);
		System.assert(objCidade.id == null);
		System.assert(objCidade.nome == null);
		System.assert(objCidade.ibge_id == null);
		System.assert(objCidade.siafi_id == null);
	}
}