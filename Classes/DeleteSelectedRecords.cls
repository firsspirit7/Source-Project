public class DeleteSelectedRecords {
    public List<Wrappercls> wrapperList{get;set;}
    
    public DeleteSelectedRecords(){
        wrapperList = new List<Wrappercls>();
        for(Contact contactObj:[select id,name,email from Contact]){
            Wrappercls wrapObj = new Wrappercls();
            wrapObj.isSelect = false;
            wrapObj.contObj = contactObj;
            wrapperList.add(wrapObj);
        }
        
    }
    
    //to combine checkbox and contact record
    public class Wrappercls{
        public boolean isSelect{get;set;}
        public Contact contObj{get;set;}
    }
    
    
    public pagereference deleteSelected(){
        List<Contact> selectedContactList = new List<Contact>();
        List<Wrappercls> tempWrapperList = new List<Wrappercls>();
        Set<Id> contactIdSet = new Set<Id>();
        if(wrapperList!=null && wrapperList.size()>0){
            for(Wrappercls wrapObj:wrapperList){
                if(wrapObj.isSelect==true){
                    selectedContactList.add(wrapObj.contObj);
                    contactIdSet.add(wrapObj.contObj.Id);
                }
                else{
                    tempWrapperList.add(wrapObj);
                }
            }
        }
        
        if(selectedContactList!=null && selectedContactList.size()>0){
            List<Case> casesList = new List<Case>();
            casesList = [select id from Case where contactid in:contactIdSet];
            delete casesList;
            delete selectedContactList;
            if(!tempWrapperList.isEmpty()){
                wrapperList = new List<Wrappercls>();
                wrapperList.addAll(tempWrapperList);
            }
            
        }
        
        return null;
    }
}