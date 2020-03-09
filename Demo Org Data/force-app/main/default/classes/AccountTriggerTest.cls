@isTest
public class AccountTriggerTest {
    @testSetup static void setup(){
        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name = 'Test Account ' + i, BillingState = 'CA');
            accts.add(acct);
        } 
        insert accts;
    }
    
    @isTest static void TestCreateNewAccountInBulk() {
        List<Account> accounts = [SELECT Id,ShippingState FROM Account WHERE ShippingState != 'CA'];
        System.assert(accounts.size()==0);
    }
}