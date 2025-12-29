@isTest
public without sharing class TriggerServiceInstanciatorMock extends TriggerServiceInstanciator{

    public override ITriggerService create(String className) {
        if (className == 'TriggerService1Mock') return new TriggerService1Mock();
        if (className == 'TriggerService2Mock') return new TriggerService2Mock();
        throw new TriggerServiceException('Service não encontrada: ' + className);
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