@isTest
public class TriggerServiceRepositoryMock extends TriggerServiceRepository {

    String payload;

    public TriggerServiceRepositoryMock(String payload) {
        this.payload = payload;
    }

    public override List<TriggerService__mdt> getTriggerServicesByHandlerAndEvent(String triggerHandler, String triggerEvent) {
        return (List<TriggerService__mdt>) JSON.deserialize(this.payload, List<TriggerService__mdt>.class);
    }
}