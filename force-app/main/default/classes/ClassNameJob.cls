public with sharing class ClassNameJob implements Schedulable {
    private Integer minutes;

    public ClassNameJob( Integer minutes ) {
        this.minutes = minutes;
    }

    public void execute (SchedulableContext context) {
        Logger.log('ClassNameJob executed');
        Database.executeBatch( new ClassNameBatch(), 10 );
        this.finish();
    }

    public void finish () {
        Logger.log('ClassNameJob finished');
        start(this.minutes);
    }

    public static void start( Integer minutes ) {
        abort();
        Logger.log('ClassNameJob started');
        new ScheduleHelper().scheduleIntoNextMinutes( new ClassNameJob(minutes), minutes  );
    }

    public static void abort() {
        new ScheduleHelper().abort('ClassNameJob');
        Logger.log('ClassNameJob aborted');
    }
}