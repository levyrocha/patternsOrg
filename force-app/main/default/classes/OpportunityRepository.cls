public virtual class OpportunityRepository extends AbstractRepository {
    public OpportunityRepository() {}

    public virtual List<Opportunity> getOpportunitiesWithStatusNotAllowedByAccountIds(List<String> accountIds) {
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