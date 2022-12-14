public with sharing class OOOPSinApex {
    public OOOPSinApex() {
        //Encapsulation, Abstraction, Inheritance, Polymorphism


        //Access Modifiers - private > protected > public > global
        /*
        private - default access modifier. Can be used with variables, methods, and inner classes.
        protected - Can be used with variables and methods. Inner classes and classes that extends outer class can access these variable and methods.
        public - Can be used with classes, variables, methods. Unrestricted access within same namespace.
        global - unrestricted access. 
      */

      /*Method Syntax

      public static Integer add(Integer number1,Integer number2){
        Integer sum = number1 + number2;
        return sum; -must for all return types except void
      }

      check HelloWorld class
      */

      /*
      static keyword - belong to a class not to an instance. Static method can be called from a class name.
      You cannot use non-static variables within a static method. EX: System.debug
       (debug is a static method and we calling it from System class)


      */

      /*
      Apex naming convenstion - case insensitive vs Java case-sensitive; 
      */

      //Constructor Class in APEX, see Covid 19 Class. Constructors are auto called when new instance/object is created.
      //Ex: Covid19 case = new Covid19(); Constructors cannot rreturn anything as they are auto called.

      //Initialization Block (see Covid19 class)

      //Inner Class or Wraper Class (See Company Class)



    }
}
