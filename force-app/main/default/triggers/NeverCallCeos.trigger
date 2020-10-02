trigger NeverCallCeos on Lead (before update) {
    for (Lead myLead: Trigger.new){
        if (myLead.Title == 'CEO') {
            myLead.DoNotCall = true;
            //we don't need to add "update myLead;" because it's a before trigger
        }    
    }    
}