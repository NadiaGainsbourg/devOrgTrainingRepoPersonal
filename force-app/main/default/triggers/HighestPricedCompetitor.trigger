trigger HighestPricedCompetitor on Opportunity (before insert, before update) {
    for (Opportunity opp: Trigger.new ) {
        //add all prices in a list in order of competitor
        List<Decimal> competitorPrices = new List<Decimal>();
        competitorPrices.add(opp.Competitor_1_Price__c);
        competitorPrices.add(opp.Competitor_2_Price__c);
        competitorPrices.add(opp.Competitor_3_Price__c);
        
        //add all competitors in a list in order
        List<String> competitors = new List<String>();
        competitors.add(opp.Competitor_1__c);
        competitors.add(opp.Competitor_2__c);
        competitors.add(opp.Competitor_3__c);
        
        //loop through all competitors to find the position of the lowest price
        Decimal highestPrice;
        Integer highestPricePosition;
        for(Integer i = 0; i<competitorPrices.size(); i++){
            Decimal currentPrice = competitorPrices.get(i);
            if(highestPrice == null || currentPrice > highestPrice){
              highestPrice = currentPrice; 
              highestPricePosition = i;
                
       //popolate the Leading Competitor field with the name of the competitor matching the lowest price position
       opp.Highest_Priced_Competitor__c = competitors.get(highestPricePosition);
       opp.Highest_Priced_Competitor_Price__c = competitorPrices.get(highestPricePosition);
            }
        }
     }

}