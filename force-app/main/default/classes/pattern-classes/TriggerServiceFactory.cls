@isTest
public without sharing class TriggerServiceFactory {

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