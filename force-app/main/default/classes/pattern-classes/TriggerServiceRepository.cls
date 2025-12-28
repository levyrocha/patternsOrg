public virtual class TriggerServiceRepository extends AbstractRepository{

    public TriggerServiceRepository() {}

    public virtual List<TriggerService__mdt> getTriggerServicesByHandlerAndEvent(String triggerHandler, String triggerEvent) {
        return [
            SELECT 
                ServiceClass__c
                , ExecutionOrder__c 
            FROM 
                TriggerService__mdt 
            WHERE 
                TriggerHandler__c =: triggerHandler AND TriggerEvent__c =: triggerEvent AND IsActive__c = true 
            ORDER BY 
                ExecutionOrder__c
        ];
    }
}