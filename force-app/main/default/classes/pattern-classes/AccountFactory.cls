@isTest
public with sharing class AccountFactory {

	public static Account newAccount(String name) {
        return new Account(
            Name = name
        );
    }

    public static List<Account> createAccount(Account account) {
        List<Account> accounts = new List<Account>();
        accounts.add(account);
        return createAccounts(accounts);
    }

    public static List<Account> createAccounts(List<Account> accounts) {
        insert accounts;
        return accounts;
    }

    public static List<Account> provideAccountsByQuantity(Integer quantity) {
        List<Account> accounts = new List<Account>();

        for(Integer i = 1; i <= quantity; i++) {
            String name = 'Account' + String.valueOf(i);
            Account account = newAccount(name);
            accounts.add(account);
        }

        return createAccounts(accounts);
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