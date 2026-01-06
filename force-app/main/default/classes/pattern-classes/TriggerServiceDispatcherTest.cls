@isTest
private class TriggerServiceDispatcherTest {

    @isTest
    static void executeServicesWithSuccess() {
        String triggerServicesPayload = '[{"ServiceClass__c":"TriggerService1Mock", "ExecutionOrder__c": 1, "TriggerHandler__c":"TestHandler", "TriggerEvent__c":"BEFORE_UPDATE", "IsActive__c": true}, {"ServiceClass__c":"TriggerService2Mock", "ExecutionOrder__c": 2, "TriggerHandler__c":"TestHandler", "TriggerEvent__c":"BEFORE_UPDATE", "IsActive__c": true}]';

        TriggerServiceDispatcher triggerServiceDispatcher = new TriggerServiceDispatcher('TestHandler', 'BEFORE_UPDATE');

        triggerServiceDispatcher.setTriggerServiceRepository(new TriggerServiceRepositoryMock(triggerServicesPayload));
        triggerServiceDispatcher.setTriggerServiceInstanciator(new TriggerServiceDispatcherTest.TriggerServiceInstanciatorMock());
        List<ITriggerService> executedServices = triggerServiceDispatcher.executeServices();

        Assert.areEqual(2, executedServices.size(), 'Should be executed 2 services');
        Assert.areEqual('TriggerService1Mock', ((TriggerServiceDispatcherTest.TriggerService1Mock) executedServices.get(0)).getClassName(), 'Should be the TriggerService1Mock class name');
        Assert.areEqual('TriggerService2Mock', ((TriggerServiceDispatcherTest.TriggerService2Mock) executedServices.get(1)).getClassName(), 'Should be the TriggerService2Mock class name');
    }

    @isTest
    static void executeServicesWithError() {
        String triggerServicesPayload = '[{"ServiceClass__c":"TriggerService1Mock", "ExecutionOrder__c": 1, "TriggerHandler__c":"TestHandler", "TriggerEvent__c":"BEFORE_UPDATE", "IsActive__c": true}, {"ServiceClass__c":"TriggerServiceNMock", "ExecutionOrder__c": 2, "TriggerHandler__c":"TestHandler", "TriggerEvent__c":"BEFORE_UPDATE", "IsActive__c": true}]';

        TriggerServiceDispatcher triggerServiceDispatcher = new TriggerServiceDispatcher('TestHandler', 'BEFORE_UPDATE');

        triggerServiceDispatcher.setTriggerServiceRepository(new TriggerServiceRepositoryMock(triggerServicesPayload));
        triggerServiceDispatcher.setTriggerServiceInstanciator(new TriggerServiceDispatcherTest.TriggerServiceInstanciatorMock());

        List<ITriggerService> executedServices;

        try {
            executedServices = triggerServiceDispatcher.executeServices();
            Assert.isFalse(true, 'It should give an error, so it shouldn\'t get here.');
        } catch (Exception e) {
            Assert.isTrue(e.getMessage().contains('TriggerServiceNMock'), 'Should be true');
        }
    }

    public class TriggerServiceInstanciatorMock extends TriggerServiceInstanciator{
        public override ITriggerService create(String className) {
            if (className == 'TriggerService1Mock') return new TriggerServiceDispatcherTest.TriggerService1Mock();
            if (className == 'TriggerService2Mock') return new TriggerServiceDispatcherTest.TriggerService2Mock();
            throw new TriggerServiceException('Service não encontrada: ' + className);
        }
    }

    public class TriggerService1Mock implements ITriggerService {
        public void execute() {}

        public String getClassName() {
            return this.toString().substringBefore(':');
        }
    }

    public class TriggerService2Mock implements ITriggerService {
        public void execute() {}

        public String getClassName() {
            return this.toString().substringBefore(':');
        }
    }
}