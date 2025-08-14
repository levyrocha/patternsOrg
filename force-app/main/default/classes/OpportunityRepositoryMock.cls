@isTest
public class OpportunityRepositoryMock extends OpportunityRepository {

    String payload;

    public OpportunityRepositoryMock(String payload) {
        this.payload = payload;
    }

    public override List<Opportunity> getOpportunitiesWithStatusNotAllowedByAccountIds(List<String> accountIds) {
        return (List<Opportunity>) JSON.deserialize(this.payload, List<Opportunity>.class);
    }
}