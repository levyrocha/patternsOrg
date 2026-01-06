@isTest
public without sharing class TriggerServiceFactory {

	public class TriggerServiceInstanciatorMock extends TriggerServiceInstanciator{
        public override ITriggerService create(String className) {
            if (className == 'TriggerService1Mock') return new TriggerServiceFactory.TriggerService1Mock();
            if (className == 'TriggerService2Mock') return new TriggerServiceFactory.TriggerService2Mock();
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

  	public static TriggerService__mdt fromJson (String payload) {
		return (TriggerService__mdt) JSON.deserialize(payload, TriggerService__mdt.class);
	}

	public static List<TriggerService__mdt> fromJsonArray (String payload) {
		return (List<TriggerService__mdt>) JSON.deserialize(payload, List<TriggerService__mdt>.class);
	}

	public static Map<Id, TriggerService__mdt> fromJsonMapId(String payload) {
		return ( Map<Id, TriggerService__mdt> ) JSON.deserialize( payload, Map<Id, TriggerService__mdt>.class );
	}
}