/*************************************************************************************************************
 * @name            createDataDactory
 * @author          Andres Oliva 
 * @created         30 / 07 / 2020
 * @description     Description of your code
 *
 * Changes (version)
 * -----------------------------------------------------------------------------------------------------------
 *              No.     Date            Author                  Description
 *              ----    ------------    --------------------    ----------------------------------------------
 * @version     1.0     2020-07-30      Andres Oliva            Changes desription
 *
**************************************************************************************************************/
@isTest
public with sharing class AFOG_AutosCrearPedidoUNOEE_tst {
  
    /*********************************************************************************************************
    * @name            sentOrderToUNOEE_WitoutOppLines
    * @author          Andres Oliva <andresolivag@gmail.com>
    * @created         30 / 07 / 2020
    * @description     Description of your code
    * @param           String param : Explanation
    * @return          Explanation of the return value
   **********************************************************************************************************/
    static testMethod void sentOrderToUNOEE_WitoutOppLines() {
        Pricebook2           objPricebookStand      =   createDataDactory.createPricebookId( true, 'Standard Price Book' ); 
        Pricebook2           objPricebook           =   createDataDactory.createPricebookId( true, 'Precios Usados' );
        account              objAcc                 =   createDataDactory.createAccount( true , 'Account_Test', '102547845');
        opportunity          objOpp                 =   createDataDactory.createOpportunityUNOE( true , objAcc.Id, objPricebook.id);     
        test.StartTest();
            AutosCrearPedidoEnUNOEE.EnviarPedido( objOpp.Id );        
        test.StopTest();       
    }   
    
    /*********************************************************************************************************
    * @name            sentOrderToUNOEE_WithOppLines
    * @author          Andres Oliva <andresolivag@gmail.com>
    * @created         30 / 07 / 2020
    * @description     Description of your code
    * @param           String param : Explanation
    * @return          Explanation of the return value
   **********************************************************************************************************/
    static testMethod void sentOrderToUNOEE_WithOppLines() {
        //Create Product
        Product2 pro = new Product2(Name = 'iPhone X', Family = 'Mobile');
        Insert pro;
        
        //Instantiate the Pricebook2 record with StandardPricebookId
        Pricebook2 standardPricebook = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            IsActive = true
        );
        
        //Execute an update DML on the Pricebook2 record, to make IsStandard to true
        Update standardPricebook;
        
        //Query for the Pricebook2 record, to check IsStandard field
        standardPricebook = [SELECT Id, IsStandard FROM Pricebook2 WHERE Id = :standardPricebook.Id];
        //It should return true
        System.assertEquals(true, standardPricebook.IsStandard);      
        
        //Create the PricebookEntry
        PricebookEntry pbe = new PricebookEntry(
            Pricebook2Id = standardPricebook.Id,
            Product2Id = pro.Id,
            UnitPrice = 1020,
            IsActive = true
        );
        Insert pbe;        
        //Query the PricebookEntry record
        pbe = [SELECT Id, Pricebook2.IsStandard FROM PricebookEntry];
       // Pricebook2           objPricebook             =   createDataDactory.createPricebookId( true, 'Precios Usados' );       
        account             objAcc                     =   createDataDactory.createAccount( true , 'Account_Test', '102547845');
        RecordType          recTypEmpresa              = [Select Id, DeveloperName From RecordType Where SobjectType = 'Account' and DeveloperName ='AM_CUE_Cuenta_empresarial' Limit 1];
       
        /*account             objAcc2                     =   createDataDactory.createAccount( false , 'Account_Test empresa', '182547845');
        objAcc2.PersonEmail = 'finance@email.com';
        objAcc2.recordTypeId = recTypEmpresa.Id;
        insert objAcc2;*/
        opportunity         objOpp                     =   createDataDactory.createOpportunityUNOE( true , objAcc.Id, standardPricebook.id );
        Product2            objProduct                 =   createDataDactory.createProduct2( true );        
        RecordType          recTyp                     = [Select Id, DeveloperName From RecordType Where SobjectType = 'Account' and DeveloperName ='AM_CUE_Persona_natural' Limit 1];
        Concesionario__c    objConces                  =   createDataDactory.createConcesionario( true );
       // PricebookEntry       objPricebEntryStandar  =   createDataDactory.createPricebookEntry(true, objProduct.Id, standardPricebook.id  );
       // PricebookEntry       objPricebEntry         =   createDataDactory.createPricebookEntry(true, objProduct.Id, objPricebook.Id );
        opportunityLineItem  objOpporLine               =   createDataDactory.createOpportunityLineItem( true , objProduct.Id ,objOpp.id );
        test.StartTest();
             AutosCrearPedidoEnUNOEE.EnviarPedido( objOpp.Id ); 
             objOpp.Se_creo_pedido_en_UNOEE__c = true;
             update objOpp;         
             AutosCrearPedidoEnUNOEE.EnviarPedido( objOpp.Id ); 
             objOpp.Se_creo_pedido_en_UNOEE__c = false;
             objOpp.Vitrina_de_despacho__c =null;
             objOpp.Order_Generated__c = true;
             update objOpp;
             AutosCrearPedidoEnUNOEE.EnviarPedido( objOpp.Id ); 
             objOpp.Vitrina_de_despacho__c = objConces.id;            
             //objOpp.Order_Generated__c = false;
             objOpp.Vitrina__c = null;
             update objOpp;
             AutosCrearPedidoEnUNOEE.EnviarPedido( objOpp.Id ); 
             objOpp.Notas_de_despacho__c ='notes';
             update objOpp;             
             objAcc.RecordTypeId = recTyp.id;
             update objAcc;
             AutosCrearPedidoEnUNOEE.EnviarPedido( objOpp.Id );
             objAcc.Actividad_economica__c = 'Comercializadora';
             update objAcc;
             AutosCrearPedidoEnUNOEE.EnviarPedido( objOpp.Id );  
             /*objAcc.recordtypeid= null;
             update  objAcc;
             objOpp.Forma_de_pago__c = 'Contado';
             update objOpp;
             AutosCrearPedidoEnUNOEE.EnviarPedido( objOpp.Id ); */ 

             
        test.StopTest();       
    }  

    /*********************************************************************************************************
    * @name            sentOrderToUNOEE_WithOppLines
    * @author          Andres Oliva <andresolivag@gmail.com>
    * @created         30 / 07 / 2020
    * @description     Description of your code
    * @param           String param : Explanation
    * @return          Explanation of the return value
   **********************************************************************************************************/
    static testMethod void sentOrderToUNOEE_WithOppLines_other() {
        //Create Product
        Product2 pro = new Product2(Name = 'iPhone X', Family = 'Mobile');
        Insert pro;
        
        //Instantiate the Pricebook2 record with StandardPricebookId
        Pricebook2 standardPricebook = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            IsActive = true
        );
        
        //Execute an update DML on the Pricebook2 record, to make IsStandard to true
        Update standardPricebook;
        
        //Query for the Pricebook2 record, to check IsStandard field
        standardPricebook = [SELECT Id, IsStandard FROM Pricebook2 WHERE Id = :standardPricebook.Id];
        //It should return true
        System.assertEquals(true, standardPricebook.IsStandard);      
        
        //Create the PricebookEntry
        PricebookEntry pbe = new PricebookEntry(
            Pricebook2Id = standardPricebook.Id,
            Product2Id = pro.Id,
            UnitPrice = 1020,
            IsActive = true
        );
        Insert pbe;        
        //Query the PricebookEntry record
        pbe = [SELECT Id, Pricebook2.IsStandard FROM PricebookEntry];     
        account             objAcc                     =    createDataDactory.createAccount( true , 'Account_Test', '102547845');
        account             objAccFacturar             =    createDataDactory.createAccount( true , 'Account_Test', '102547845');
        RecordType          recTypEmpresa              =    [Select Id, DeveloperName From RecordType Where SobjectType = 'Account' and DeveloperName ='AM_CUE_Cuenta_empresarial' Limit 1];
        opportunity         objOpp                     =    createDataDactory.createOpportunityUNOE( true , objAcc.Id, standardPricebook.id );
        Product2            objProduct                 =    createDataDactory.createProduct2( true );        
        RecordType          recTyp                     =    [Select Id, DeveloperName From RecordType Where SobjectType = 'Account' and DeveloperName ='AM_CUE_Persona_natural' Limit 1];
        Concesionario__c    objConces                  =    createDataDactory.createConcesionario( true );
        opportunityLineItem  objOpporLine              =    createDataDactory.createOpportunityLineItem( true , objProduct.Id ,objOpp.id );
        test.StartTest();
                
                objOpp.Vitrina_de_despacho__c           = null;
                objOpp.Order_Generated__c               = true;
                objOpp.Vitrina_de_despacho__c           = objConces.id;            
                objOpp.Vitrina__c                       = null;
                objOpp.Notas_de_despacho__c             = 'notes';
                objOpp.Forma_de_pago__c                 = 'Contado';
                update objOpp; 

                objAcc.AM_Via_principal__c              =   'calle';
                objAcc.Actividad_economica__c           =   'Comercializadora';
                objAcc.recordtypeid= null;    
                update  objAcc;

            AutosCrearPedidoEnUNOEE.EnviarPedido( objOpp.Id ); 

                objAcc.AM_Via_principal__c                  = '';   
                update  objAcc; 

                objAccFacturar.Actividad_economica__c       = null;
                update objAccFacturar;

                objOpp.Facturar_a_nombre_de__c              =  objAccFacturar.Id;
                update objOpp;

            AutosCrearPedidoEnUNOEE.EnviarPedido( objOpp.Id ); 
            
        test.StopTest();       
    }  

    /*********************************************************************************************************
    * @name            sentOrderToUNOEE_WithOppLines
    * @author          Andres Oliva <andresolivag@gmail.com>
    * @created         30 / 07 / 2020
    * @description     Description of your code
    * @param           String param : Explanation
    * @return          Explanation of the return value
    **********************************************************************************************************/
    static testMethod void sentOrderToUNOEE_WithOppLines_other_v2() {
        //Create Product
        Product2 pro = new Product2(Name = 'iPhone X', Family = 'Mobile');
        Insert pro;
        
        //Instantiate the Pricebook2 record with StandardPricebookId
        Pricebook2 standardPricebook = new Pricebook2(
            Id = Test.getStandardPricebookId(),
            IsActive = true
        );
        
        //Execute an update DML on the Pricebook2 record, to make IsStandard to true
        Update standardPricebook;
        
        //Query for the Pricebook2 record, to check IsStandard field
        standardPricebook = [SELECT Id, IsStandard FROM Pricebook2 WHERE Id = :standardPricebook.Id];
        //It should return true
        System.assertEquals(true, standardPricebook.IsStandard);      
        
        //Create the PricebookEntry
        PricebookEntry pbe = new PricebookEntry(
            Pricebook2Id = standardPricebook.Id,
            Product2Id = pro.Id,
            UnitPrice = 1020,
            IsActive = true
        );
        Insert pbe;        
        //Query the PricebookEntry record
        pbe = [SELECT Id, Pricebook2.IsStandard FROM PricebookEntry];     
        account             objAcc                     =    createDataDactory.createAccount( true , 'Account_Test', '102547845');
        account             objAccFacturar             =    createDataDactory.createAccount( false , 'Account 65',  '102548458');
        objAccFacturar.PersonEmail = 'facturar@test.com';
        objAccFacturar.Actividad_economica__c       = null;
        insert objAccFacturar;
        RecordType          recTypEmpresa              =    [Select Id, DeveloperName From RecordType Where SobjectType = 'Account' and DeveloperName ='AM_CUE_Cuenta_empresarial' Limit 1];
        opportunity         objOpp                     =    createDataDactory.createOpportunityUNOE( true , objAcc.Id, standardPricebook.id );
        Product2            objProduct                 =    createDataDactory.createProduct2( true );        
        RecordType          recTyp                     =    [Select Id, DeveloperName From RecordType Where SobjectType = 'Account' and DeveloperName ='AM_CUE_Persona_natural' Limit 1];
        Concesionario__c    objConces                  =    createDataDactory.createConcesionario( true );
        opportunityLineItem  objOpporLine              =    createDataDactory.createOpportunityLineItem( true , objProduct.Id ,objOpp.id );
        test.StartTest();
          
                objAcc.AM_Via_principal__c              = 'AV';   
                objAcc.Actividad_economica__c           =   'Comercializadora';
                objAcc.AM_Literal_via_principal__c      = 'L';    
                objAcc.AM_Orientacion_via_principal__c  = 'Norte';      
                objAcc.AM_Literal_via_secundaria__c     = 'as';
                objAcc.AM_BIS2__c                       = true;
                objAcc.AM_Orientacion_via_secundaria__c = 'Oeste';
                objAcc.AM_ID_cuadra__c                  = 'sd';
                objAcc.AM_Complemento__c                = 'Complemento';                
                objAcc.AM_Numero_via_principal__c       = 39;
                objAcc.AM_Ocupacion_pc__c               = 'Empleado';
                update  objAcc; 

                update objAccFacturar;
                objOpp.Facturar_a_nombre_de__c              = objAccFacturar.Id;
                objOpp.Vitrina_de_despacho__c               = objConces.id;
                objOpp.Order_Generated__c                   = true;
                objOpp.Notas_de_despacho__c                 = 'notas';
                update objOpp;

            AutosCrearPedidoEnUNOEE.EnviarPedido( objOpp.Id ); 
            
        test.StopTest();       
    }  
}