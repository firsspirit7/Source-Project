({
	loadComponent : function(component, event, helper) {
        alert('Hi:'+component.get("v.oppIds"));
        var action = component.get("c.getPicklistValues");
        action.setCallback(this,function(result){
            var values = result.getReturnValue();
            alert(values);
            component.set("v.piclistValuesList",values);
        });
        $A.enqueueAction(action);
	},
    updateSelectedOpp : function(component, event, helper) {
        alert('Hi:'+component.get("v.oppIds"));
        var oppIdString = component.get("v.oppIds");
        var selectedVal = component.get("v.selectedValue");
        var action = component.get("c.getUpdateSelectedRecords");
        action.setParams({"oppIds":oppIdString,"stageName":selectedVal});
        action.setCallback(this,function(result){
            var values = result.getReturnValue();
            //closeDialogue(component, event, helper); 
            /*var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({
                "url": '/006/o'
            });
            urlEvent.fire();*/
             var navEvent = $A.get("e.force:navigateToList");
            navEvent.setParams({
                "listViewId":"00B6F00000Cizc6UAB",
                "listViewName": null,
                "scope": "Opportunity"
            });
            navEvent.fire();
        });
        $A.enqueueAction(action);
	},
     closeDialogue : function(component, event, helper) {
        alert('hi');
       /* var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({
                "url": '/006/o'
            });
            urlEvent.fire();*/
     }
})