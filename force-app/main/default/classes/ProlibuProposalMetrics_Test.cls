//Made by me, June 2021
@isTest
public class ProlibuProposalMetrics_Test {
    public static testmethod void testear(){
        Triggerhandler.bypass('OpportunityTriggerHandler');
    	Triggerhandler.bypass('QuoteTriggerHandler');
        Triggerhandler.bypass('AccountTriggerHandler');
        Triggerhandler.bypass('TaskTriggerHandler');
        
        TestDataUtilityClass.crearCuentasAutos(1, Label.AutosRecordTypeDevNameAccountNatural);
        TestDataUtilityClass.crearConcesionarios(1);
        TestDataUtilityClass.crearMiembroConcesionarios(1);
        TestDataUtilityClass.crearOportunidadAutos(1);
        TestDataUtilityClass.crearQuoteAutos(1);
        
                
        Quote q= TestDataUtilityClass.mapQuotesAutos.get(1);
        q.Creado_Prolibu__c = true;
        update q;
        
        
        Opportunity opp = TestDataUtilityClass.mapOpportunitiesAutos.get(1);
        
        /*
        Group grupo = [select id, name from group where name='Contact Center Autos' and type='Queue'];
        TAsk tarea = new Task();
        tarea.ActivityDate = system.today() + 7;
        tarea.Description='Comunicarse con el cliente para saber si tiene inquietudes sobre el vehículo nuevo y para hacer la encuesta de satisfacción.';
		tarea.OwnerId = grupo.Id;
        tarea.WhatId = opp.Id;
        tarea.Etapa_de_Asignacion__c = 'PU';
        tarea.Status = 'Programada';
        tarea.Subject ='Realizar actividad de seguimiento para encuesta de satisfacción después de la venta';
        insert tarea;
        */
        
        //opp.StageName ='PU'; //Closed Won para Autos
        //update opp;
        
        Test.startTest();
        opp.SyncedQuoteId = q.Id;
        update opp;
        TEst.stopTest();
        test.setMock(HttpCalloutMock.class, new ProlibuProposalMetrics_Mock(1));
        ProlibuProposalMetrics.getProposalMetricsFuture();
    }
    
    public static testmethod void testearNoQuotes(){
        test.setMock(HttpCalloutMock.class, new ProlibuProposalMetrics_Mock(1));
        ProlibuProposalMetrics.getProposalMetrics();
    }
    
    public static testmethod void testearError300(){
        Triggerhandler.bypass('OpportunityTriggerHandler');
    	Triggerhandler.bypass('QuoteTriggerHandler');
        Triggerhandler.bypass('AccountTriggerHandler');
        Triggerhandler.bypass('TaskTriggerHandler');
        
        TestDataUtilityClass.crearCuentasAutos(1, Label.AutosRecordTypeDevNameAccountNatural);
        TestDataUtilityClass.crearConcesionarios(1);
        TestDataUtilityClass.crearMiembroConcesionarios(1);
        TestDataUtilityClass.crearOportunidadAutos(1);
        TestDataUtilityClass.crearQuoteAutos(1);
        
                
        Quote q= TestDataUtilityClass.mapQuotesAutos.get(1);
        q.Creado_Prolibu__c = true;
        update q;
        
        
        Opportunity opp = TestDataUtilityClass.mapOpportunitiesAutos.get(1);
            
        Test.startTest();
        opp.SyncedQuoteId = q.Id;
        update opp;
        TEst.stopTest();
        
        test.setMock(HttpCalloutMock.class, new ProlibuProposalMetrics_Mock(2300));
        ProlibuProposalMetrics.getProposalMetrics();
    }
    
    public static testmethod void testearError400(){
        Triggerhandler.bypass('OpportunityTriggerHandler');
    	Triggerhandler.bypass('QuoteTriggerHandler');
        Triggerhandler.bypass('AccountTriggerHandler');
        Triggerhandler.bypass('TaskTriggerHandler');
        
        TestDataUtilityClass.crearCuentasAutos(1, Label.AutosRecordTypeDevNameAccountNatural);
        TestDataUtilityClass.crearConcesionarios(1);
        TestDataUtilityClass.crearMiembroConcesionarios(1);
        TestDataUtilityClass.crearOportunidadAutos(1);
        TestDataUtilityClass.crearQuoteAutos(1);
        
                
        Quote q= TestDataUtilityClass.mapQuotesAutos.get(1);
        q.Creado_Prolibu__c = true;
        update q;
        
        
        Opportunity opp = TestDataUtilityClass.mapOpportunitiesAutos.get(1);
            
        Test.startTest();
        opp.SyncedQuoteId = q.Id;
        update opp;
        TEst.stopTest();
        
        test.setMock(HttpCalloutMock.class, new ProlibuProposalMetrics_Mock(2));
        ProlibuProposalMetrics.getProposalMetrics();
    }
    
    public static testmethod void testearErrorCallout(){
        Triggerhandler.bypass('OpportunityTriggerHandler');
    	Triggerhandler.bypass('QuoteTriggerHandler');
        Triggerhandler.bypass('AccountTriggerHandler');
        Triggerhandler.bypass('TaskTriggerHandler');
        
        TestDataUtilityClass.crearCuentasAutos(1, Label.AutosRecordTypeDevNameAccountNatural);
        TestDataUtilityClass.crearConcesionarios(1);
        TestDataUtilityClass.crearMiembroConcesionarios(1);
        TestDataUtilityClass.crearOportunidadAutos(1);
        TestDataUtilityClass.crearQuoteAutos(1);
        
                
        Quote q= TestDataUtilityClass.mapQuotesAutos.get(1);
        q.Creado_Prolibu__c = true;
        update q;
        
        
        Opportunity opp = TestDataUtilityClass.mapOpportunitiesAutos.get(1);
        
        Test.startTest();
        opp.SyncedQuoteId = q.Id;
        update opp;
        TEst.stopTest();
        
        test.setMock(HttpCalloutMock.class, new ProlibuProposalMetrics_Mock(3));
        ProlibuProposalMetrics.getProposalMetrics();
    }
}