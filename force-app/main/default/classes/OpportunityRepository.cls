public with sharing class OpportunityRepository extends AbstractRepository {
    public OpportunityRepository() {}

    public virtual List<Opportunity> getOpportunitiesProspectingByAccountIds(List<String> accountIds) {
        return [
            SELECT
                Id
                , StageName
                , AccountId
            FROM
                Opportunity
            WHERE
                AccountId IN : accountIds
            AND
                StageName = 'Prospecting'
        ];
    }
}