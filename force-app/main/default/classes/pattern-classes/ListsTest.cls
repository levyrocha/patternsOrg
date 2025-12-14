@isTest
public class ListsTest {

    public static List<Account> setup() {
        return new List<Account> {
            AccountFactory.fromJson('{ "Id": "'+((Id) FixtureFactory.generateFakeId( Account.getSObjectType() ))+'", "Name":"Account 1", "BillingState":"São Paulo", "NumberOfEmployees": 5 }}'),
            AccountFactory.fromJson('{ "Id": "'+((Id) FixtureFactory.generateFakeId( Account.getSObjectType() ))+'", "Name":"Account 2", "BillingState":"São Paulo", "NumberOfEmployees": 14, "Parent": {"Name": "ParentAccount 1"} }'),
            AccountFactory.fromJson('{ "Id": "'+((Id) FixtureFactory.generateFakeId( Account.getSObjectType() ))+'", "Name":"Account 3", "BillingState":"Rio de Janeiro", "NumberOfEmployees": 3, "Parent": {"Name": "ParentAccount 2"} }')
        };
    }

    @isTest
    private static void itShouldReturnAListWithFieldValues () {

        List<Account> accounts = setup();

        Test.startTest();

        List<String> names = Lists.byField( accounts, 'Name' );

        Test.stopTest();

        Assert.areEqual( 3, names.size(), 'Names list should have 3 elements' );
    }

    @isTest
    private static void itShouldReturnAListWithFieldValuesByObject () {

        List<Account> accounts = setup();

        Test.startTest();

        List<String> names = Lists.byField( accounts, 'Name' );

        Test.stopTest();

        Assert.areEqual( 3, names.size(), 'Names list should have 3 elements' );
    }

    @isTest
    private static void itShouldReturnEmptyListByObject () {

        List<Object> records = new List<Object>();

        Test.startTest();

        List<String> values = Lists.byField( records, 'BillingState' );

        Test.stopTest();

        Assert.areEqual( 0, values.size(), 'Values list should be empty' );
    }

    @isTest
    private static void itShouldReturnEmptyList () {

        List<SObject> records = new List<SObject>();

        Test.startTest();

        List<String> values = Lists.byField( records, 'BillingState' );

        Test.stopTest();

        Assert.areEqual( 0, values.size(), 'Values list should be empty' );
    }

    @isTest
    private static void itShouldReturnAListWithCompositeKeys() {

        List<Account> accounts = setup();

        Test.startTest();

        List<String> compositeKeys = Lists.byCompositeKey( accounts, new List<String>{ 'Name', 'Id'}, '-' );

        Test.stopTest();

        Assert.areEqual( 3, compositeKeys.size(), 'compositeKeys list should have 3 elements' );
    }

    @isTest
    static void testCorrectPartions() {

        List<Integer> records = new List<Integer> { 1, 2, 3, 4, 5 };

        Test.startTest();

        List<List<Integer>> actual = (List<List<Integer>>) Lists.doPartions(records, 2, List<List<Integer>>.class);

        Test.stopTest();

        Assert.areEqual(3, actual.size(), 'Incorrect number of partions');

        Integer tempNumber = 1;

        for(List<Integer> itemsActual :actual) {
            for(Integer numb :itemsActual) {
                Assert.areEqual(tempNumber, numb, 'Order of elements isn\'t saved');
                ++tempNumber;
            }
        }
    }

    @isTest
    private static void addAllFromMapAndKeys() {

        List<Account> accounts = setup();

        Map<String,List<Account>> accountsByState = Maps.groupBy( 'BillingState', accounts );

        Test.startTest();

        List<Account> accountsFromMap = Lists.addAllFromMapAndKeys( accountsByState, new List<String>( accountsByState.keySet() ) );

        Test.stopTest();

        Assert.isFalse( accountsFromMap.isEmpty(), 'Should return accounts' );
        Assert.areEqual( 3, accountsFromMap.size(), 'Should return 3 accounts' );

    }

    @isTest
    private static void itShouldReturnAListWithCompositeKeysIdTo15() {

        List<Account> accounts = setup();

        Test.startTest();

        List<String> compositeKeys = Lists.byCompositeKeyIdTo15( accounts, new List<String>{ 'Id', 'Id'}, '-' );
        System.debug('compositeKeys' + compositeKeys);

        Test.stopTest();

        Assert.areEqual( 31, compositeKeys[0].length(), 'compositeKeys list should have 31 characteres' );
    }
}