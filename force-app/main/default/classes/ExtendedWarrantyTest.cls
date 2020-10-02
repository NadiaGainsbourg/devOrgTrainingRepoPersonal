@isTest 
private class ExtendedWarrantyTest {
@isTest static void CreateCase() {

Case myCase = new Case();
myCase.Product_Purchase_Date__c = Date.today();
myCase.Product_Has_Extended_Warranty__c = true;
myCase.Product_Total_Warranty_Days__c = 10;
insert myCase;
  }

}