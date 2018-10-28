public class SchedulerExample implements System.Schedulable{
    public void execute(System.SchedulableContext sc){      
       // Send an email to the Apex job's submitter notifying of job completion.
       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
       String[] toAddresses = new String[] {'mbalaji105@gmail.com'};
       mail.setToAddresses(toAddresses);
       mail.setSubject('Greetings');
       mail.setPlainTextBody('Hi Hello');
       Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}