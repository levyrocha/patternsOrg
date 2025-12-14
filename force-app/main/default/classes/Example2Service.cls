public without sharing class Example2Service {
    public List<Account> newAccounts;
    public Map<Id, Account> newAccountsById;
    public List<Account> oldAccounts;
    public Map<Id, Account> oldAccountsById;

    public Example2Service() {
        this.newAccounts = (List<Account>) Trigger.new;
        this.newAccountsById = (Map<Id, Account>) Trigger.newMap;
        this.oldAccounts = (List<Account>) Trigger.old;
        this.oldAccountsById = (Map<Id, Account>) Trigger.oldMap;
    }

    public void execute() {}
}