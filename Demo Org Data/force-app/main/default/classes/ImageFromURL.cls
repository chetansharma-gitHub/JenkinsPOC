public class ImageFromURL {
    public static Blob getImageFromUrl(String imageUrl) {
        HttpRequest request = new HttpRequest();
        //req.setEndpoint('https://cloud-westus.ocrsdk.com/v2/processImage?language=english&exportformat=txt');
        request.setEndpoint('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt4E4lM3FiVOR8qwYp8pxDONEswWmvbiyPFZj9PjSzicHK-nYDc7qMErqK&s=10');
        request.setMethod('GET');
        
        Http http = new Http();
        HTTPResponse res;
        try { 
            res = http.send(request);
            //System.debug('Response body ' + res.getBody());
        } catch (Exception exc) {
            System.debug('Generic exception ' + exc);
        }
        return res.getBodyAsBlob();
    }
}