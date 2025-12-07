public without sharing class AccountEnricher {
    
    public AccountEnricher() {}

    public Account enrichAccountWithInitialInfo(Account account) {
        return new AccountBuilder(account)
            .withName('Initial name')
            .build();
    }

}