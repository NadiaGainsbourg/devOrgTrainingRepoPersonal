@isTest
private class LeadingCompetitorTest {

@isTest static void createOppWithCompetitors(){
    //create an opportunity & set required fields
    Opportunity opp = new Opportunity();
    opp.Name = 'Big Deal';
    opp.CloseDate = date.today();
    opp.StageName = 'Prospecting';
    opp.Discount_Percent__c = 0.10;
    
    //set competitor price fields
    opp.Competitor_1_Price__c = 5000;
    opp.Competitor_2_Price__c = 15000;
    opp.Competitor_3_Price__c = 25000;
    
    //set competitor name fields
    opp.Competitor_1__c = 'Amazon';
    opp.Competitor_2__c = 'Google';
    opp.Competitor_3__c = 'Microsoft';

    insert opp;
    System.debug('Opportunity' + opp.Name + 'inserted with all competitor fields populated.');
   }
}