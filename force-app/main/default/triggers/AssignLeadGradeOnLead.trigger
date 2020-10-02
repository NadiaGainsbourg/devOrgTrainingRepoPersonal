trigger AssignLeadGradeOnLead on Lead (before insert, before update) {
    for (Lead myLead: Trigger.New) {
        if (myLead.Lead_Score__c != 0 ) {
        if (myLead.Lead_Score__c == 100){
            myLead.Lead_Grade__c = 'A+';
        }  else if (myLead.Lead_Score__c >= 90) { //this "else if" indicates what else to evaluate if the above statements isn't true -- additional condition
           myLead.Lead_Grade__c = 'A';
        }  else if (myLead.Lead_Score__c >= 80) {
           myLead.Lead_Grade__c = 'B';
        }    else { //this 'else indicates what happens if none of the above statements are true -- end of flow
                 myLead.Lead_Grade__c = 'F';
                 myLead.Status = 'Closed - Not Qualified';
            }
          }
    }
}