public without sharing class AccountHandler extends TriggerHandler {

    private Example1Service example1Service;
    private Example2Service example2Service;
    //private ExampleNService exampleNService;
    private AccountTypeValidationService accountTypeValidationService;

    public AccountHandler() {
        if(this.isBypassed()) return;
        this.example1Service = new Example1Service();
        this.example2Service = new Example2Service();
        //this.exampleNService = new ExampleNService();
        this.accountTypeValidationService = new AccountTypeValidationService();
    }

    public override void beforeInsert() {}

    public override void beforeUpdate() {
        this.example1Service.execute();
        this.example2Service.execute();
        //this.exampleNService.execute();
        this.accountTypeValidationService.execute();
    }

    public override void beforeDelete() {}

    public override void afterInsert() {}

    public override void afterUpdate() {}

    public override void afterDelete() {}

    public override void afterUndelete() {}

    private Boolean isBypassed() {
        return TriggerHandler.isBypassed(this.toString().substringBefore(':'));
    }
}