public with sharing class AccountUtils {
    public static List<Account> accountsByState(String stateAbbr){

        
        System.debug('Here is the content');
		System.debug('Here is the content');
		System.debug('Here is the content');
		System.debug('Here is the content');
        
        
        List<Account> stateSpecificAccounts = [SELECT Id,name  FROM Account WHERE BillingState = :stateAbbr];
        return stateSpecificAccounts;
    }
}