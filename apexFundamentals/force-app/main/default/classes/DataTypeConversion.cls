public with sharing class DataTypeConversion {
    public DataTypeConversion() {
        String mathGrade = '72';
        String chemistryGrade = '64';
        Integer total = Integer.valueOf(mathGrade) + Integer.valueOf(chemistryGrade);

    }
}
