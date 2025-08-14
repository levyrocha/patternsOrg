@isTest
public class FilterTest {

    // @isTest
    // public static void givenChangedRecordsWhenFilterByRelevantFieldsThenReturnOnlyRecordsWithChanges () {

    //     Filter filter = new Filter();

    //     List<Account> newAccounts = setupAccounts();
        
    //     Map<Id, Account> oldAccounts = new Map<Id, Account> {
    //         newAccounts.get(0).Id => newAccounts.get(0).clone(true, true, true)
    //         , newAccounts.get(1).Id => newAccounts.get(1).clone(true, true, true)
    //     };

    //     oldAccounts.get( newAccounts.get(1).Id ).BillingStreet = 'BillingStreet0'; 

    //     List<Account> accounts = filter.relevantChangeRecordsFilter(newAccounts, oldAccounts, new String[] { 'BillingStreet'});

    //     System.assertEquals(1, accounts.size());

    // }


    // @isTest
    // public static void givenChangedRecordsWhenFilterByRelevantFieldsWithSpecificValueThenReturnOnlyRecordsWithChanges () {

    //     Filter filter = new Filter();

    //     List<Account> newAccounts = setupAccounts();
        
    //     Map<Id, Account> oldAccounts = new Map<Id, Account> {
    //         newAccounts.get(0).Id => newAccounts.get(0).clone(true, true, true)
    //         , newAccounts.get(1).Id => newAccounts.get(1).clone(true, true, true)
    //     };

    //     oldAccounts.get( newAccounts.get(1).Id ).BillingStreet = 'BillingStreet0'; 

    //     List<Account> accounts = filter.relevantChangeRecordsFilter(newAccounts
    //                 , oldAccounts
    //                 , 'BillingStreet'
    //                 , 'BillingStreet');

    //     System.assertEquals(1, accounts.size());

    // }

    @isTest
    private static void relevantChangeRecordsFilterWithManyChangedValues() {

        List<String> accountFakeIds = FixtureFactory.generateFakeIds18( Account.getSObjectType(), 4 );

        String newAccountsPayload = '[{"Id":"'+ accountFakeIds[0] +'","Name":"A"},{"Id":"'+ accountFakeIds[1] +'","Name":"B"},{"Id":"'+ accountFakeIds[2] +'","Name":"C"},{"Id":"'+ accountFakeIds[3] +'","Name":"D"}]';
        String oldRecordByIdPayload = '{"'+ accountFakeIds[3] +'":{"Id":"'+ accountFakeIds[3] +'","Name":""},"'+ accountFakeIds[2] +'":{"Id":"'+ accountFakeIds[2] +'","Name":""},"'+ accountFakeIds[1] +'":{"Id":"'+ accountFakeIds[1] +'","Name":""},"'+ accountFakeIds[0] +'":{"Id":"'+ accountFakeIds[0] +'","Name":""}}';

        List<Account> newAccounts = AccountFactory.fromJsonArray( newAccountsPayload );
        Map<Id,Account> oldRecordById = AccountFactory.fromJsonMapId( oldRecordByIdPayload );

        Test.startTest();

        Filter filter = new Filter();
        List<Account> filteredAccounts = filter.relevantChangeRecordsFilter( newAccounts, oldRecordById, 'Name', new List<String>{'A','B'} );

        Test.stopTest();

        Assert.isTrue( !filteredAccounts.isEmpty(), 'Should return filteredAccounts' );
        Assert.areEqual( 2, filteredAccounts.size(), 'Should return two filteredAccounts' );

        Assert.isTrue( filteredAccounts[0].Name == 'A' || filteredAccounts[0].Name == 'B', 'The name of the filtered accounts should be A or B' );
        Assert.isTrue( filteredAccounts[1].Name == 'A' || filteredAccounts[1].Name == 'B', 'The name of the filtered accounts should be A or B' );

    }

    @isTest
    private static void filterByNewValueAndPriorValue() {

        List<String> accountFakeIds = FixtureFactory.generateFakeIds18( Account.getSObjectType(), 4 );

        String newAccountsPayload = '[{"Id":"'+ accountFakeIds[0] +'","Name":"ValorNovo"},{"Id":"'+ accountFakeIds[1] +'","Name":"ValorNovoInválido"},{"Id":"'+ accountFakeIds[2] +'","Name":"ValorNovoInválido"},{"Id":"'+ accountFakeIds[3] +'","Name":"ValorNovo"}]';
        String oldRecordByIdPayload = '{"'+ accountFakeIds[0] +'":{"Id":"'+ accountFakeIds[0] +'","Name":"ValorAntigo"},"'+ accountFakeIds[1] +'":{"Id":"'+ accountFakeIds[1] +'","Name":"ValorAntigoInválido"},"'+ accountFakeIds[2] +'":{"Id":"'+ accountFakeIds[2] +'","Name":"ValorAntigo"},"'+ accountFakeIds[3] +'":{"Id":"'+ accountFakeIds[3] +'","Name":"ValorAntigoInválido"}}';

        List<Account> newAccounts = AccountFactory.fromJsonArray( newAccountsPayload );
        Map<Id,Account> oldRecordById = AccountFactory.fromJsonMapId( oldRecordByIdPayload );

        Test.startTest();

        Filter filter = new Filter();
        List<Account> filteredAccounts = filter.byNewValueAndPriorValue( newAccounts, oldRecordById, 'Name', 'ValorNovo', 'ValorAntigo' );

        Test.stopTest();

        Assert.isTrue( !filteredAccounts.isEmpty(), 'Should return filteredAccounts' );
        Assert.areEqual( 1, filteredAccounts.size(), 'Should return two filteredAccounts' );

        Assert.areEqual( accountFakeIds[0], filteredAccounts[0].Id, 'The Id should be: '+accountFakeIds[0] );

    }
}