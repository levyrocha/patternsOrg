public without sharing class AccountBuilder {

    public Account account = new Account();

    public AccountBuilder(Account account) {
        this.account = account;
    }

    public AccountBuilder withId(Id id) {
        this.account.Id = id;
        return this;
    }

    public AccountBuilder withName(String name) {
        this.account.Name = name;
        return this;
    }

    public AccountBuilder withType(String type) {
        this.account.Type = type;
        return this;
    }

    public AccountBuilder withBillingStreet(String billingStreet) {
        this.account.BillingStreet = billingStreet;
        return this;
    }

    public AccountBuilder withBillingCity(String billingCity) {
        this.account.BillingCity = billingCity;
        return this;
    }

    public AccountBuilder withBillingState(String billingState) {
        this.account.BillingState = billingState;
        return this;
    }

    public AccountBuilder withBillingPostalCode(String billingPostalCode) {
        this.account.BillingPostalCode = billingPostalCode;
        return this;
    }

    public AccountBuilder withBillingCountry(String billingCountry) {
        this.account.BillingCountry = billingCountry;
        return this;
    }

    public AccountBuilder withBillingLatitude(Decimal lat) {
        this.account.BillingLatitude = lat;
        return this;
    }

    public AccountBuilder withBillingLongitude(Decimal lon) {
        this.account.BillingLongitude = lon;
        return this;
    }

    public AccountBuilder withBillingGeocodeAccuracy(String billingGeocodeAccuracy) {
        this.account.BillingGeocodeAccuracy = billingGeocodeAccuracy;
        return this;
    }

    public AccountBuilder withShippingStreet(String shippingStreet) {
        this.account.ShippingStreet = shippingStreet;
        return this;
    }

    public AccountBuilder withShippingCity(String shippingCity) {
        this.account.ShippingCity = shippingCity;
        return this;
    }

    public AccountBuilder withShippingState(String shippingState) {
        this.account.ShippingState = shippingState;
        return this;
    }

    public AccountBuilder withShippingPostalCode(String shippingPostalCode) {
        this.account.ShippingPostalCode = shippingPostalCode;
        return this;
    }

    public AccountBuilder withShippingCountry(String shippingCountry) {
        this.account.ShippingCountry = shippingCountry;
        return this;
    }

    public AccountBuilder withShippingLatitude(Decimal shippingLatitude) {
        this.account.ShippingLatitude = shippingLatitude;
        return this;
    }

    public AccountBuilder withShippingLongitude(Decimal lon) {
        this.account.ShippingLongitude = lon;
        return this;
    }

    public AccountBuilder withShippingGeocodeAccuracy(String shippingGeocodeAccuracy) {
        this.account.ShippingGeocodeAccuracy = shippingGeocodeAccuracy;
        return this;
    }

    public AccountBuilder withPhone(String phone) {
        this.account.Phone = phone;
        return this;
    }

    public AccountBuilder withFax(String fax) {
        this.account.Fax = fax;
        return this;
    }

    public AccountBuilder withAccountNumber(String accountNumber) {
        this.account.AccountNumber = accountNumber;
        return this;
    }

    public AccountBuilder withWebsite(String website) {
        this.account.Website = website;
        return this;
    }

    public AccountBuilder withSic(String sic) {
        this.account.Sic = sic;
        return this;
    }

    public AccountBuilder withIndustry(String industry) {
        this.account.Industry = industry;
        return this;
    }

    public AccountBuilder withAnnualRevenue(Decimal annualRevenue) {
        this.account.AnnualRevenue = annualRevenue;
        return this;
    }

    public AccountBuilder withNumberOfEmployees(Integer numberOfEmployees) {
        this.account.NumberOfEmployees = numberOfEmployees;
        return this;
    }

    public AccountBuilder withOwnership(String ownership) {
        this.account.Ownership = ownership;
        return this;
    }

    public AccountBuilder withTickerSymbol(String tickerSymbol) {
        this.account.TickerSymbol = tickerSymbol;
        return this;
    }

    public AccountBuilder withDescription(String description) {
        this.account.Description = description;
        return this;
    }

    public AccountBuilder withRating(String rating) {
        this.account.Rating = rating;
        return this;
    }

    public AccountBuilder withSite(String site) {
        this.account.Site = site;
        return this;
    }

    public AccountBuilder withOwnerId(Id ownerId) {
        this.account.OwnerId = ownerId;
        return this;
    }

    public AccountBuilder withJigsaw(String jigsaw) {
        this.account.Jigsaw = jigsaw;
        return this;
    }

    public AccountBuilder withCleanStatus(String cleanStatus) {
        this.account.CleanStatus = cleanStatus;
        return this;
    }

    public AccountBuilder withAccountSource(String source) {
        this.account.AccountSource = source;
        return this;
    }

    public AccountBuilder withDunsNumber(String dunsNumber) {
        this.account.DunsNumber = dunsNumber;
        return this;
    }

    public AccountBuilder withTradestyle(String tradestyle) {
        this.account.Tradestyle = tradestyle;
        return this;
    }

    public AccountBuilder withNaicsCode(String naicsCode) {
        this.account.NaicsCode = naicsCode;
        return this;
    }

    public AccountBuilder withNaicsDesc(String naicsDesc) {
        this.account.NaicsDesc = naicsDesc;
        return this;
    }

    public AccountBuilder withYearStarted(String yearStarted) {
        this.account.YearStarted = yearStarted;
        return this;
    }

    public AccountBuilder withSicDesc(String sicDesc) {
        this.account.SicDesc = sicDesc;
        return this;
    }

    public AccountBuilder withCustomerPriority(String customerPriority) {
        this.account.CustomerPriority__c = customerPriority;
        return this;
    }

    public AccountBuilder withSLA(String sla) {
        this.account.SLA__c = sla;
        return this;
    }

    public AccountBuilder withActive(String active) {
        this.account.Active__c = active;
        return this;
    }

    public AccountBuilder withNumberOfLocations(Integer numberOfLocations) {
        this.account.NumberOfLocations__c = numberOfLocations;
        return this;
    }

    public AccountBuilder withUpsellOpportunity(String upsellOpportunity) {
        this.account.UpsellOpportunity__c = upsellOpportunity;
        return this;
    }

    public AccountBuilder withSLASerialNumber(String slaSerialNumber) {
        this.account.SLASerialNumber__c = slaSerialNumber;
        return this;
    }

    public AccountBuilder withSLAExpirationDate(Date slaExpirationDate) {
        this.account.SLAExpirationDate__c = slaExpirationDate;
        return this;
    }

    public Account build() {
        return this.account;
    }
}