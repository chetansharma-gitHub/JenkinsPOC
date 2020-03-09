public class ABBYYCallout1 {
    
    public static HTTPResponse uploadFile() {
        Attachment file = new Attachment();
        file.Name = 'ABC.png';
        file.Body = Blob.valueOf('https://mainframe.ghost.io/content/images/2015/08/textimages-image-2.png');
        
        String boundary = '__boundary__xxx';
        String header = '--'+ boundary +'\n'+
        + 'Content-Disposition: form-data; name="data"; filename="'+file.name
            +'"\nContent-Type: application/octet-stream\n\n';
        String footer = '\n--'+boundary+'--';
        System.debug('Body before encoding ' + file.Body);
        
        String body = EncodingUtil.base64Encode(file.Body); //encodes the blob into a base64 encoded String body = header + body + footer;
        body = header + body + footer;
        
        System.debug('Body ' + body);
        HttpRequest req = new HttpRequest();
        
        String username = 'dbbb581c-2c66-4ac6-881e-ef65bc5b5ce4';
        String password = 'Czm/NDE4KfHzxlEYRDf8diLC';
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'BASIC ' +
            EncodingUtil.base64Encode(headerValue);
        
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type','multipart/form-data; boundary='+boundary);
        req.setMethod('POST');
        req.setEndpoint('https://cloud-westus.ocrsdk.com' + '/v2/processImage?language=english&exportformat=txt');   
        req.setBody(body);
        
        //req.setTimeout(60000);
        req.setHeader('Content-Length',String.valueof(body.length()));
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug('Response body ' + res.getBody());
        return res;
    }
    
}