public without sharing class CNPJCallout {
    public CNPJCallout() {}

    public static CNPJWrapper getCNPJInfos(String cnpj) {
        String endpoint = 'https://publica.cnpj.ws/cnpj/' + cnpj;
        
        HttpRequest request = new HttpRequest();

        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        request.setTimeout(2000);

        Http http = new Http();

        HttpResponse response = http.send(request);

        String body = response.getBody();

        CNPJWrapper result = CNPJWrapper.fromJson(body);

        return result;
    }
}