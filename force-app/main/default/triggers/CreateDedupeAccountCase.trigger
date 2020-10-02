Trigger CreateDedupeAccountCase on Account (after insert) {
   For (Account acc: Trigger.new) {
       Case c = new Case ();
       c.Subject = 'Dedupe this account!';
       c.OwnerId = '0056100000127wq';
       c.AccountId = acc.Id;
       insert c;
   }
}