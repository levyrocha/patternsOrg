public with sharing class UpdateUnableToLockRowQuoteRulePathBatch implements Database.Batchable<SObject> {

    public QuoteRulesPathRepository quoteRulesPathRepositoryInstance = QuoteRulesPathRepository.getInstance();

    public UpdateUnableToLockRowQuoteRulePathBatch() {}

    public Database.QueryLocator start(Database.BatchableContext context) {
        Logger.log('UpdateUnableToLockRowQuoteRulePathBatch started.');
        return Database.getQueryLocator([
            SELECT 
                Id
                , Status__c
                , ErrorMessage__c
            FROM 
                QuoteRulesPath__c 
            WHERE 
                Status_c = 'Erro ao Executar Regra' AND ClassName_c != 'SupplierValidationRule'
        ]);
    }

    public void execute(Database.BatchableContext context, List<QuoteRulesPath__c> quoteRulesPaths) {
        Logger.log('UpdateUnableToLockRowQuoteRulePathBatch executed.');

        List<QuoteRulesPath_c> quoteRulesPathsToUpdate = new List<QuoteRulesPath_c>();

        for(QuoteRulesPath__c quoteRulesPath : quoteRulesPaths) {
            if(!quoteRulesPath.ErrorMessage__c.contains('UNABLE_TO_LOCK_ROW')) continue;

            quoteRulesPath.Status__c = 'Em Análise';
            quoteRulesPathsToUpdate.add(quoteRulesPath);
        }

        if(quoteRulesPathsToUpdate.isEmpty()) return;
        
        this.quoteRulesPathRepositoryInstance.updateAll(quoteRulesPathsToUpdate);
    }

    public void finish(Database.BatchableContext context) {
        Logger.log('UpdateUnableToLockRowQuoteRulePathBatch finished.');
    }
    
}