public class AccountSavecls {
    public Account actObj{get;set;}
    public AccountSavecls(){
        actobj = new Account();
    }
    public pagereference saveAccount(){
        insert actObj;
        return new Pagereference('/'+actObj.Id);
    }
    
}