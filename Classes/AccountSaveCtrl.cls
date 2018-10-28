public class AccountSaveCtrl {
    public Account actObj{get;set;}
    public AccountSaveCtrl(){
        actObj = new Account();
        
    }
    
    public pagereference saveAccount(){
        
        insert actObj;
        
        return new Pagereference('/'+actObj.Id);
        
    }
    

}