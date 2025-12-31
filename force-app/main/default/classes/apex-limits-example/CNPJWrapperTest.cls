@IsTest
public class CNPJWrapperTest {

    @IsTest
    static void testCNPJWrapper() {

		String payload = '{' +
		'    "cnpj_raiz": "text",' +
		'    "razao_social": "text",' +
		'    "capital_social": "text",' +
		'    "responsavel_federativo": "text",' +
		'    "atualizado_em": "2025-07-16T01:14:37.949Z",' +
		'    "porte": {' +
		'        "id": "text",' +
		'        "descricao": "text"' +
		'    },' +
		'    "natureza_juridica": {' +
		'        "id": "text",' +
		'        "descricao": "text"' +
		'    },' +
		'    "qualificacao_do_responsavel": {' +
		'        "id": 1,' +
		'        "descricao": "text"' +
		'    },' +
		'    "socios": [{' +
		'        "cpf_cnpj_socio": "text",' +
		'        "nome": "text",' +
		'        "tipo": "text",' +
		'        "data_entrada": "2025-07-16",' +
		'        "cpf_representante_legal": "text",' +
		'        "nome_representante": "text",' +
		'        "faixa_etaria": "text",' +
		'        "atualizado_em": "2025-07-16T01:14:37.949Z",' +
		'        "pais_id": "text",' +
		'        "qualificacao_socio": {' +
		'            "id": 1,' +
		'            "descricao": "text"' +
		'        },' +
		'        "qualificacao_representante": "text",' +
		'        "pais": {' +
		'            "id": "text",' +
		'            "iso2": "text",' +
		'            "iso3": "text",' +
		'            "nome": "text",' +
		'            "comex_id": "text"' +
		'        }' +
		'    }],' +
		'    "simples": {' +
		'        "simples": "text",' +
		'        "data_opcao_simples": "2025-07-16",' +
		'        "data_exclusao_simples": "2025-07-16",' +
		'        "mei": "text",' +
		'        "data_opcao_mei": "2025-07-16",' +
		'        "data_exclusao_mei": "2025-07-16",' +
		'        "atualizado_em": "2025-07-16T01:14:37.949Z"' +
		'    },' +
		'    "estabelecimento": {' +
		'        "cnpj": "text",' +
		'        "cnpj_raiz": "text",' +
		'        "cnpj_ordem": "text",' +
		'        "cnpj_digito_verificador": "text",' +
		'        "tipo": "text",' +
		'        "nome_fantasia": "text",' +
		'        "situacao_cadastral": "text",' +
		'        "data_situacao_cadastral": "2025-07-16",' +
		'        "data_inicio_atividade": "2025-07-16",' +
		'        "nome_cidade_exterior": "text",' +
		'        "tipo_logradouro": "text",' +
		'        "logradouro": "text",' +
		'        "numero": "text",' +
		'        "complemento": "text",' +
		'        "bairro": "text",' +
		'        "cep": "text",' +
		'        "ddd1": "text",' +
		'        "telefone1": "text",' +
		'        "ddd2": "text",' +
		'        "telefone2": "text",' +
		'        "ddd_fax": "text",' +
		'        "fax": "text",' +
		'        "email": "text",' +
		'        "situacao_especial": "text",' +
		'        "data_situacao_especial": "2025-07-16",' +
		'        "atualizado_em": "2025-07-16T01:14:37.949Z",' +
		'        "atividade_principal": {' +
		'            "id": "text",' +
		'            "secao": "text",' +
		'            "divisao": "text",' +
		'            "grupo": "text",' +
		'            "classe": "text",' +
		'            "subclasse": "text",' +
		'            "descricao": "text"' +
		'        },' +
		'        "atividades_secundarias": [{' +
		'            "id": "text",' +
		'            "secao": "text",' +
		'            "divisao": "text",' +
		'            "grupo": "text",' +
		'            "classe": "text",' +
		'            "subclasse": "text",' +
		'            "descricao": "text"' +
		'        }],' +
		'        "pais": {' +
		'            "id": "text",' +
		'            "iso2": "text",' +
		'            "iso3": "text",' +
		'            "nome": "text",' +
		'            "comex_id": "text"' +
		'        },' +
		'        "estado": {' +
		'            "id": 1,' +
		'            "nome": "text",' +
		'            "sigla": "text",' +
		'            "ibge_id": 1' +
		'        },' +
		'        "cidade": {' +
		'            "id": 1,' +
		'            "nome": "text",' +
		'            "ibge_id": 1,' +
		'            "siafi_id": "text"' +
		'        },' +
		'        "motivo_situacao_cadastral": "text",' +
		'        "inscricoes_estaduais": [{' +
		'            "inscricao_estadual": "text",' +
		'            "ativo": true,' +
		'            "atualizado_em": "2025-07-16T01:14:37.949Z",' +
		'            "estado": {' +
		'                "id": 1,' +
		'                "nome": "text",' +
		'                "sigla": "text",' +
		'                "ibge_id": 1' +
		'            }' +
		'        }]' +
		'    }' +
		'}';

        CNPJWrapper cnpjWrapper = CNPJWrapper.fromJson(payload);

        Assert.areEqual('text', cnpjWrapper.cnpj_raiz);
        Assert.areEqual('text', cnpjWrapper.razao_social);
        Assert.areEqual('text', cnpjWrapper.capital_social);
        Assert.areEqual('text', cnpjWrapper.responsavel_federativo);
        Assert.areEqual('2025-07-16T01:14:37.949Z', cnpjWrapper.atualizado_em);
        
        Assert.areEqual('text', cnpjWrapper.porte.id);
        Assert.areEqual('text', cnpjWrapper.porte.descricao);
        
        Assert.areEqual('text', cnpjWrapper.natureza_juridica.id);
        Assert.areEqual('text', cnpjWrapper.natureza_juridica.descricao);

        Assert.areEqual(1, cnpjWrapper.qualificacao_do_responsavel.id);
        Assert.areEqual('text', cnpjWrapper.qualificacao_do_responsavel.descricao);
        
        Assert.areEqual('text', cnpjWrapper.socios[0].cpf_cnpj_socio);
        Assert.areEqual('text', cnpjWrapper.socios[0].nome);
        Assert.areEqual('text', cnpjWrapper.socios[0].tipo);
        Assert.areEqual('2025-07-16', cnpjWrapper.socios[0].data_entrada);
        Assert.areEqual('text', cnpjWrapper.socios[0].cpf_representante_legal);
        Assert.areEqual('text', cnpjWrapper.socios[0].nome_representante);
        Assert.areEqual('text', cnpjWrapper.socios[0].faixa_etaria);
        Assert.areEqual('2025-07-16T01:14:37.949Z', cnpjWrapper.socios[0].atualizado_em);
        Assert.areEqual('text', cnpjWrapper.socios[0].pais_id);
        Assert.areEqual(1, cnpjWrapper.socios[0].qualificacao_socio.id);
        Assert.areEqual('text', cnpjWrapper.socios[0].qualificacao_socio.descricao);
        Assert.areEqual('text', cnpjWrapper.socios[0].qualificacao_representante);
        Assert.areEqual('text', cnpjWrapper.socios[0].pais.id);
        Assert.areEqual('text', cnpjWrapper.socios[0].pais.iso2);
        Assert.areEqual('text', cnpjWrapper.socios[0].pais.iso3);
        Assert.areEqual('text', cnpjWrapper.socios[0].pais.nome);
        Assert.areEqual('text', cnpjWrapper.socios[0].pais.comex_id);

        Assert.areEqual('text', cnpjWrapper.simples.simples);
        Assert.areEqual('2025-07-16', cnpjWrapper.simples.data_opcao_simples);
        Assert.areEqual('2025-07-16', cnpjWrapper.simples.data_exclusao_simples);
        Assert.areEqual('text', cnpjWrapper.simples.mei);
        Assert.areEqual('2025-07-16', cnpjWrapper.simples.data_opcao_mei);
        Assert.areEqual('2025-07-16', cnpjWrapper.simples.data_exclusao_mei);
        Assert.areEqual('2025-07-16T01:14:37.949Z', cnpjWrapper.simples.atualizado_em);

        Assert.areEqual('text', cnpjWrapper.estabelecimento.cnpj);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.cnpj_raiz);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.cnpj_ordem);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.cnpj_digito_verificador);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.tipo);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.nome_fantasia);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.situacao_cadastral);
        Assert.areEqual('2025-07-16', cnpjWrapper.estabelecimento.data_situacao_cadastral);
        Assert.areEqual('2025-07-16', cnpjWrapper.estabelecimento.data_inicio_atividade);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.nome_cidade_exterior);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.tipo_logradouro);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.logradouro);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.numero);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.complemento);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.bairro);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.cep);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.ddd1);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.telefone1);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.ddd2);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.telefone2);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.ddd_fax);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.fax);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.email);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.situacao_especial);
        Assert.areEqual('2025-07-16', cnpjWrapper.estabelecimento.data_situacao_especial);
        Assert.areEqual('2025-07-16T01:14:37.949Z', cnpjWrapper.estabelecimento.atualizado_em);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.motivo_situacao_cadastral);

        Assert.areEqual('text', cnpjWrapper.estabelecimento.atividade_principal.id);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.atividade_principal.descricao);

		Assert.areEqual('text', cnpjWrapper.estabelecimento.atividades_secundarias[0].id);
		Assert.areEqual('text', cnpjWrapper.estabelecimento.atividades_secundarias[0].secao);
		Assert.areEqual('text', cnpjWrapper.estabelecimento.atividades_secundarias[0].divisao);
		Assert.areEqual('text', cnpjWrapper.estabelecimento.atividades_secundarias[0].grupo);
		Assert.areEqual('text', cnpjWrapper.estabelecimento.atividades_secundarias[0].classe);
		Assert.areEqual('text', cnpjWrapper.estabelecimento.atividades_secundarias[0].subclasse);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.atividades_secundarias[0].descricao);

        Assert.areEqual('text', cnpjWrapper.estabelecimento.pais.nome);

        Assert.areEqual(1, cnpjWrapper.estabelecimento.estado.id);
		Assert.areEqual('text', cnpjWrapper.estabelecimento.estado.nome);
		Assert.areEqual('text', cnpjWrapper.estabelecimento.estado.sigla );
		Assert.areEqual(1, cnpjWrapper.estabelecimento.estado.ibge_id);

        Assert.areEqual(1, cnpjWrapper.estabelecimento.cidade.id);
		Assert.areEqual('text', cnpjWrapper.estabelecimento.cidade.nome);
		Assert.areEqual('text', cnpjWrapper.estabelecimento.cidade.ibge_id);
		Assert.areEqual(1, cnpjWrapper.estabelecimento.cidade.siafi_id);

        Assert.areEqual('text', cnpjWrapper.estabelecimento.inscricoes_estaduais[0].inscricao_estadual);
        Assert.areEqual(true, cnpjWrapper.estabelecimento.inscricoes_estaduais[0].ativo);
        Assert.areEqual('2025-07-16T01:14:37.949Z', cnpjWrapper.estabelecimento.inscricoes_estaduais[0].atualizado_em);
        Assert.areEqual('text', cnpjWrapper.estabelecimento.inscricoes_estaduais[0].estado.sigla);
    }
}