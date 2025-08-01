public class QueueableExample implements Queueable {

    String typeTestQueueable;

    public QueueableExample(String typeTestQueueable) {
        this.typeTestQueueable = typeTestQueueable;
    }


    public void execute(QueueableContext context) {
        if(this.isSync()) System.debug('AccountQueueable');

        if(this.isAsync()) {
            System.enqueueJob(new QueueableExample('Async'));
            System.enqueueJob(new QueueableExample('Async'));
        }

        if(this.isTimeLimitExecution()) {

            Datetime startTime = Datetime.now();

            System.debug('#### startTime: ' + startTime);

            while (Datetime.now().getTime() - startTime.getTime() < 595000) {
                for (Integer i = 0; i < 10000; i++) {
                    System.debug('#### i: ' + i);
                }
                System.debug('#### endTime ' + Datetime.now().getTime());
            }
        }

    }

    private Boolean isSync() {
        return this.typeTestQueueable == 'Sync' ? true : false;
    }

    private Boolean isAsync() {
        return this.typeTestQueueable == 'Async' ? true : false;
    }

    private Boolean isTimeLimitExecution() {
        return this.typeTestQueueable == 'TimeLimitExecution' ? true : false;
    }
}