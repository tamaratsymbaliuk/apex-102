public with sharing class Exceptions {
    public Exceptions() {
        /*Double result = 10/0; //System.MathException: Divide by 0
        System.debug('Result: ' + result);

        Account acc = new Account(); //System.DmlException: Insert failed: REQUIRED_FIELD_MISSING NAME
        inset acc;

        String str;
        str.toLowerCase();//Attempt to de-reference a null object
   */

    //throw an exception programmatically
    throw new NullPointerException();

    //HANDLING AN EXCEPTION
    System.debug('Before Exception');
    try{
        Integer i = 10/0; //throws an exception
     }catch(MathException e){
         //catch exception here
     }finally{
         //optinal finally block.Finally block ALWAYS executes regardless of whether an exception was thrown
     }
     System.debug('After Exception');

try{
    Double result = 10/0; //System.MathException: Divide by 0
        System.debug('Result: ' + result);//this statement did not execute
}catch(MathException e){// or use Exception e instead.
    System.debug('Cought math exception');
}finally{
    ystem.debug('Finally called');
}


try{
    Account acc = new Account(); //System.DmlException: Insert failed: REQUIRED_FIELD_MISSING NAME
    inset acc;
}catch(DmlException e){ // or Exception e - parent class
    System.debug('Cought dml exception');
}finally{
    System.debug('Finally called');
}

//_______________________________________
//EXCEPTION METHODS

try{
    Double result = 10/0; 
        System.debug('Result: ' + result);
}catch(Exception e){
    System.debug('Cause ' + e.getCause()); //exception methods
    System.debug('Message ' + e.getMessage()); //exception methods
    System.debug('Line Number ' + e.getLineNumber()); //exception methods
    System.debug('Stack Trace ' + e.getStackTraceString()); //exception methods
    
}finally{
    ystem.debug('Finally called');
}

//THROW CUSTOM EXCEPTION
/*public class ProcessException extends Exception{

}

//call it : throw new ProcessException('My custom exception')





*/
}
 }

