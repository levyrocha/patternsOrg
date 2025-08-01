public without sharing class ApexLimitExamples {
    public ApexLimitExamples() {}

    //Total number of SOQL queries issued
    public void totalNumberOfSOQLQueriesIssued() {
        for(Integer i = 1 ; i <= 101 ; i++) {
            List<Account> accounts = [SELECT Id FROM Account LIMIT 1];
        }
    }

    //Total number of records retrieved by SOQL queries
    public void totalNumberOfRecordsRetrievedBySOQLQueries () {
        List<Account> accounts = [SELECT Id FROM Account];
    }

    //Total number of records retrieved by Database.getQueryLocator
    public void totalNumberOfRecordsRetrievedByDatabaseGetQueryLocator() {
        String query = 'SELECT Id FROM Account LIMIT 10001';
        Database.getQueryLocator(query);
    }

    //Total number of callouts (HTTP requests or web services calls) in a transaction
    //https://docs.cnpj.ws/referencia-de-api/api-publica/consultando-cnpj
    public void totalNumberOfCallout() {
        for(Integer i = 1 ; i <= 101 ; i++) {
            this.calloutExample();
        }
    }

    private void calloutExample() {
        String cnpj = '00000000000191';

        String endpoint = 'https://publica.cnpj.ws/cnpj/' + cnpj;
        
        HttpRequest request = new HttpRequest();

        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        request.setTimeout(30000);

        Http http = new Http();

        HttpResponse response = http.send(request);

        String body = response.getBody();

        CNPJWrapper result = CNPJWrapper.fromJson(body);
    }

    //Maximum number of methods with the future annotation allowed per Apex invocation
    public void maximumNumberOfMethodsWithTheFutureAnnotationAllowedPerApexInvocation() {
        for(Integer i = 1 ; i <= 51 ; i++) {
            futureMethod();
        }
    }

    @future
    private static void futureMethod() {
        System.debug('Future Method');
    }

    //Maximum number of Apex jobs added to the queue with System.enqueueJob Sync
    public void maximumNumberOfApexJobsAddedToTheQueueWithSystemEnqueueJobSync() {
        for(Integer i = 1 ; i <= 51 ; i++) {
            System.enqueueJob(new QueueableExample(QueueableExample.ExampleQueueableType.SYNC));
        }
    }

    //Maximum number of Apex jobs added to the queue with System.enqueueJob Async
    public void maximumNumberOfApexJobsAddedToTheQueueWithSystemEnqueueJobAsync() {
        System.enqueueJob(new QueueableExample(QueueableExample.ExampleQueueableType.ASYNC));
    }

    //Maximum execution time for each Apex transaction
    public void maximumExecutionTimeForEachApexTransaction() {
        System.enqueueJob(new QueueableExample(QueueableExample.ExampleQueueableType.TIME_LIMIT_EXECUTION));
    }
}