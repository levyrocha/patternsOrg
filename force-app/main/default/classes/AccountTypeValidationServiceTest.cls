@isTest
private class AccountTypeValidationServiceTest {

    @isTest
    static void notHasAccountsToPerformShouldBeFalse() {
        List<String> accountFakeIds = FixtureFactory.generateFakeIds18(Account.getSObjectType(), 2);

        String newAccountsPayload = '[{"Id":"'+accountFakeIds[0]+'","Type":"Customer - Direct"},{"Id":"'+accountFakeIds[1]+'","Type":"Customer - Channel"}]';
        String oldAccountsByIdPayload = '{"'+accountFakeIds[0]+'":{"Id":"'+accountFakeIds[0]+'","Type":"Customer - Channel"},"'+accountFakeIds[1]+'":{"Id":"'+accountFakeIds[1]+'","Type":"Customer - Direct"}}';

        List<Account> newAccounts = AccountFactory.fromJsonArray(newAccountsPayload);
        Map<Id,Account> oldAccountsById = AccountFactory.fromJsonMapId(oldAccountsByIdPayload);

        AccountTypeValidationService accountTypeValidationService = new AccountTypeValidationService();
        accountTypeValidationService.newAccounts = newAccounts;
        accountTypeValidationService.oldAccountsById = oldAccountsById;

        Test.startTest();

        Boolean result = accountTypeValidationService.notHasAccountsToPerform();

        Test.stopTest();

        Assert.areEqual(false, result);
    }

    @isTest
    static void notHasAccountsToPerformShouldBeTrue() {
        List<String> accountFakeIds = FixtureFactory.generateFakeIds18(Account.getSObjectType(), 2);

        String newAccountsPayload = '[{"Id":"'+accountFakeIds[0]+'","Type":"Customer - Direct"},{"Id":"'+accountFakeIds[1]+'","Type":"Customer - Channel"}]';
        String oldAccountsByIdPayload = '{"'+accountFakeIds[0]+'":{"Id":"'+accountFakeIds[0]+'","Type":"Customer - Direct"},"'+accountFakeIds[1]+'":{"Id":"'+accountFakeIds[0]+'","Type":"Customer - Channel"}}';

        List<Account> newAccounts = AccountFactory.fromJsonArray(newAccountsPayload);
        Map<Id,Account> oldAccountsById = AccountFactory.fromJsonMapId(oldAccountsByIdPayload);

        AccountTypeValidationService accountTypeValidationService = new AccountTypeValidationService();
        accountTypeValidationService.newAccounts = newAccounts;
        accountTypeValidationService.oldAccountsById = oldAccountsById;

        Test.startTest();

        Boolean result = accountTypeValidationService.notHasAccountsToPerform();

        Test.stopTest();

        Assert.areEqual(true, result);
    }

    @isTest
    static void itShouldBeFilteredByChangeTypeWhenHasChanges() {
        List<String> accountFakeIds = FixtureFactory.generateFakeIds18(Account.getSObjectType(), 2);

        String newAccountsPayload = '[{"Id":"'+accountFakeIds[0]+'","Type":"Customer - Channel"},{"Id":"'+accountFakeIds[1]+'","Type":"Customer - Channel"}]';
        String oldAccountsByIdPayload = '{"'+accountFakeIds[0]+'":{"Id":"'+accountFakeIds[0]+'","Type":"Customer - Direct"},"'+accountFakeIds[1]+'":{"Id":"'+accountFakeIds[0]+'","Type":"Customer - Direct"}}';

        List<Account> newAccounts = AccountFactory.fromJsonArray(newAccountsPayload);
        Map<Id,Account> oldAccountsById = AccountFactory.fromJsonMapId(oldAccountsByIdPayload);

        AccountTypeValidationService accountTypeValidationService = new AccountTypeValidationService();
        accountTypeValidationService.newAccounts = newAccounts;
        accountTypeValidationService.oldAccountsById = oldAccountsById;

        Test.startTest();

        List<Account> result = accountTypeValidationService.filterByChangeType();

        Test.stopTest();

        Assert.areEqual(2, result.size());
    }

    @isTest
    static void itNotShouldBeFilteredByChangeTypeWhenNotHasChanges() {
        List<String> accountFakeIds = FixtureFactory.generateFakeIds18(Account.getSObjectType(), 2);

        String newAccountsPayload = '[{"Id":"'+accountFakeIds[0]+'","Type":"Customer - Channel"},{"Id":"'+accountFakeIds[1]+'","Type":"Customer - Channel"}]';
        String oldAccountsByIdPayload = '{"'+accountFakeIds[0]+'":{"Id":"'+accountFakeIds[0]+'","Type":"Customer - Channel"},"'+accountFakeIds[1]+'":{"Id":"'+accountFakeIds[0]+'","Type":"Customer - Channel"}}';

        List<Account> newAccounts = AccountFactory.fromJsonArray(newAccountsPayload);
        Map<Id,Account> oldAccountsById = AccountFactory.fromJsonMapId(oldAccountsByIdPayload);

        AccountTypeValidationService accountTypeValidationService = new AccountTypeValidationService();
        accountTypeValidationService.newAccounts = newAccounts;
        accountTypeValidationService.oldAccountsById = oldAccountsById;

        Test.startTest();

        List<Account> result = accountTypeValidationService.filterByChangeType();

        Test.stopTest();

        Assert.isTrue(result.isEmpty());
    }

    @isTest
    static void itShouldBeReturnedNotHasOpportunitiesToPerformFalse() {
        List<String> accountFakeIds = FixtureFactory.generateFakeIds18(Account.getSObjectType(), 2);
        String opportunityFakeId = FixtureFactory.generateFakeId18(Opportunity.getSObjectType());

        String opportunitiesToPerformPayload = '[{"Id":"'+opportunityFakeId+'","StageName":"Prospecting","AccountId":"'+accountFakeIds[0]+'"}]';

        AccountTypeValidationService accountTypeValidationService = new AccountTypeValidationService();
        accountTypeValidationService.setOpportunityRepository(new OpportunityRepositoryMock(opportunitiesToPerformPayload));

        Test.startTest();

        Boolean result = accountTypeValidationService.notHasOpportunitiesToPerform();

        Test.stopTest();

        Assert.isFalse(result);
    }

    @isTest
    static void itShouldBeReturnedNotHasOpportunitiesToPerformTrue() {

        String opportunitiesToPerformPayload = '[]';

        AccountTypeValidationService accountTypeValidationService = new AccountTypeValidationService();
        accountTypeValidationService.setOpportunityRepository(new OpportunityRepositoryMock(opportunitiesToPerformPayload));

        Test.startTest();

        Boolean result = accountTypeValidationService.notHasOpportunitiesToPerform();

        Test.stopTest();

        Assert.isTrue(result);
    }

    @isTest
    static void itShouldBeReturnedOpportunitiesWithStatusNotAllowedByAccountIds() {
        List<String> accountFakeIds = FixtureFactory.generateFakeIds18(Account.getSObjectType(), 1);
        String opportunityFakeId = FixtureFactory.generateFakeId18(Opportunity.getSObjectType());

        String opportunitiesToPerformPayload = '[{"Id":"'+opportunityFakeId+'","StageName":"Prospecting","AccountId":"'+accountFakeIds[0]+'"}]';

        AccountTypeValidationService accountTypeValidationService = new AccountTypeValidationService();
        accountTypeValidationService.setOpportunityRepository(new OpportunityRepositoryMock(opportunitiesToPerformPayload));

        Test.startTest();

        List<Opportunity> result = accountTypeValidationService.getOpportunitiesWithStatusNotAllowedByAccountIds(accountFakeIds);

        Test.stopTest();

        Assert.areEqual(1, result.size());
    }

    @isTest
    static void itShouldBeNotReturnedOpportunitiesWithStatusNotAllowedByAccountIds() {
        List<String> accountFakeIds = FixtureFactory.generateFakeIds18(Account.getSObjectType(), 1);

        String opportunitiesToPerformPayload = '[]';

        AccountTypeValidationService accountTypeValidationService = new AccountTypeValidationService();
        accountTypeValidationService.setOpportunityRepository(new OpportunityRepositoryMock(opportunitiesToPerformPayload));

        Test.startTest();

        List<Opportunity> result = accountTypeValidationService.getOpportunitiesWithStatusNotAllowedByAccountIds(accountFakeIds);

        Test.stopTest();

        Assert.areEqual(0, result.size());
    }

    @isTest
    static void itShouldBeReturnedAccountIdsToPerform() {
        List<String> accountFakeIds = FixtureFactory.generateFakeIds18(Account.getSObjectType(), 1);
        
        String accountsToPerformPayload = '[{"Id":"'+accountFakeIds[0]+'"}]';

        List<Account> accountsToPerform = AccountFactory.fromJsonArray(accountsToPerformPayload);

        AccountTypeValidationService accountTypeValidationService = new AccountTypeValidationService();
        accountTypeValidationService.accountsToPerform = accountsToPerform;

        Test.startTest();

        List<String> result = accountTypeValidationService.getAccountIdsToPerform();

        Test.stopTest();

        Assert.areEqual(1, result.size());
    }

    @isTest
    static void itShouldBeReturnErrorOnAccountRecord() {
        List<String> accountFakeIds = FixtureFactory.generateFakeIds18(Account.getSObjectType(), 1);
        
        String accountToPerformPayload = '{"Id":"'+accountFakeIds[0]+'"}';

        Account accountToPerform = AccountFactory.fromJson(accountToPerformPayload);

        AccountTypeValidationService accountTypeValidationService = new AccountTypeValidationService();

        Test.startTest();

        accountTypeValidationService.addAccountError(accountToPerform);

        Test.stopTest();

        List<Database.Error> errors = accountToPerform.getErrors();

        Assert.areEqual(1, errors.size(), 'Should be contains 1 error');
        Assert.areEqual('Não é possível atualizar o tipo, pois essa conta possui opportunidades pendentes', errors[0].getMessage(),'Should be correct error message');
    }

}