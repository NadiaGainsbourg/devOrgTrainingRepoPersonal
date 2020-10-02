@isTest
private class AppleWatchTest {
   
   @isTest static void createOpportunity() {
   Opportunity myOpp = New Opportunity();
   myOpp.Name        = 'Swift Deal';
   myOpp.StageName   = 'Prospecting';
   myOpp.CloseDate   = Date.today();
   insert myOpp;
   }
}