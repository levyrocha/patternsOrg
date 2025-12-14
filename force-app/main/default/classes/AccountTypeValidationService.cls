public without sharing class AccountTypeValidationService {

    public List<Account> newAccounts;
    public Map<Id, Account> newAccountsById;
    public List<Account> oldAccounts;
    public Map<Id, Account> oldAccountsById;
    
    public OpportunityRepository opportunityRepository;
    public AccountFilter accountFilter;

    public List<Account> accountsToPerform;
    public List<Opportunity> opportunitiesToPerform;

    public AccountTypeValidationService() {
        this.newAccounts = (List<Account>) Trigger.new;
        this.newAccountsById = (Map<Id, Account>) Trigger.newMap;
        this.oldAccounts = (List<Account>) Trigger.old;
        this.oldAccountsById = (Map<Id, Account>) Trigger.oldMap;

        this.accountFilter = new AccountFilter();
        this.opportunityRepository = new OpportunityRepository();

        this.accountsToPerform = new List<Account>();
        this.opportunitiesToPerform = new List<Opportunity>();
    }

    public void execute() {
        if(this.notHasAccountsToPerform()) return;
        if(this.notHasOpportunitiesToPerform()) return;
        this.performCheckingHasOpportunitiesWithStatusNotAllowed();        
    }

    public Boolean notHasAccountsToPerform() {
        this.accountsToPerform = this.filterByChangeType();
        return this.accountsToPerform.isEmpty();
    }

    public List<Account> filterByChangeType() {
        return this.accountFilter.filterByChangeType(this.newAccounts, this.oldAccountsById);
    }

    public Boolean notHasOpportunitiesToPerform() {
        this.opportunitiesToPerform = this.getOpportunitiesWithStatusNotAllowedByAccountIds(this.getAccountIdsToPerform());
        return this.opportunitiesToPerform.isEmpty();
    }

    public List<Opportunity> getOpportunitiesWithStatusNotAllowedByAccountIds(List<String> accountIds) {
        List<Opportunity> opportunities = this.opportunityRepository.getOpportunitiesWithStatusNotAllowedByAccountIds(accountIds);
        return opportunities;
    }

    public List<String> getAccountIdsToPerform() {
        return Lists.byField(this.accountsToPerform, 'Id');
    }

    public void performCheckingHasOpportunitiesWithStatusNotAllowed() {
        Map<String, List<Opportunity>> opportunitiesByAccountIdToPerform = (Map<String, List<Opportunity>>) Maps.groupBy('AccountId', this.opportunitiesToPerform);

        for(String accountId : opportunitiesByAccountIdToPerform.keySet()) {
            if(this.isAccountWithoutOpportunitiesWithStatusNotAllowed(opportunitiesByAccountIdToPerform.get(accountId))) continue;
            this.addAccountError(this.newAccountsById.get(accountId));
        }
    }

    public Boolean isAccountWithoutOpportunitiesWithStatusNotAllowed(List<Opportunity> opportunities) {
        return opportunities.isEmpty();
    }

    public void addAccountError(Account account) {
        account.addError('Não é possível atualizar o tipo, pois essa conta possui opportunidades pendentes');
    }

    public void setOpportunityRepository( OpportunityRepository opportunityRepositoryMock) {
        this.opportunityRepository = opportunityRepositoryMock;
    }
}