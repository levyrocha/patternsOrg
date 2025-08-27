@isTest
public class UpdateUnableToLockRowQRPJobTest {

    @isTest
    static void returnUnableToLockRowQRPJobId (){

        Test.startTest();

        String jobId = System.schedule('UpdateUnableToLockRowQuoteRulePathJob', '0 0 0 * * ?', new UpdateUnableToLockRowQuoteRulePathJob(2));

        Test.stopTest();

        System.assert( jobId != null, 'The job should be scheduled and executed');
    }

    @isTest
    static void itShouldReturnAnCronTrigger (){

        Test.startTest();

        UpdateUnableToLockRowQuoteRulePathJob.start(10);

        Test.stopTest();

        List<CronTrigger> jobs = new ScheduleHelper().findJobsByName('UpdateUnableToLockRowQuoteRulePathJob');

        System.assertEquals(1, jobs.size(), 'The job should be scheduled');
    }
}