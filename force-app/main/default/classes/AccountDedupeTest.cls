@isTest
private class AccountDedupeTest {
   @isTest static void CreateAccount() {
   Account myAccount = new Account();
   myAccount.Name = 'JackTheCat';
   insert myAccount;
   }
}