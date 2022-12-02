public with sharing class LoopsInApex {
    public LoopsInApex() {
// Do while loop

Integer year = 2022;

do{
    if(Math.mod(year, 4) == 0  && Math.mod(year, 100) == 0 && Math.mod(year,400) == 0){
        System.debug(year + ' is a leap year');
    }else{
        System.debug(year + ' not a leap year');
    }
    year++;

} while(year <= 3000);

    }
}
