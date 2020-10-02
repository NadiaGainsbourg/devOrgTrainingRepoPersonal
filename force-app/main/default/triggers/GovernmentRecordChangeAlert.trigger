trigger GovernmentRecordChangeAlert on Contact (before insert) {
    for (Contact myContact: Trigger.new) {
        if (myContact.Government_Record__c == True){
           Task myTask = new Task();
           myTask.Subject = 'Government Record Modified';
           myTask.Description = 'Please verify updates';
           myTask.Status = 'Not Started';
           insert myTask;
        }
    } 

}