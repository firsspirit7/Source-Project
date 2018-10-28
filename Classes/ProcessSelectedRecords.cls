public class ProcessSelectedRecords {
    
    @Auraenabled
    public static List<String> getPicklistValues(){
        List<SelectOption> options = new List<SelectOption>();
        
       Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
       List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
         List<String> valuesList = new List<String>();  
       for( Schema.PicklistEntry f : ple)
       {
         valuesList.add(f.getValue());
       }       
       return valuesList;
      
    }
    @Auraenabled
    public static void getUpdateSelectedRecords(String oppIds,String stageName){
        System.debug('stageName::'+stageName);
        if(oppIds!=null && oppIds!='' && stageName!=null && stageName!=''){
            Set<String> oppIdSet = new Set<String>();
            List<Opportunity> opportunityList = new List<Opportunity>();
            oppIdSet.addAll(oppIds.split(','));
            for(Opportunity oppObj:[select id,name,stageName from Opportunity where id in:oppIdSet]){
                oppObj.stageName = stageName;
                opportunityList.add(oppObj);
            }
            if(opportunityList!=null && opportunityList.size()>0){
                update opportunityList;
            }
        }
    }
}