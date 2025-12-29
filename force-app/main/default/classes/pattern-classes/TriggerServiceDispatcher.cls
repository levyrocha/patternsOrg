public without sharing class TriggerServiceDispatcher {

    private String triggerHandler;
    private String triggerEvent;

    private List<TriggerService__mdt> triggerServices = new List<TriggerService__mdt>();
    private List<ITriggerService> servicesToExecute = new List<ITriggerService>();

    private TriggerServiceRepository triggerServiceRepository = new TriggerServiceRepository();
    private TriggerServiceInstanciator triggerServiceInstanciator = new TriggerServiceInstanciator();

    public TriggerServiceDispatcher(String triggerHandler, String triggerEvent) {
        this.setTriggerHandler(triggerHandler);
        this.setTriggerEvent(triggerEvent);
    }

    public List<ITriggerService> executeServices() {
        if(String.isBlank(this.triggerHandler)) throw new TriggerServiceException('Preencha o triggerHandler');
        if(String.isBlank(this.triggerEvent)) throw new TriggerServiceException('Preencha o triggerEvent');
        this.setTriggerServices(this.provideTriggerServices());
        if(this.notHasTriggerServices()) return new List<ITriggerService>();
        this.buildServicesToExecute();
        for (ITriggerService service : this.getServicesToExecute()) service.execute();
        return this.getServicesToExecute();
    }

    private void setTriggerHandler(String triggerHandler) {
        this.triggerHandler = triggerHandler;
    }

    private void setTriggerEvent(String triggerEvent) {
        this.triggerEvent = triggerEvent;
    }

    private void setTriggerServices(List<TriggerService__mdt> triggerServices) {
        this.triggerServices = triggerServices;
    }

    private void setServicesToExecute(ITriggerService iTriggerService) {
        this.servicesToExecute.add(iTriggerService);
    }

    private String getTriggerHandler() {
        return this.triggerHandler;
    }

    private String getTriggerEvent() {
        return this.triggerEvent;
    }

    private List<TriggerService__mdt> getTriggerServices() {
        return this.triggerServices;
    }

    private List<ITriggerService> getServicesToExecute() {
        return this.servicesToExecute;
    }

    private List<TriggerService__mdt> provideTriggerServices() {
        return this.triggerServiceRepository.getTriggerServicesByHandlerAndEvent(this.getTriggerHandler(), this.getTriggerEvent());
    }

    private Boolean notHasTriggerServices() {
        return this.getTriggerServices().isEmpty();
    }

    private void buildServicesToExecute() {
        for (TriggerService__mdt triggerService : this.getTriggerServices()) this.setServicesToExecute(this.triggerServiceInstanciator.create(triggerService.ServiceClass__c));
    }

    public void setTriggerServiceRepository(TriggerServiceRepository triggerServiceRepositoryMock) {
        this.triggerServiceRepository = triggerServiceRepositoryMock;
    }

    public void setTriggerServiceInstanciator(TriggerServiceInstanciator triggerServiceInstanciatorMock) {
        this.triggerServiceInstanciator = triggerServiceInstanciatorMock;
    }
}