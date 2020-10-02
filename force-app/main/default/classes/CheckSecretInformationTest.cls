@isTest
private class CheckSecretInformationTest {
    @isTest static void createCaseWithSecretInfo(){
       // create a case with all required inputs
       Case myCase        = new Case();
       myCase.Subject     = 'Help!!!'; 
       myCase.Description = 'My bodyweight is 180 pounds';
       insert myCase;
       System.debug('case' + myCase.Id + 'created with description' + myCase.Description);
   }

}