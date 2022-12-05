public with sharing class HelloWorld {

    private String greeting = 'Hello World'; //you can access private variables in public class methods

    public void printGreeting(){
        System.debug(greeting);
    }
//parameterized method
    public String getDay(Integer dayNumber){
            
        String dayString = '';
        switch on dayNumber {
            when 0 {
                dayString = 'Sunday';
            }
            when 1 {
                dayString = 'Monday';
  
                }
                when 2{
                    dayString = 'Thuesday';
                }
                when 3{
                    dayString = 'Wednesday';
                }
                when 4{
                    dayString = 'Thursday';
                }
                when 5{
                    dayString = 'Friday';
                }
                when 6{
                    dayString = 'Saturday';
                }
                when else{
                    dayString = 'invalid number';
                }
        }
              return dayString;
        }

//polymorphic method

public String getDay(String dayAbbreviation){
    switch on dayAbbreviation{
        when 'Sun' {
            dayString = 'Sunday';
        }
        when 'Mon' {
            dayString = 'Monday';

            }
            when 'Tue'{
                dayString = 'Thuesday';
            }
            when 'Fri'{
                dayString = 'Wednesday';
            }
            when 'Sat'{
                dayString = 'Thursday';
            }
            when else{
                dayAbbreviation = 'invalid number';
            }
    }
    return dayAbbreviation;
    }


    public HelloWorld() {
        
        }

        
       
    }

    


