public class CNPJWrapper {

	public class Estabelecimento {
		public String cnpj {get;set;} 
		public List<Atividades_secundarias> atividades_secundarias {get;set;} 
		public String cnpj_raiz {get;set;} 
		public String cnpj_ordem {get;set;} 
		public String cnpj_digito_verificador {get;set;} 
		public String tipo {get;set;} 
		public String nome_fantasia {get;set;} 
		public String situacao_cadastral {get;set;} 
		public String data_situacao_cadastral {get;set;} 
		public String data_inicio_atividade {get;set;} 
		public String nome_cidade_exterior {get;set;} 
		public String tipo_logradouro {get;set;} 
		public String logradouro {get;set;} 
		public String numero {get;set;} 
		public String complemento {get;set;} 
		public String bairro {get;set;} 
		public String cep {get;set;} 
		public String ddd1 {get;set;} 
		public String telefone1 {get;set;} 
		public String ddd2 {get;set;} 
		public String telefone2 {get;set;} 
		public String ddd_fax {get;set;} 
		public String fax {get;set;} 
		public String email {get;set;} 
		public String situacao_especial {get;set;} 
		public String data_situacao_especial {get;set;} 
		public String atualizado_em {get;set;} 
		public Atividades_secundarias atividade_principal {get;set;} 
		public Pais pais {get;set;} 
		public Estado estado {get;set;} 
		public Cidade cidade {get;set;} 
		public String motivo_situacao_cadastral {get;set;} 
		public List<Inscricoes_estaduais> inscricoes_estaduais {get;set;} 

		public Estabelecimento(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'cnpj') {
							cnpj = parser.getText();
						} else if (text == 'atividades_secundarias') {
							atividades_secundarias = arrayOfAtividades_secundarias(parser);
						} else if (text == 'cnpj_raiz') {
							cnpj_raiz = parser.getText();
						} else if (text == 'cnpj_ordem') {
							cnpj_ordem = parser.getText();
						} else if (text == 'cnpj_digito_verificador') {
							cnpj_digito_verificador = parser.getText();
						} else if (text == 'tipo') {
							tipo = parser.getText();
						} else if (text == 'nome_fantasia') {
							nome_fantasia = parser.getText();
						} else if (text == 'situacao_cadastral') {
							situacao_cadastral = parser.getText();
						} else if (text == 'data_situacao_cadastral') {
							data_situacao_cadastral = parser.getText();
						} else if (text == 'data_inicio_atividade') {
							data_inicio_atividade = parser.getText();
						} else if (text == 'nome_cidade_exterior') {
							nome_cidade_exterior = parser.getText();
						} else if (text == 'tipo_logradouro') {
							tipo_logradouro = parser.getText();
						} else if (text == 'logradouro') {
							logradouro = parser.getText();
						} else if (text == 'numero') {
							numero = parser.getText();
						} else if (text == 'complemento') {
							complemento = parser.getText();
						} else if (text == 'bairro') {
							bairro = parser.getText();
						} else if (text == 'cep') {
							cep = parser.getText();
						} else if (text == 'ddd1') {
							ddd1 = parser.getText();
						} else if (text == 'telefone1') {
							telefone1 = parser.getText();
						} else if (text == 'ddd2') {
							ddd2 = parser.getText();
						} else if (text == 'telefone2') {
							telefone2 = parser.getText();
						} else if (text == 'ddd_fax') {
							ddd_fax = parser.getText();
						} else if (text == 'fax') {
							fax = parser.getText();
						} else if (text == 'email') {
							email = parser.getText();
						} else if (text == 'situacao_especial') {
							situacao_especial = parser.getText();
						} else if (text == 'data_situacao_especial') {
							data_situacao_especial = parser.getText();
						} else if (text == 'atualizado_em') {
							atualizado_em = parser.getText();
						} else if (text == 'atividade_principal') {
							atividade_principal = new Atividades_secundarias(parser);
						} else if (text == 'pais') {
							pais = new Pais(parser);
						} else if (text == 'estado') {
							estado = new Estado(parser);
						} else if (text == 'cidade') {
							cidade = new Cidade(parser);
						} else if (text == 'motivo_situacao_cadastral') {
							motivo_situacao_cadastral = parser.getText();
						} else if (text == 'inscricoes_estaduais') {
							inscricoes_estaduais = arrayOfInscricoes_estaduais(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Estabelecimento consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Qualificacao_do_responsavel {
		public Integer id {get;set;} 
		public String descricao {get;set;} 

		public Qualificacao_do_responsavel(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getIntegerValue();
						} else if (text == 'descricao') {
							descricao = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Qualificacao_do_responsavel consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Simples {
		public String simples {get;set;} 
		public String data_opcao_simples {get;set;} 
		public String data_exclusao_simples {get;set;} 
		public String mei {get;set;} 
		public String data_opcao_mei {get;set;} 
		public String data_exclusao_mei {get;set;} 
		public String atualizado_em {get;set;} 

		public Simples(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'simples') {
							simples = parser.getText();
						} else if (text == 'data_opcao_simples') {
							data_opcao_simples = parser.getText();
						} else if (text == 'data_exclusao_simples') {
							data_exclusao_simples = parser.getText();
						} else if (text == 'mei') {
							mei = parser.getText();
						} else if (text == 'data_opcao_mei') {
							data_opcao_mei = parser.getText();
						} else if (text == 'data_exclusao_mei') {
							data_exclusao_mei = parser.getText();
						} else if (text == 'atualizado_em') {
							atualizado_em = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Simples consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public String cnpj_raiz {get;set;} 
	public String razao_social {get;set;} 
	public String capital_social {get;set;} 
	public String responsavel_federativo {get;set;} 
	public String atualizado_em {get;set;} 
	public Porte porte {get;set;} 
	public Porte natureza_juridica {get;set;} 
	public Qualificacao_do_responsavel qualificacao_do_responsavel {get;set;} 
	public List<Socios> socios {get;set;} 
	public Simples simples {get;set;} 
	public Estabelecimento estabelecimento {get;set;} 

	public CNPJWrapper(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'cnpj_raiz') {
						cnpj_raiz = parser.getText();
					} else if (text == 'razao_social') {
						razao_social = parser.getText();
					} else if (text == 'capital_social') {
						capital_social = parser.getText();
					} else if (text == 'responsavel_federativo') {
						responsavel_federativo = parser.getText();
					} else if (text == 'atualizado_em') {
						atualizado_em = parser.getText();
					} else if (text == 'porte') {
						porte = new Porte(parser);
					} else if (text == 'natureza_juridica') {
						natureza_juridica = new Porte(parser);
					} else if (text == 'qualificacao_do_responsavel') {
						qualificacao_do_responsavel = new Qualificacao_do_responsavel(parser);
					} else if (text == 'socios') {
						socios = arrayOfSocios(parser);
					} else if (text == 'simples') {
						simples = new Simples(parser);
					} else if (text == 'estabelecimento') {
						estabelecimento = new Estabelecimento(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'CNPJWrapper consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Socios {
		public String cpf_cnpj_socio {get;set;} 
		public String nome {get;set;} 
		public String tipo {get;set;} 
		public String data_entrada {get;set;} 
		public String cpf_representante_legal {get;set;} 
		public String nome_representante {get;set;} 
		public String faixa_etaria {get;set;} 
		public String atualizado_em {get;set;} 
		public String pais_id {get;set;} 
		public Qualificacao_do_responsavel qualificacao_socio {get;set;} 
		public String qualificacao_representante {get;set;} 
		public Pais pais {get;set;} 

		public Socios(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'cpf_cnpj_socio') {
							cpf_cnpj_socio = parser.getText();
						} else if (text == 'nome') {
							nome = parser.getText();
						} else if (text == 'tipo') {
							tipo = parser.getText();
						} else if (text == 'data_entrada') {
							data_entrada = parser.getText();
						} else if (text == 'cpf_representante_legal') {
							cpf_representante_legal = parser.getText();
						} else if (text == 'nome_representante') {
							nome_representante = parser.getText();
						} else if (text == 'faixa_etaria') {
							faixa_etaria = parser.getText();
						} else if (text == 'atualizado_em') {
							atualizado_em = parser.getText();
						} else if (text == 'pais_id') {
							pais_id = parser.getText();
						} else if (text == 'qualificacao_socio') {
							qualificacao_socio = new Qualificacao_do_responsavel(parser);
						} else if (text == 'qualificacao_representante') {
							qualificacao_representante = parser.getText();
						} else if (text == 'pais') {
							pais = new Pais(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Socios consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Atividades_secundarias {
		public String id {get;set;} 
		public String secao {get;set;} 
		public String divisao {get;set;} 
		public String grupo {get;set;} 
		public String classe {get;set;} 
		public String subclasse {get;set;} 
		public String descricao {get;set;} 

		public Atividades_secundarias(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getText();
						} else if (text == 'secao') {
							secao = parser.getText();
						} else if (text == 'divisao') {
							divisao = parser.getText();
						} else if (text == 'grupo') {
							grupo = parser.getText();
						} else if (text == 'classe') {
							classe = parser.getText();
						} else if (text == 'subclasse') {
							subclasse = parser.getText();
						} else if (text == 'descricao') {
							descricao = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Atividades_secundarias consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Pais {
		public String id {get;set;} 
		public String iso2 {get;set;} 
		public String iso3 {get;set;} 
		public String nome {get;set;} 
		public String comex_id {get;set;} 

		public Pais(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getText();
						} else if (text == 'iso2') {
							iso2 = parser.getText();
						} else if (text == 'iso3') {
							iso3 = parser.getText();
						} else if (text == 'nome') {
							nome = parser.getText();
						} else if (text == 'comex_id') {
							comex_id = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Pais consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Inscricoes_estaduais {
		public String inscricao_estadual {get;set;} 
		public Boolean ativo {get;set;} 
		public String atualizado_em {get;set;} 
		public Estado estado {get;set;} 

		public Inscricoes_estaduais(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'inscricao_estadual') {
							inscricao_estadual = parser.getText();
						} else if (text == 'ativo') {
							ativo = parser.getBooleanValue();
						} else if (text == 'atualizado_em') {
							atualizado_em = parser.getText();
						} else if (text == 'estado') {
							estado = new Estado(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Inscricoes_estaduais consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Porte {
		public String id {get;set;} 
		public String descricao {get;set;} 

		public Porte(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getText();
						} else if (text == 'descricao') {
							descricao = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Porte consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Estado {
		public Integer id {get;set;} 
		public String nome {get;set;} 
		public String sigla {get;set;} 
		public Integer ibge_id {get;set;} 

		public Estado(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getIntegerValue();
						} else if (text == 'nome') {
							nome = parser.getText();
						} else if (text == 'sigla') {
							sigla = parser.getText();
						} else if (text == 'ibge_id') {
							ibge_id = parser.getIntegerValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Estado consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Cidade {
		public Integer id {get;set;} 
		public String nome {get;set;} 
		public Integer ibge_id {get;set;} 
		public String siafi_id {get;set;} 

		public Cidade(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getIntegerValue();
						} else if (text == 'nome') {
							nome = parser.getText();
						} else if (text == 'ibge_id') {
							ibge_id = parser.getIntegerValue();
						} else if (text == 'siafi_id') {
							siafi_id = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Cidade consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}	
	
	public static CNPJWrapper fromJson(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new CNPJWrapper(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}	

    private static List<Inscricoes_estaduais> arrayOfInscricoes_estaduais(System.JSONParser p) {
        List<Inscricoes_estaduais> res = new List<Inscricoes_estaduais>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Inscricoes_estaduais(p));
        }
        return res;
    }

    private static List<Atividades_secundarias> arrayOfAtividades_secundarias(System.JSONParser p) {
        List<Atividades_secundarias> res = new List<Atividades_secundarias>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Atividades_secundarias(p));
        }
        return res;
    }

    private static List<Socios> arrayOfSocios(System.JSONParser p) {
        List<Socios> res = new List<Socios>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Socios(p));
        }
        return res;
    }

}