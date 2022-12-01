public with sharing class LogicalStatements {
    public LogicalStatements() {

        //if-else statements

        Boolean isSunnny = false;
        Boolean isRaining = false;
        

        if(isRaining == true){
            System.debug('Bring your umbrella');
        } else if(isSunnny == true){
            System.debug('Leave your umbrella');
        }else{
            System.debug('Go to work');
        }

        //switch-when statement
        String today = 'Monday';


        switch on today{
            when 'Monday','Tuesday','Wednesday','Thursday','Friday'{
                System.debug('Go to office');
            }
            when 'Saturday'{
                System.debug('Go to party');
            } when else{
                System.debug('Watch movies');
            }
        }

        //Use Math.mod() function to find remainder of a division

        /* Challenge 2 - find a leap year
        */

       
        Integer year = 2022;

        if(Math.mod(year, 4) == 0  && Math.mod(year, 100) == 0 && Math.mod(year,400) == 0){
            System.debug(year + ' is a leap year');
        }else{
            System.debug(year + ' not a leap year');
        }



    }
}
