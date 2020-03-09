/***
* Class : RecordsController
* Description 
* @author : Chetan Sharma 
* Last modified By : Chetan Sharma
* */ 
public class RecordsController {
    
    /**
    * Method return SObject List of SObjectApiName type
    * @param : noOfRecords to return, sObjectApiName
    * @return : List of SObject
    */
    @AuraEnabled 
    public static List<SObject> getMostRecentRecords(Integer noOfRecords, String sObjectApiName) {
        String exceptionMessage = '';
        // Validate the method arguments
        if(noOfRecords != null && noOfRecords > 0 && String.isNotBlank(sObjectApiName) && Schema.getGlobalDescribe().get(sObjectApiName) != null) {
            // Handling Exceptions and in error condition throwing AuraHandledException, So that on Lightning component we can get proper error message.
            try {
                String queryString = 'SELECT Id, Name FROM ' + sObjectApiName 
                    + ' ORDER BY CreatedDate DESC limit ' + noOfRecords;
                return Database.query(queryString);
            } catch(Exception genericException) {
                exceptionMessage = genericException.getMessage();
            }
        } else if(noOfRecords == null) { 
            exceptionMessage = 'Invalid noOfRecords passed.';
        } else if(noOfRecords == 0) {
            exceptionMessage = 'Please enter positive value in noOfRecords.';
        } else {
            exceptionMessage = 'Invalid sObjectApiName Passed, Please enter valid Name.';
        }
        throw new AuraHandledException(exceptionMessage); 
    }
    

}