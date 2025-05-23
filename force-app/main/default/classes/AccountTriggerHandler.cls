public without sharing class AccountTriggerHandler extends TriggerHandler {

    private Example1Service example1Service;
    //private Example2Service example2Service;
    //private ExampleNService exampleNService;
    
    private List<Account> newAccounts;
    private Map<Id, Account> newAccountsById;

    private List<Account> oldAccounts;
    private Map<Id, Account> oldAccountsById;
  

    public AccountTriggerHandler() {
        this.example1Service = new Example1Service();

        this.newAccounts = (List<Account>) Trigger.new;
        this.newAccountsById = (Map<Id, Account>) Trigger.newMap;

        this.oldAccounts = (List<Account>) Trigger.old;
        this.oldAccountsById = (Map<Id, Account>) Trigger.oldMap;
    }

    public override void beforeInsert(){
        //example1Service.execute();
        //example2Service.execute();
        //exampleNService.execute();
    }

    public override void beforeUpdate(){}

    public override void beforeDelete(){}

    public override void afterInsert(){}

    public override void afterUpdate(){}

    public override void afterDelete(){}

    public override void afterUndelete(){}

}