public class BasicHttpCallout {
    /**
     * Method to make GET Callout.
     * @return HttpResponse
    */
    public static HttpResponse makeGetCallout() {
        // Create Http request instance
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        //Set endpoint Url
        request.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            //Printing Data using system log
            for(String key : results.keySet()) {
                System.debug( key + ' = ' + results.get(key));
            }
        }
        return response;
    }
    
}