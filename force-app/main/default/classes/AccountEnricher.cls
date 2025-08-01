public without sharing class AccountEnricher {
    public AccountEnricher() {}

    public Account enrichAccountWithCNPJInfos(CNPJWrapper cnpjInfo) {
        return new AccountBuilder()
            .withName(cnpjInfo.estabelecimento.nome_fantasia)
            .build();
    }
}