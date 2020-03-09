public class TrailBlazerPOC {
    private static final String TRAILHEAD_URL = 'https://trailhead.salesforce.com';
    
    public static Map<String, String> getPageContent( Map<String, String> requiredData, String profileString){
        //EndPoint Url String Generation 
        String endPointUrl = profileString.contains(TRAILHEAD_URL) ? profileString : (TRAILHEAD_URL + '/me/' + profileString);
       	//EndPoint URL Hit and getting Response
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endPointUrl);
        req.setMethod('GET');
        HttpResponse resBody = h.send(req); 
        
        //Apply Check on response body
        
        //Response URL Iteration 
        for(String queryParameter : requiredData.keySet()){
            String value = resBody.getBody().contains(queryParameter) ? (resBody.getBody().substringBetween(queryParameter + '>', '</').replace(',', '').trim()) : 'NA';
            requiredData.put(queryParameter, value);
        }
       	return requiredData;
    }

}