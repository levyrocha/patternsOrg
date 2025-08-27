@isTest
public class UpdateUnableToLockRowQRPBatchTest {

    @isTest
    public static void successScenario() {

        List<BusinessRulesValidation_c> businessRulesValidations = new List<BusinessRulesValidation_c>();

        BusinessRulesValidation_c businessRulesValidation1 = new BusinessRulesValidation_c();
        businessRulesValidation1.ClassName__c = 'ClassTest1';

        BusinessRulesValidation_c businessRulesValidation2 = new BusinessRulesValidation_c();
        businessRulesValidation2.ClassName__c = 'ClassTest2';

        BusinessRulesValidation_c businessRulesValidation3 = new BusinessRulesValidation_c();
        businessRulesValidation3.ClassName__c = 'SupplierValidationRule';
        
        businessRulesValidations.addAll(new List<BusinessRulesValidation__c>{businessRulesValidation1, businessRulesValidation2, businessRulesValidation3});

        insert businessRulesValidations;

        List<BusinessRulesSetting_c> businessRulesSettings = new List<BusinessRulesSetting_c>();

        BusinessRulesSetting_c businessRulesSetting1 = new BusinessRulesSetting_c();

        BusinessRulesSetting_c businessRulesSetting2 = new BusinessRulesSetting_c();

        BusinessRulesSetting_c businessRulesSetting3 = new BusinessRulesSetting_c();
        
        businessRulesSettings.addAll(new List<BusinessRulesSetting__c>{businessRulesSetting1, businessRulesSetting2, businessRulesSetting3});

        insert businessRulesSettings;

        List<BusinessRulesPath_c> businessRulesPaths = new List<BusinessRulesPath_c>();

        BusinessRulesPath_c businessRulesPath1 = new BusinessRulesPath_c();
        businessRulesPath1.BusinessRulesValidation__c = businessRulesValidations[0].Id;
        businessRulesPath1.BusinessRulesSetting__c = businessRulesSettings[0].Id;

        BusinessRulesPath_c businessRulesPath2 = new BusinessRulesPath_c();
        businessRulesPath2.BusinessRulesValidation__c = businessRulesValidations[1].Id;
        businessRulesPath2.BusinessRulesSetting__c = businessRulesSettings[1].Id;

        BusinessRulesPath_c businessRulesPath3 = new BusinessRulesPath_c();
        businessRulesPath3.BusinessRulesValidation__c = businessRulesValidations[2].Id;
        businessRulesPath3.BusinessRulesSetting__c = businessRulesSettings[2].Id;

        businessRulesPaths.addAll(new List<BusinessRulesPath__c>{businessRulesPath1, businessRulesPath2, businessRulesPath3});

        insert businessRulesPaths;

        List<QuoteRulesPath_c> quoteRulesPaths = new List<QuoteRulesPath_c>();

        Quote quote = (Quote) QuoteFactory.directSellQuoteIntegratedScenario().get('quote');

        QuoteRulesPath_c quoteRulesPath1 = new QuoteRulesPath_c();
        quoteRulesPath1.ErrorMessage__c = 'UNABLE_TO_LOCK_ROW';
        quoteRulesPath1.Status__c = 'Erro ao Executar Regra';
        quoteRulesPath1.BusinessRulesPath__c = businessRulesPaths[0].Id;
        quoteRulesPath1.Quote__c = quote.Id;

        QuoteRulesPath_c quoteRulesPath2 = new QuoteRulesPath_c();
        quoteRulesPath2.ErrorMessage__c = 'UNABLE_TO_LOCK_ROW';
        quoteRulesPath2.Status__c = 'Erro ao Executar Regra';
        quoteRulesPath2.BusinessRulesPath__c = businessRulesPaths[1].Id;
        quoteRulesPath2.Quote__c = quote.Id;

        QuoteRulesPath_c quoteRulesPath3 = new QuoteRulesPath_c();
        quoteRulesPath3.ErrorMessage__c = '';
        quoteRulesPath3.Status__c = 'Erro ao Executar Regra';
        quoteRulesPath3.BusinessRulesPath__c = businessRulesPaths[2].Id;
        quoteRulesPath3.Quote__c = quote.Id;

        quoteRulesPaths.addAll(new List<QuoteRulesPath__c>{quoteRulesPath1, quoteRulesPath2, quoteRulesPath3});
        
        TriggerHandler.bypass('QuoteRulesPathHandler');

        insert quoteRulesPaths;

        Test.startTest();

        Database.executeBatch( new UpdateUnableToLockRowQuoteRulePathBatch(), 10 );

        Test.stopTest();

        List<QuoteRulesPath_c> quoteRulesPathsAfterBatch = [SELECT Id, Statusc, ErrorMessagec FROM QuoteRulesPathc WHERE Status_c = 'Em Análise'];

        Assert.isTrue(quoteRulesPathsAfterBatch.size() == 2);
    }
}