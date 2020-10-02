trigger HelloWorld on Lead (before update) {
   for (Lead l: Trigger.new) {
       l.FirstName = 'Hello';
       l.LastName = 'World';
   }

}

//"HellowWorld" is the name of the trigger.//
//"(before update)" tells the system when the even must happen. In this case, it's before a lead gets updated.//
//for (Lead l: Trigger.new) -- this line is a loop, meaning that multiple records can enter the loop at ones or at different times and the system will put them all through what happens next between the {} curly brackets (the specified process).//
//btw, "l" is the small L and stands for Lead, the variable we're creating (stands for any lead that enters the loop. It could've been an "x" or any other letter//
//{l.FirstName = 'Hello'; l.LastName = 'World';} this is the actual logic of the trigger!//