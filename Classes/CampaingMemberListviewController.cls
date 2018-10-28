public class CampaingMemberListviewController {
    private ApexPages.StandardSetController standardSetController;
    public string oppIdStr{get;set;}
    public CampaingMemberListviewController(ApexPages.StandardSetController standardSetController)
    {
        this.standardSetController = standardSetController;
        
    }
 
    public PageReference doSomething()
    {
        // Apex code for handling records from a List View goes here
        List<CampaignMember> selectedListViewRecords =
            (List<CampaignMember>) standardSetController.getSelected();
            
        Boolean hasMore = standardSetController.getHasNext();
        if(selectedListViewRecords.size()>0){
            list<string> campMemberIdS = new list<string>();
            for(CampaignMember oppRec : [select id,contactId,leadId,Status from CampaignMember WHERE Id IN: selectedListViewRecords]){
                 campMemberIdS.add(oppRec.Id);
            }
            oppIdStr= campMemberIdS.size()>0 ? String.join(campMemberIdS, ',') : '';
        }
        
        
        
        system.debug('---selectedListViewRecords ---'+selectedListViewRecords.size() );
        return null;
    }
}