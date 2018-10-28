public class AccountRecordsCls {
    public List<Account> accountList{get;set;}
    public List<Opportunity> opportunityList{get;set;}
    public AccountRecordsCls(AccountSavecls controller){
        accountList = new List<Account>();
        accountList = [select id,name,type,industry from Account];
    }
     public AccountRecordsCls(){
        opportunityList = new List<Opportunity>();
        opportunityList = [select id,name,stagename,closeDate from Opportunity limit 5];
    }
}