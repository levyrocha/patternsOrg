public without sharing class AccountHandler extends TriggerHandler {

    public AccountHandler() {
        if(this.isBypassed()) return;
    }

    public override void beforeInsert() {
        new TriggerServiceDispatcher(this.getClassName(), 'BEFORE_INSERT').toDispatche();
    }

    public override void beforeUpdate() {
        new TriggerServiceDispatcher(this.getClassName(), 'BEFORE_UPDATE').toDispatche();
    }

    public override void beforeDelete() {
        new TriggerServiceDispatcher(this.getClassName(), 'BEFORE_DELETE').toDispatche();
    }

    public override void afterInsert() {
        new TriggerServiceDispatcher(this.getClassName(), 'AFTER_INSERT').toDispatche();
    }

    public override void afterUpdate() {
        new TriggerServiceDispatcher(this.getClassName(), 'AFTER_UPDATE').toDispatche();
    }

    public override void afterDelete() {
        new TriggerServiceDispatcher(this.getClassName(), 'AFTER_DELETE').toDispatche();
    }

    public override void afterUndelete() {
        new TriggerServiceDispatcher(this.getClassName(), 'AFTER_UNDELETE').toDispatche();
    }

    private Boolean isBypassed() {
        return TriggerHandler.isBypassed(this.getClassName());
    }

    private String getClassName() {
        return this.toString().substringBefore(':');
    }
}