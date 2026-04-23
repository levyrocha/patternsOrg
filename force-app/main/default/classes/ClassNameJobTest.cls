@isTest
public class ClassNameJobTest {

    @isTest
    static void returnClassNameJobId () {

        Test.startTest();

        String jobId = System.schedule('ClassNameJob', '0 0 0 * * ?', new ClassNameJob(2));

        Test.stopTest();

        System.assert( jobId != null, 'The job should be scheduled and executed');
    }

    @isTest
    static void itShouldReturnAnCronTrigger () {

        Test.startTest();

        ClassNameJob.start(10);

        Test.stopTest();

        List<CronTrigger> jobs = new ScheduleHelper().findJobsByName('ClassNameJob');

        System.assertEquals(1, jobs.size(), 'The job should be scheduled');
    }
}