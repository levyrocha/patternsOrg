public with sharing class UpdateUnableToLockRowQuoteRulePathJob implements Schedulable {
    private Integer minutes;

    public UpdateUnableToLockRowQuoteRulePathJob( Integer minutes ) {
        this.minutes = minutes;
    }

    public void execute (SchedulableContext context) {
        Logger.log('UpdateUnableToLockRowQuoteRulePathJob executed');
        Database.executeBatch( new UpdateUnableToLockRowQuoteRulePathBatch(), 10 );
        this.finish();
    }

    public void finish () {
        Logger.log('UpdateUnableToLockRowQuoteRulePathJob finished');
        start(this.minutes);
    }

    public static void start( Integer minutes ) {
        abort();
        Logger.log('UpdateUnableToLockRowQuoteRulePathJob started');
        new ScheduleHelper().scheduleIntoNextMinutes( new UpdateUnableToLockRowQuoteRulePathJob(minutes), minutes  );
    }

    public static void abort() {
        new ScheduleHelper().abort('UpdateUnableToLockRowQuoteRulePathJob');
        Logger.log('UpdateUnableToLockRowQuoteRulePathJob aborted');
    }
}