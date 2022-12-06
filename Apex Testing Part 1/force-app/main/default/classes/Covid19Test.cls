@isTest
public with sharing class Covid19Test {
    
    @IsTest
    public static void treatPatientTest(){
        //create an instance of the class
        Covid19 chicago = new Covid19(10);

        Integer treated = chicago.getTreated();
        //check if the count is 10 or not
        System.assertEquals(10, treated, 'Treated count does not match');

        //create an instance of the class
        Covid19 newyork = new Covid19(112);

        treated = newyork.getTreated();

        //check if the count is 112 or not
        System.assertEquals(112, treated, 'Treated count does not match');
        //check the count of recoveredInCountry, it should be 122
        System.assertEquals(122, Covid19.recoveredInCountry,'Treated count does not match' );

        chicago.tearPatient();
        treated = chicago.getTreated();
        System.assert(treated == 11, 'Treated count does not match' );
        System.assert(Covid19.recoveredInCountry == 123, 'Treated count does not match');
    }

    @isTest
    public static void treatPatientTestNegative(){
        //create an instance of the class
        Covid19 chicago = new Covid19(-10);

        Integer treated = chicago.getTreated();
        //check if the count is 10 or not
        System.assertEquals(0, treated, 'Treated count does not match');
}
}
