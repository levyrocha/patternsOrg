@isTest
private class AccountRepositoryTest {

    @isTest
    static void itShouldReturnAccountsByIds(){
        List<Account> accounts = AccountFactory.provideAccountsByQuantity(2);

        List<Id> accountIds = Lists.byField(accounts, 'Id');

        AccountRepository accountRepository = new AccountRepository();
        
        Test.startTest();

        List<Account> result = accountRepository.getAccountsByIds(accountIds);

        Test.stopTest();

        Assert.isNotNull(result);
        Assert.isTrue(result.size() == 2, 'Should be contains two records');
    }

}