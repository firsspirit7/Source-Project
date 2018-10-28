({
	calculator : function(component, event, helper) {
		var firstNumber = component.get('v.fnumber');
        var secondNumber = component.get('v.snumber');        
        component.set('v.result',(firstNumber+secondNumber));        
	}
   
})