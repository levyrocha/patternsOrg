public without sharing class AccountRepository {

    public virtual List<Account> getAccountsByIds(List<Id> accountIds) {
        return [
            SELECT 
                Id
                , Name
            FROM 
                Account
            WHERE 
                Id IN : accountIds
        ];
    }

}