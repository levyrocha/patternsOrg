@isTest
private class AccountRepositoryTest {

    @isTest
    static void itShouldReturnAccountsByIds(){
        List<Account> accounts = AccountFactory.provideStandardAccountsByQuantity(2);

        List<Id> accountIds = Lists.byField(accounts, 'Id');

        AccountRepository accountRepository = new AccountRepository();
        
        Test.startTest();

        List<Account> results = accountRepository.getAccountsByIds(accountIds);

        Test.stopTest();

        Assert.isFalse(results.isEmpty(), 'Results can not be empty');
        Assert.areEqual(2, results.size(), 'Results size should be 2');
    }
}