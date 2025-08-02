public without sharing class AccountHandler extends TriggerHandler {

    private AccountTypeValidationService accountTypeValidationService;

    //private Example1Service example1Service;
    //private Example2Service example2Service;
    //private ExampleNService exampleNService;

    public AccountHandler() {    
        this.accountTypeValidationService = new AccountTypeValidationService();
    }

    public override void beforeInsert(){
        //example1Service.execute();
        //example2Service.execute();
        //exampleNService.execute();
    }

    public override void beforeUpdate(){
        this.accountTypeValidationService.execute();
    }

    public override void beforeDelete(){}

    public override void afterInsert(){}

    public override void afterUpdate(){}

    public override void afterDelete(){}

    public override void afterUndelete(){}

}