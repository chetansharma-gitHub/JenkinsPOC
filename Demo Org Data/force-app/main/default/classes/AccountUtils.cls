public with sharing class AccountUtils {
    public static List<Account> accountsByState(String stateAbbr){
	
		
        List<Account> stateSpecificAccounts = [SELECT Id,name  FROM Account WHERE BillingState = :stateAbbr];
        return stateSpecificAccounts;
    }
}