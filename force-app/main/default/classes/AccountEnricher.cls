public without sharing class AccountEnricher {

    public AccountEnricher() {}

    public Account enrichAccountWithInitialInfo(Account account) {
        return new AccountBuilder(account)
            .withName('Initial name')
            .build();
    }

    public List<Account> enrichAccountsWithInitialInfo(List<Account> accounts) {
        List<Account> accountsEnriched = new List<Account>();
        for(Account account : accounts) accountsEnriched.add(this.enrichAccountWithInitialInfo(account));
        return accountsEnriched;
    }

}