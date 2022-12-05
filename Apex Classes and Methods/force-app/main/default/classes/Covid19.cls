public with sharing class Covid19 {

    public Integer recoveredInArea = 0;
    public static Integer recoveredInCountry = 0;

    public void treatPatient(){

        recoveredInArea++;
        recoveredInCountry++;
    }

    // initialization block - sets initial values when an instance gets created instead of taking value from a user. 
    //Getting called after static block
    
{
    recoveredInArea = 5;
    recoveredInCountry = 5;
}

static{
    ////Gets called FIRST!

}




    public Covid19() {
        System.debug('Constructor is called');

    }
    public Covid19(Integer patientRecovered){
        this.(); //will call default constructor and needs to be a first statement 
        this.recoveredInArea = patientRecovered; //this keyword refers to current instance of the class
        this.recoveredInCountry = patientRecovered;


    }
}
