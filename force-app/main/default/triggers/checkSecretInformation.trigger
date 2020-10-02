trigger checkSecretInformation on Case (after insert, before update) {
   
    String childCaseSubject = 'Warning: parent case may contail secret info';
        
    // step 1: create a collection containing each of our secret key words (type of collection: set or list)
    Set<String> secretKeywords = new Set<String>();
    secretKeywords.add('Passport');
    secretKeywords.add('Bodyweight');
    secretKeywords.add('SNN');
    secretKeywords.add('Social Security');
    secretKeywords.add('Credit Card');
    
    // step 2:check to see if our case contains any of our secret keywords (loop)
    List<Case> casesWithSecretInfo = new List<Case>();
    for (Case myCase: Trigger.new) {
        if (myCase.Subject != childCaseSubject){
           for (String keyword: secretKeywords) {
               if (myCase.Description != null && myCase.Description.containsIgnoreCase (keyword)){
                  casesWithSecretInfo.add(myCase);
                  break;
               }
            }
        }
        
    }
     
    // step 3: if the case contains a secret keyword, create a child case
    List<Case> casesToCreate = new List<Case>();
    for (Case caseWithSecretInfo: casesWithSecretInfo){
        Case childCase = new Case();
        childCase.Subject = childCaseSubject;
        childCase.ParentId = caseWithSecretInfo.Id;
        childCase.IsEscalated = true;
        childCase.Priority = 'High';
        childCase.Description = 'At least one of the following keywords were found' + secretKeywords;
        casesToCreate.add(childCase);
    }
    insert casesToCreate;
}