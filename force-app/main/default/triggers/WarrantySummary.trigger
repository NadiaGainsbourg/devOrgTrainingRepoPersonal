trigger WarrantySummary on Case (after insert) {

  String endingStatement = 'Have a nice day!';
  
  for (Case myCase: Trigger.new) {
      //don't execute if one of the fields is null
      if (myCase.Product_Purchase_Date__c != null && myCase.Product_Total_Warranty_Days__c != null && myCase.Product_Has_Extended_Warranty__c != null){
        /*set up variables to use in the Summary field later*/
        String purchaseDate           = myCase.Product_Purchase_Date__c.format();
        String createdDate        = DateTime.now().format(); /*use "DateTime.now()" because the time of the event is "before insert"*/
        Integer warrantyDays        = myCase.Product_Total_Warranty_Days__c.intValue();
        Decimal warrantyPercentage  = (100*(myCase.Product_Purchase_Date__c.daysBetween(Date.today()) / myCase.Product_Total_Warranty_Days__c)).setScale(2); /*have to use days between, can't simply subtract to avoid negative numbers*/
        
        Boolean hasExtendedWarranty = myCase.Product_Has_Extended_Warranty__c;
    
        /*populate the summary field*/
        myCase.Warranty_Summary__c = 'Product purchased on ' + purchaseDate + ' '
                                   + 'and case created on ' + createdDate + '.\n'   /*this ".\n" creates a nice line break*/
                                   + 'Warranty is for ' + warrantyDays + ' '
                                   + 'days and is ' + warrantyPercentage + '% through its warranty period.\n'
                                   + 'Extended warranty: ' + hasExtendedWarranty + '\n' 
                                   +  endingStatement;
       }
    }
}

/* Write this out first to get the structure right! Product purchased on <<Purchase Date>> and case created on <<Case Created Date>>.
Warranty is for <<Warranty Total Days>> and is <<Warranty Percentage>>% through its warranty period.
Extended Warranty: <<Has Extended Warranty>> 
Have a nice day!*/