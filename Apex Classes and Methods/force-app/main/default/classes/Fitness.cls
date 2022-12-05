public with sharing class Fitness {

    public static Decimal calculateBMI(Decimal weight, Decimal height){
        Decimal bmi = weight/(height * height);
        return bmi;
    }

    public static Decimal calculatePace(Decimal distance, Decimal minutes){
        Decimal hours = minutes/60;
        Decimal pace = distance/hr;
        return pace;
    }
    public Fitness() {

    }
}
