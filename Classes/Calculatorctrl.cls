public class Calculatorctrl {
    public integer firstNumber{get;set;}
    public integer secondNumber{get;set;}
    public integer result{get;set;}
    public boolean isShowResult{get;set;}
    
    
    public void add(){
        isShowResult = true;
        result = firstNumber + secondNumber;
        Apexpages.addMessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Addition is Successful'));
    }
     public void sub(){
         if(firstNumber<secondNumber){
             isShowResult =false;
              Apexpages.addMessage(new ApexPages.message(ApexPages.severity.Error,'First Number should be greater than Second Number'));
         }
         else{
             isShowResult = true;
             result = firstNumber - secondNumber;
             Apexpages.addMessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Substraction is Successful'));
         }
    }
    public void multi(){
        isShowResult = true;
        result = firstNumber * secondNumber;
    }
    
}