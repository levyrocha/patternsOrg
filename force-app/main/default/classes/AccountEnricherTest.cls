@isTest
private class AccountEnricherTest {

    @isTest
    private static void itShouldReturnEntichedAccountWithCNPJInfos() {

        String cnpjInfoPayload = '{"estabelecimento":{"nome_fantasia": "Nome Fantasia Teste"}}';

        CNPJWrapper cnpjInfo = CNPJWrapper.fromJson(cnpjInfoPayload);

        AccountEnricher accountEnricher = new AccountEnricher();

        Test.startTest();
        
        Account result = accountEnricher.enrichAccountWithCNPJInfos(cnpjInfo);

        Test.stopTest();

        Assert.areEqual('Nome Fantasia Teste', result.Name, 'Name should be Nome Fantasia Teste');
    }
}