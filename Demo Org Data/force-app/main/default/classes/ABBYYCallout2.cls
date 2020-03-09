public class ABBYYCallout2 {
    public static void basicAuthCallout(){
        HttpRequest req = new HttpRequest();
        //req.setEndpoint('https://cloud-westus.ocrsdk.com/v2/processImage?language=english&exportformat=txt');
        req.setEndpoint('https://cloud-westus.ocrsdk.com' + '/v2/processImage?language=english&exportformat=txt');
        req.setMethod('POST');
        
        // Specify the required user name and password to access the endpoint 
        
        // As well as the header and header information 
        
        
        String username = 'dbbb581c-2c66-4ac6-881e-ef65bc5b5ce4';
        String password = 'Czm/NDE4KfHzxlEYRDf8diLC';
        
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' +
            EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        Blob imageblob = Blob.valueOf('https://app.box.com/s/nyayp4ookrkgg4wl5do1rk81dldnb5jy');
        System.debug('image size' + imageblob.size());
        req.setBodyAsBlob(ImageFromURL.getImageFromUrl('https://mainframe.ghost.io/content/images/2015/08/textimages-quote2.png'));
        
        // Create a new http object to send the request object 
        
        // A response object is generated as a result of the request   
        
        
        Http http = new Http();
        try { 
            HTTPResponse res = http.send(req);
            System.debug('Response body ' + res.getBody());
        } catch (Exception exc) {
            System.debug('Generic exception ' + exc);
        }
    }
    
    
}