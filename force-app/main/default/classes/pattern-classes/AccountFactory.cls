@isTest
public with sharing class AccountFactory {

    public static Account newStandardAccount() {
        Account account = new Account();
        account.Name = 'Standard Account';
        return account;
    }

    public static Account provideStandardAccount() {
        return provideStandardAccountsByQuantity(1)[0];
    }

    public static List<Account> provideStandardAccountsByQuantity(Integer numberOfAccounts) {
        List<Account> accounts = new List<Account>();

        for(Integer i = 1; i <= numberOfAccounts; i++) {
            Account account = newStandardAccount();
            account.name = account.name + ' ' + String.valueOf(i);
            accounts.add(account);
        }

        insert accounts;
        return accounts;
    }

    public static Account fromJson ( String payload ) {
		return (Account) JSON.deserialize(payload, Account.class);
	}

	public static List<Account> fromJsonArray ( String payload ) {
		return (List<Account>) JSON.deserialize(payload, List<Account>.class);
	}

	public static Map<Id,Account> fromJsonMapId( String payload ) {
		return ( Map<Id,Account> ) JSON.deserialize( payload, Map<Id,Account>.class );
	}
    
}