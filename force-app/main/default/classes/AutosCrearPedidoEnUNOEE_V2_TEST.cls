public with sharing class AutosCrearPedidoEnUNOEE_V2_TEST {
    
    // create quote 
    // sync opportunity to generate opp line only one opp line
    //create account
    public static account createAccount(Boolean toInsert ) {
        Account objAcc = new Account();
        objAcc.Creado_en_UNOEE__c       = true;
        objAcc.Name = 'Name';
       // objAcc.IsPersonAccount          = true;
        //campo Actividad economica en la cuenta relacionada antes de crear el pedido en Salesforc
        objAcc.Actividad_economica__c   ='Administrativa';        
        // l campo Dirección en la cuenta relacionada antes de crear el pedido en Sales AM_Direccion__c (FORMULA)
        objAcc.AM_Via_principal__c ='Calle';
        objAcc.AM_Numero_via_principal__c = 23;
        objAcc.AM_Literal_via_principal__c = 'a';
        objAcc.AM_Orientacion_via_principal__c = 'Sur';
        objAcc.AM_Numero_via_secundaria__c =23;
        //be tener digilenciado el campo Ocupación en la cuenta relacionada antes de crear el pedido en Salesforce.
        objAcc.AM_Ocupacion_pc__c = 'Empleado';
        if( toInsert ){
            insert objAcc; 
        }
        return objAcc;
    }
  // https://hondaautos--test2.sandbox.lightning.force.com/lightning/r/Opportunity/0060100000B9jgPAAR/view
    public static opportunity createOpportunity(Boolean toInsert, Concesionario__c objVitrina ){
        Opportunity objOpp = new Opportunity();
        // debe tener digilenciado el campo Vitrina de despacho antes de hacer el envio a UNOEE.
        objOpp.Vitrina_de_despacho__c = objVitrina.id;
        // debe tener digilenciado el campo Notas de despacho antes de hacer el envio a UNOEE.
        objOpp.Notas_de_despacho__c = 'Test notas de despacho';
        //ou have uncommitted work pending. Please commit or rollback before calling out63
        return objOpp;
    }
}