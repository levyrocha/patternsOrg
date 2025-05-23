@isTest
public with sharing class AccountRepositoryMock extends AccountRepository {

    String payload;

    public AccountRepositoryMock(){}

    public AccountRepositoryMock(String payload) {
        this.payload = payload;
    }

    override public List<Account> getAccountsByIds(List<Id> accountIds) {
        return (List<Account>) AccountFactory.fromJsonArray(payload);
    }

    override public SObject save(SObject aggregates) {
        return aggregates;
    }

}