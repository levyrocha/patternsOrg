public with sharing class AccountTypeValidationService {

    private List<Account> newAccounts;
    private Map<Id, Account> newAccountsById;

    private List<Account> oldAccounts;
    private Map<Id, Account> oldAccountsById;

    private OpportunityRepository opportunityRepository;

    private AccountFilter accountFilter;

    Map<String, List<SObject>> result;

    public AccountTypeValidationService() {
        this.newAccounts = (List<Account>) Trigger.new;
        this.newAccountsById = (Map<Id, Account>) Trigger.newMap;

        this.oldAccounts = (List<Account>) Trigger.old;
        this.oldAccountsById = (Map<Id, Account>) Trigger.oldMap;

        this.opportunityRepository = new OpportunityRepository();

        this.accountFilter = new AccountFilter();

                
        this.result = new Map<String, List<SObject>>();
    }

    public Map<String, List<SObject>> execute() {
        List<Account> accounts = this.filterByChangeType();

        if(accounts.isEmpty()) return this.result;

        List<String> accountIds = Lists.byField(accounts, 'Id');

        List<Opportunity> opportunities = this.getOpportunitiesProspectingByAccountIds(accountIds);

        if(opportunities.isEmpty()) return this.result;

        Map<String, List<Opportunity>> opportunitiesByAccountId = this.buildOpportunitiesByAccountId(opportunities);

        for(String accountId : opportunitiesByAccountId.keySet()){
            List<Opportunity> opportunitiesOnMap = opportunitiesByAccountId.get(accountId);
            
            if(opportunitiesOnMap.isEmpty()) continue;

            Account account = newAccountsById.get(accountId);
            this.buildResult('account',account);
            account.addError('Ei pode não má');
        }
        
        return this.result;
    }


    public List<Account> filterByChangeType() {
        return this.accountFilter.filterByChangeType(this.newAccounts, this.oldAccountsById);
    }

    public List<Opportunity> getOpportunitiesProspectingByAccountIds(List<String> accountIds) {
        return this.opportunityRepository.getOpportunitiesProspectingByAccountIds(accountIds);
    }

    public Map<String, List<Opportunity>> buildOpportunitiesByAccountId(List<Opportunity> opportunities) {
        return (Map<String, List<Opportunity>>) Maps.groupBy('AccountId', opportunities);
    }

    private void buildResult(String sobjectName, SObject sobjectRecord) {
        this.result.put(sobjectName, new List<SObject>{sobjectRecord});
    }

    public Boolean isProspecting(Opportunity opportunity) {
        return opportunity.StageName == 'Prospecting';
    }
}