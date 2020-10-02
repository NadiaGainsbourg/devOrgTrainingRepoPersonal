trigger DisqualifyTestLeads on Lead (before insert, before update) {
  String disqualifyingWord = 'Test';
  List<Lead> leadsToDisqualify = new List<Lead>();
    for (Lead myLead: Trigger.new){
        if ((myLead.FirstName.equalsIgnoreCase(disqualifyingWord) && myLead.FirstName != null) || (myLead.LastName.equalsIgnoreCase(disqualifyingWord) && myLead.FirstName != null)){
           leadsToDisqualify.add(myLead);
        }
    }
    
    for (Lead disqualifiedLead: leadsToDisqualify){
        disqualifiedLead.Status = 'Disqualified';
    }
        
}