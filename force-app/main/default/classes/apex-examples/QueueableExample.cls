public class QueueableExample implements Queueable {

    ExampleQueueableTypes exampleQueueableType;

    public QueueableExample(ExampleQueueableTypes exampleQueueableType) {
        this.exampleQueueableType = exampleQueueableType;
    }

    public void execute(QueueableContext context) {

        if(this.isSync()) System.debug('AccountQueueable');

        if(this.isAsync()) {
            System.enqueueJob(new QueueableExample(this.exampleQueueableType));
            System.enqueueJob(new QueueableExample(this.exampleQueueableType));
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
        return this.exampleQueueableType.name() == ExampleQueueableTypes.SYNC.name();
    }

    private Boolean isAsync() {
        return this.exampleQueueableType.name() == ExampleQueueableTypes.ASYNC.name();
    }

    private Boolean isTimeLimitExecution() {
        return this.exampleQueueableType.name() == ExampleQueueableTypes.TIME_LIMIT_EXECUTION.name();
    }

}