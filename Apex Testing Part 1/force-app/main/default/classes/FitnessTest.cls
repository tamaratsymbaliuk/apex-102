@isTest
public with sharing class FitnessTest {

    @IsTest
    public static void calculateBMITest1(){
        Decimal person = Fitness.calculateBMI(60, 1.2);
        person = person.setScale(2);
        System.assertEquals(41.67, person, 'BMI should be 41.67 for 60 kg weight and 1.2 mtr height');
    }
    @IsTest
    public static void calculateBMITest2(){
        Decimal person = Fitness.calculateBMI(0, 1.2);
        System.assertEquals(0, person, 'BMI should be 0 for 0 kg weight and 1.2 mtr height');
    }
    @IsTest
    public static void calculateBMITest3(){
        Decimal person = Fitness.calculateBMI(60, 0);
        System.assertEquals(-1, person, 'Invalid input');
    }
    @IsTest
    public static void calculateBMITest4(){
        Decimal person = Fitness.calculateBMI(-60, 1.2);
        System.assertEquals(-1, person, 'Invalid input');
    }
    @IsTest
    public static void calculateBMITest5(){
        Decimal person = Fitness.calculateBMI(60, -1.2);
        System.assertEquals(-1, person, 'Invalid input');
    }
    @IsTest
    public static void calculatePaceTest1(){
        Decimal pace = Fitness.calculatePace(2, 60);
        System.assertEquals(2, pace, 'Pace should be 2km/hr for 2km and 60 minutes');
   }
   @IsTest
    public static void calculatePaceTest2(){
        Decimal pace = Fitness.calculatePace(2, 0);
        System.assertEquals(-1, pace, 'Invalid input');
   }
   @IsTest
    public static void calculatePaceTest3(){
        Decimal pace = Fitness.calculatePace(0, 60);
        System.assertEquals(0, pace, 'Invalid input');
   }
   @IsTest
    public static void calculatePaceTest4(){
        Decimal pace = Fitness.calculatePace(-10, 60);
        System.assertEquals(-1, pace, 'Invalid input');
   }
   @IsTest
    public static void calculatePaceTest5(){
        Decimal pace = Fitness.calculatePace(10, -60);
        System.assertEquals(-1, pace, 'Invalid input');
   }
}
