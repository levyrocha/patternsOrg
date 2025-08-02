public without sharing class AccountFilter extends Filter {
    public AccountFilter() {}

    public List<Account> filterByChangeType(List<Account> accounts, Map<Id, Account> oldAccountsById) {
        List<String> changedFiedls = new List<String>{'Type'};
        return this.relevantChangeRecordsFilter(accounts, oldAccountsById, changedFiedls);
    }
}