public abstract without sharing class TriggerBase {

    public List<SObject> newSObjects;
    public Map<Id, SObject> newSObjectsById;
    public List<SObject> oldSObjects;
    public Map<Id, SObject> oldSObjectsById;

    public TriggerBase() {
        this.newSObjects = Trigger.new;
        this.newSObjectsById  = Trigger.newMap;
        this.oldSObjects = Trigger.old;
        this.oldSObjectsById  = Trigger.oldMap;
    }
}