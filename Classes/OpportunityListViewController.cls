public class OpportunityListViewController {
    private ApexPages.StandardSetController standardSetController;
    public string oppIdStr{get;set;}
    public OpportunityListViewController(ApexPages.StandardSetController standardSetController)
    {
        this.standardSetController = standardSetController;
        
    }
 
    public PageReference doSomething()
    {
        // Apex code for handling records from a List View goes here
        List<Opportunity> selectedListViewRecords =
            (List<Opportunity>) standardSetController.getSelected();
            
        Boolean hasMore = standardSetController.getHasNext();
        if(selectedListViewRecords.size()>0){
            list<string> oppIds = new list<string>();
            for(Opportunity oppRec : [select id,accountId from Opportunity WHERE Id IN: selectedListViewRecords]){
                 oppIds.add(oppRec.Id);
            }
            oppIdStr= oppIds.size()>0 ? String.join(oppIds, ',') : '';
        }
        
        
        
        system.debug('---selectedListViewRecords ---'+selectedListViewRecords.size() );
        return null;
    }
}