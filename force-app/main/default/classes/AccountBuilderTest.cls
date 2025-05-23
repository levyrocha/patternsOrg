@isTest
private class AccountBuilderTest {

    @isTest
    private static void itShouldReturnBuildedAccount() {

        String fakeAccountId = FixtureFactory.generateFakeId18(Account.getSObjectType());

        Test.startTest();

        Account account = new AccountBuilder()
            .withId(fakeAccountId)
            .withName('Test Account')
            .withType('Customer')
            .withBillingStreet('123 Test St')
            .withBillingCity('Testville')
            .withBillingState('TS')
            .withBillingPostalCode('12345')
            .withBillingCountry('Brazil')
            .withBillingLatitude(10.1234)
            .withBillingLongitude(-50.5678)
            .withBillingGeocodeAccuracy('Address')
            .withShippingStreet('456 Ship St')
            .withShippingCity('Shipville')
            .withShippingState('SP')
            .withShippingPostalCode('54321')
            .withShippingCountry('Brazil')
            .withShippingLatitude(11.1234)
            .withShippingLongitude(-51.5678)
            .withShippingGeocodeAccuracy('City')
            .withPhone('123-456-7890')
            .withFax('123-456-7891')
            .withAccountNumber('ACC123')
            .withWebsite('https://example.com')
            .withSic('1234')
            .withIndustry('Technology')
            .withAnnualRevenue(1000000.00)
            .withNumberOfEmployees(100)
            .withOwnership('Public')
            .withTickerSymbol('EXM')
            .withDescription('Test account for unit testing.')
            .withRating('Hot')
            .withSite('Main')
            .withOwnerId(UserInfo.getUserId())
            .withJigsaw('JIG123')
            .withCleanStatus('Clean')
            .withAccountSource('Web')
            .withDunsNumber('DUN123456')
            .withTradestyle('StyleTest')
            .withNaicsCode('541512')
            .withNaicsDesc('Custom Software Development')
            .withYearStarted('2020')
            .withSicDesc('Custom IT Services')
            .withCustomerPriority('High')
            .withSLA('Gold')
            .withActive('Yes')
            .withNumberOfLocations(5)
            .withUpsellOpportunity('Yes')
            .withSLASerialNumber('SLA-0001')
            .withSLAExpirationDate(Date.today().addDays(30))
            .build();

        Test.stopTest();

        Assert.areNotEqual(null, account, 'Account should not be null');
        Assert.areEqual(fakeAccountId, account.Id);
        Assert.areEqual('Test Account', account.Name);
        Assert.areEqual('Customer', account.Type);
        Assert.areEqual('123 Test St', account.BillingStreet);
        Assert.areEqual('Testville', account.BillingCity);
        Assert.areEqual('TS', account.BillingState);
        Assert.areEqual('12345', account.BillingPostalCode);
        Assert.areEqual('Brazil', account.BillingCountry);
        Assert.areEqual(10.1234, account.BillingLatitude);
        Assert.areEqual(-50.5678, account.BillingLongitude);
        Assert.areEqual('Address', account.BillingGeocodeAccuracy);
        Assert.areEqual('456 Ship St', account.ShippingStreet);
        Assert.areEqual('Shipville', account.ShippingCity);
        Assert.areEqual('SP', account.ShippingState);
        Assert.areEqual('54321', account.ShippingPostalCode);
        Assert.areEqual('Brazil', account.ShippingCountry);
        Assert.areEqual(11.1234, account.ShippingLatitude);
        Assert.areEqual(-51.5678, account.ShippingLongitude);
        Assert.areEqual('City', account.ShippingGeocodeAccuracy);
        Assert.areEqual('123-456-7890', account.Phone);
        Assert.areEqual('123-456-7891', account.Fax);
        Assert.areEqual('ACC123', account.AccountNumber);
        Assert.areEqual('https://example.com', account.Website);
        Assert.areEqual('Technology', account.Industry);
        Assert.areEqual(1000000.00, account.AnnualRevenue);
        Assert.areEqual(100, account.NumberOfEmployees);
        Assert.areEqual('Public', account.Ownership);
        Assert.areEqual('EXM', account.TickerSymbol);
        Assert.areEqual('Hot', account.Rating);
        Assert.areEqual('High', account.CustomerPriority__c);
        Assert.areEqual('Gold', account.SLA__c);
        Assert.areEqual('Yes', account.Active__c);
    }
}