public without sharing class ExampleObjectTriggerHandler extends TriggerHandler {

    private Example1Service example1Service;
    //private Example2Service example2Service;

    private List<ExampleObject__c> newExampleObjects;
    private Map<Id, ExampleObject__c> newExampleObjectsById;

    private List<ExampleObject__c> oldExampleObjects;
    private Map<Id, ExampleObject__c> oldExampleObjectsById;
  

    public ExampleObjectTriggerHandler() {
        this.example1Service = new Example1Service();

        this.newExampleObjects = (List<ExampleObject__c>) Trigger.new;
        this.newExampleObjectsById = (Map<Id, ExampleObject__c>) Trigger.newMap;

        this.oldExampleObjects = (List<ExampleObject__c>) Trigger.old;
        this.oldExampleObjectsById = (Map<Id, ExampleObject__c>) Trigger.oldMap;
    }

    public override void beforeInsert(){}

    public override void beforeUpdate(){}

    public override void beforeDelete(){}

    public override void afterInsert(){}

    public override void afterUpdate(){}

    public override void afterDelete(){}

    public override void afterUndelete(){}

}