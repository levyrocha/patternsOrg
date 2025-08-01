public without sharing class ApexLimitExamples {
    public ApexLimitExamples() {}

    //Total number of SOQL queries issued
    public static void totalNumberOfSOQLQueriesIssued() {
        for(Integer i = 1 ; i <= 101 ; i++) {
            List<Account> accounts = [SELECT Id FROM Account LIMIT 1];
        }
    }

    //Total number of callouts (HTTP requests or web services calls) in a transaction
    public static void totalNumberOfCallout() {
        String cnpj = '00000000000191';

        String endpoint = 'https://publica.cnpj.ws/cnpj/' + cnpj;

        for(Integer i = 1 ; i <= 101 ; i++) {
            HttpRequest request = new HttpRequest();

            request.setEndpoint(endpoint);
            request.setMethod('GET');
            request.setHeader('Content-Type', 'application/json');
            request.setTimeout(2000);
    
            Http http = new Http();
            
            HttpResponse response = http.send(request);
    
            String body = response.getBody();
    
            CNPJWrapper result = CNPJWrapper.fromJson(body);
        }
       
    }
}