public with sharing class AccountTriggerHandler {
    
    public static void CreateAccounts(List<Account> accounts){
        for(Account accountObj : accounts){
            accountObj.ShippingState = accountObj.BillingState;
        }
    }
    
    public static void printAccounts(List<Account> accounts) {
         for(Account accountObj : accounts){
            System.debug('Name ' + accountObj.Name);
        }
    }
    
}