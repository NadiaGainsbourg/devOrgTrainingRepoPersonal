@isTest
private class HelloWorldTest {
    @isTest static void UpdateLead() {
    Lead myLead      = new Lead();
    myLead.FirstName = 'Nadia';
    myLead.LastName  = 'Gainsbourg';
    myLead.Company   = 'Appcast, Inc.';
    insert myLead;
    
    myLead.Company = 'Pluralsight';
    update myLead;
    //implement test code
    }
}


//"UpdateLead" this was test_method_one in the template, but good to rename