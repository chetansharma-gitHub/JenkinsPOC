public with sharing class AccountUtils {
    public static List<Account> accountsByState(String stateAbbr){
	
		System.debug('New System debug in account util class');
		
        List<Account> stateSpecificAccounts = [SELECT Id,name  FROM Account WHERE BillingState = :stateAbbr];
        return stateSpecificAccounts;
    }
}