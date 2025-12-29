public virtual class TriggerServiceInstanciator {
    
    public virtual ITriggerService create(String className) {
        Type type = Type.forName(className);
        if (type == null) throw new TriggerServiceException('Service não encontrada: ' + className);
        return (ITriggerService) type.newInstance();
    }
    
}