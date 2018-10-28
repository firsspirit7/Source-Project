@isTest
private class AccountSaveCtrlTest {

	private static testMethod void AccountSavetest() {
        Account actObj = new Account();
        actObj.Name = 'Test Account';
        actObj.Type = 'Prospect';
        //insert actObj;
        Test.startTest();
            AccountSaveCtrl actSaveCtrlObj = new AccountSaveCtrl();
            actSaveCtrlObj.actObj =actObj; 
            actSaveCtrlObj.saveAccount();
        Test.stopTest();
        
        System.assert(actObj.Id!=null);
	}

}