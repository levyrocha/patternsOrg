@isTest
private class AccountEnricherTest {

    @isTest
    private static void itShouldReturnEntichedAccountWithInitialInfo() {

        AccountEnricher accountEnricher = new AccountEnricher();

        Account account = new Account();
        account.CNPJ__c = '123';

        Test.startTest();
        
        Account result = accountEnricher.enrichAccountWithInitialInfo(account);

        Test.stopTest();

        Assert.areEqual('Initial name', result.Name, 'Name should be Initial name');
        Assert.areEqual('123', result.CNPJ__c, 'CNPJ__c should be 123');
    }
}