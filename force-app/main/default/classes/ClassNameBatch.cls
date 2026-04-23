public with sharing class ClassNameBatch implements Database.Batchable<SObject>, Database.AllowsCallouts, Database.Stateful {

    public ClassNameBatch() {}

    public Database.QueryLocator start(Database.BatchableContext context) {
        Logger.log('Batch started.');
        return Database.getQueryLocator([
            SELECT 
                Id
            FROM 
                Account
        ]);
    }

    public void execute(Database.BatchableContext context, List<Object> objects) {
        Logger.log('Batch executed.');
        //Developer here
    }

    public void finish(Database.BatchableContext context) {
        Logger.log('Batch finished.');
    }
    
}