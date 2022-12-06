public with sharing class Covid19 {
    private Integer recoveredInArea = 0;
    private static Integer recoveredInCountry = 0;


    public Covid19() {

    }

    //parameterized constructor to set class variables value
    public Covid19(Integer recoveredInArea){
        if(recoveredInArea < 0){
            this.recoveredInArea = 0;
        }else{
        this.recoveredInArea = recoveredInArea;
        recoveredInCountry += recoveredInArea;
    }
}

    public void tearPatient(){
        recoveredInArea++;
        recoveredInCountry++;
    }

    public Integer getTreated(){
        return recoveredInArea;
    }

}
