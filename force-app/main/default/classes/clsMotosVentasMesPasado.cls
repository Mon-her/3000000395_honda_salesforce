public with sharing class clsMotosVentasMesPasado {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppsLastMonth(){
        try {
            return [Select Id, Owner.Name, StageName, Agencia__c, Agencia2__c,Concesionario__c, Concesionario2__c,Account.Name, Name, Amount,Probability, CloseDate, CreatedDate from Opportunity limit 100];    
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
    @AuraEnabled(cacheable=true)
    public static Integer getTotalOppsLastMonth(){
        try {
            return 777;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    
}