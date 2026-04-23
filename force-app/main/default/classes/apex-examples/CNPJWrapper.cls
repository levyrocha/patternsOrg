public class CNPJWrapper {

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
	}
	
	public class Qualificacao_do_responsavel {
		public Integer id {get;set;} 
		public String descricao {get;set;} 
	}
	
	public class Simples {
		public String simples {get;set;} 
		public String data_opcao_simples {get;set;} 
		public String data_exclusao_simples {get;set;} 
		public String mei {get;set;} 
		public String data_opcao_mei {get;set;} 
		public String data_exclusao_mei {get;set;} 
		public String atualizado_em {get;set;} 
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
	}
	
	public class Atividades_secundarias {
		public String id {get;set;} 
		public String secao {get;set;} 
		public String divisao {get;set;} 
		public String grupo {get;set;} 
		public String classe {get;set;} 
		public String subclasse {get;set;} 
		public String descricao {get;set;} 
	}
	
	public class Pais {
		public String id {get;set;} 
		public String iso2 {get;set;} 
		public String iso3 {get;set;} 
		public String nome {get;set;} 
		public String comex_id {get;set;} 
	}
	
	public class Inscricoes_estaduais {
		public String inscricao_estadual {get;set;} 
		public Boolean ativo {get;set;} 
		public String atualizado_em {get;set;} 
		public Estado estado {get;set;} 
	}
	
	public class Porte {
		public String id {get;set;} 
		public String descricao {get;set;} 
	}
	
	public class Estado {
		public Integer id {get;set;} 
		public String nome {get;set;} 
		public String sigla {get;set;} 
		public Integer ibge_id {get;set;} 
	}
	
	public class Cidade {
		public Integer id {get;set;} 
		public String nome {get;set;} 
		public Integer ibge_id {get;set;} 
		public String siafi_id {get;set;} 
	}	
	
	public static CNPJWrapper fromJson(String payload) {
		return (CNPJWrapper) JSON.deserialize(payload, CNPJWrapper.class);
	}

}