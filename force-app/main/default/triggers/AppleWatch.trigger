trigger AppleWatch on Opportunity (after insert) {
   for (Opportunity opp: Trigger.New) { //loop through every record that meets the criteria
       Task t         = new Task(); //create new task
       t.Subject      = 'Apple Watch Promo'; //prepopulate this field
       t.Description  = 'Sent them an Apple Watch asap!'; //prepopulate this field
       t.Priority     = 'High'; //prepopulate this field
       t.WhatId       = opp.Id; //it means, take the id of the same opp. basically, specify where the new task should be created
       insert t; 
   }
}

//Basically, this trigger tells the system to create a task every time an opportunity is created, and associate this task with the opportunity. We specify values for the key fields that this trigger will populate.