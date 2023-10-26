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
public with sharing class createDataDactory {
    
      /*********************************************************************************************************
    * @name            createAccount
    * @author          Andres Oliva <andresolivag@gmail.com>
    * @created         30 / 07 / 2020
    * @description     Description of your code
    * @param           String param : Explanation
    * @return          Explanation of the return value
   **********************************************************************************************************/
    public static Concesionario__c createConcesionario( Boolean isInsert ){ 
        Concesionario__c oConcesio = new Concesionario__c();
        oConcesio.Name = 'Concesion test';
        oConcesio.Agencia__c    = 'Cali';
        oConcesio.Ciudad__c     =   'CALI';
        if( isInsert ){
            insert oConcesio;    
        }
        return oConcesio;       
    }
    /*********************************************************************************************************
    * @name            createAccount
    * @author          Andres Oliva <andresolivag@gmail.com>
    * @created         30 / 07 / 2020
    * @description     Description of your code
    * @param           String param : Explanation
    * @return          Explanation of the return value
   **********************************************************************************************************/
    public static Pricebook2 createPricebookId( Boolean isInsert, string sPriceName  ){ 
        Pricebook2 pricebk = new Pricebook2();
        pricebk.Name = sPriceName;
        pricebk.IsActive = true;
        pricebk.Description = 'Price Book 2009 Products';
        if( isInsert ){
            insert pricebk;    
        }
        return pricebk;       
    }

    /*********************************************************************************************************
    * @name            createAccount
    * @author          Andres Oliva <andresolivag@gmail.com>
    * @created         30 / 07 / 2020
    * @description     Description of your code
    * @param           String param : Explanation
    * @return          Explanation of the return value
   **********************************************************************************************************/
  public static PricebookEntry createPricebookEntry( Boolean isInsert, string productId, string pricebookId   ){ 
    PricebookEntry pricebkEntry = new PricebookEntry();
    pricebkEntry.IsActive           =   true;
    pricebkEntry.Product2Id         =   productId;
    pricebkEntry.Pricebook2Id       =   pricebookId;
    pricebkEntry.UnitPrice          =   500;
    if( isInsert ){
        insert pricebkEntry;    
    }
    return pricebkEntry;       
}
    

     /*********************************************************************************************************
    * @name            createAccount
    * @author          Andres Oliva <andresolivag@gmail.com>
    * @created         30 / 07 / 2020
    * @description     Description of your code
    * @param           String param : Explanation
    * @return          Explanation of the return value
   **********************************************************************************************************/
    public static Product2 createProduct2( Boolean isInsert  ){
        Product2 objProduct                             = new Product2();    
        objProduct.Name                                 = 'Product 2';
        objProduct.IsActive                             = true;        
        if( isInsert ){
            insert objProduct;    
        }
        return objProduct;             
    }
      /*********************************************************************************************************
    * @name            createAccount
    * @author          Andres Oliva <andresolivag@gmail.com>
    * @created         30 / 07 / 2020
    * @description     Description of your code
    * @param           String param : Explanation
    * @return          Explanation of the return value
   **********************************************************************************************************/
   public static account createAccountPedido( Boolean isInsert , string sName, string iDocumentNumber){
    Account objAcc = new Account();
    objAcc.Phone = '8624597';
    objAcc.FirstName ='test';
    objAcc.LastName = sName;
    objAcc.Salutation = 'Sra.';
    objAcc.AM_Como_se_entero_de_la_marca__c = 'Radio';
    objAcc.AM_Genero__pc = 'Masculino';
    objAcc.PersonEmail = sName+'test@test.com';
    //objAcc.PersonOtherPhone = 3256745;
    objAcc.AM_Numero_de_documento__c = iDocumentNumber;
    objAcc.AM_Tipo_de_documento__c ='Cédula de ciudadanía';
    if( isInsert ){
        insert objAcc;
    }
    return objAcc;            
}

/*********************************************************************************************************
 * @name            createAccount
 * @author          Andres Oliva <andresolivag@gmail.com>
 * @created         30 / 07 / 2020
 * @description     Description of your code
 * @param           String param : Explanation
 * @return          Explanation of the return value
**********************************************************************************************************/
public static opportunity createOpportunityUNOE( Boolean isInsert , id accountId ,id pricebookId ){
    opportunity objOpp                               = new opportunity();
    objOpp.Name                                      = 'Opp test';
    objOpp.AccountId                                 = accountId;
    objOpp.CloseDate                                 = system.today().addDays( 10 );
    objOpp.Propietario_vehiculo__c                   = accountId;
    objOpp.Forma_de_pago__c                          = 'Contado';
    objOpp.Facturar_a_nombre_de__c                   = accountId;
    objOpp.LeadSource                                = 'Actividades comerciales';
    objOpp.StageName                                 = 'P2';
    objOpp.Es_un_HONDA_adicional__c                  = 'No';
    objOpp.Linea_Modelo__c                           =  'N/A';
    objOpp.Otra_Marca_Considero_Opcion_1__c          = 'DODGE';
    objOpp.Linea_Modelo_Marca_Considero_1__c         = 'DURANGO';
    objOpp.Posee_vehiculo_de_otra_marca__c           = 'NO';
    objOpp.MarcaLineaModelo__c                       = 'NO';
    objOpp.Otra_Marca_Considero_Opcion_2__c          = 'FORD';
    objOpp.Linea_Modelo_Marca_Considero_2__c         = 'SCAPE';
    objOpp.Pricebook2Id                              = pricebookId;

    if( isInsert ){
        insert objOpp;
    }
    return objOpp;             
}

    
    /*********************************************************************************************************
    * @name            createAccount
    * @author          Andres Oliva <andresolivag@gmail.com>
    * @created         30 / 07 / 2020
    * @description     Description of your code
    * @param           String param : Explanation
    * @return          Explanation of the return value
   **********************************************************************************************************/
   public static opportunityLineItem createOpportunityLineItem( Boolean isInsert , id productId ,id opportunityId){
        opportunityLineItem objOppLine                  = new opportunityLineItem();    
        objOppLine.Descuento_valor__c                   = 500;
        objOppLine.Precio_de_lista_antes_de_impuesto__c = 2000;
        objOppLine.Product2Id                           = productId;   
        objOppLine.OpportunityId                        = opportunityId;
        objOppLine.UnitPrice                            = 500;
        objOppLine.quantity                             = 1;
        if( isInsert ){
            insert objOppLine;    
        }
        return objOppLine;             
    }
    /*********************************************************************************************************
     * @name            The name of your class or method
     * @author          Andres Oliva <andresolivag@gmail.com>
     * @created         30 / 07 / 2020
     * @description     Create aprodcut record for test class 
     * @param           String param : Explanation
     * @return          Explanation of the return value
    **********************************************************************************************************/
    public static AM_Producto__c createProduct( Boolean isInsert ){
        AM_Producto__c objPrd = new AM_Producto__c();
        objPrd.AM_Activo__c = true;
        objPrd.AM_Ano__c = 2014;
        objPrd.AM_Codigo_de_producto__c = 'test';
        objPrd.AM_Color_disponible__c = 'AZUL SPORT';
        objPrd.AM_Precio_de_lista__c = 2000000;
        objPrd.Name = 'MotoTest';
        objPrd.Plan_Tipo_de_Producto_Unoe__c = 'MOTOCICLETA';
        objPrd.Plan_Tipo_de_Modelo_Unoe__c = 'GLAMOUR';
        if( isInsert ){
            insert objPrd;
        } 
        return objPrd;
    }

    /*********************************************************************************************************
     * @name            The name of your class or method
     * @author          Andres Oliva <andresolivag@gmail.com>
     * @created         30 / 07 / 2020
     * @description     Description of your code
     * @param           String param : Explanation
     * @return          Explanation of the return value
    **********************************************************************************************************/
    public static AM_Plan_financiacion__c createFinantialPlan( Boolean isInsert ){
        AM_Plan_financiacion__c objPlanF = new AM_Plan_financiacion__c();
        objPlanF.Name = 'Test Plan Financiacion';
        objPlanF.AM_Activo__c = true;
        objPlanF.AM_Plan_financiacion__c = 'Flexible';
        if( isInsert ){
            insert objPlanF;
        }
        return objPlanF;        
    }

    /*********************************************************************************************************
     * @name            The name of your class or method
     * @author          Andres Oliva <andresolivag@gmail.com>
     * @created         30 / 07 / 2020
     * @description     Create a AM_Oportunidad__c (cotización) record for test class
     * @param           String param : Explanation
     * @return          Explanation of the return value
    **********************************************************************************************************/
    public static AM_Oportunidad__c createQuote( Boolean isInsert, id accountId ,id productId, id finantilPlanId ){
        AM_Oportunidad__c objOpp = new AM_Oportunidad__c();
        objOpp.AM_Usuario_motocicleta__c = accountId;
        objOpp.AM_Propietario_motocicleta__c  = accountId;
        objOpp.AM_Fecha_de_cierre__c = system.today().addDays( 2 );
        objOpp.AM_Modelo_de_interes__c = productId;
        objOpp.AM_Color__c = 'AZUL SPORT';
        objOpp.AM_Valor_cuota_inicial__c = 100000;
        objOpp.AM_Valor_matricula__c = 20000;
        objOpp.AM_Valor_SOAT__c = 20000;
        objOpp.AM_Plazo__c = 12;
        objOpp.AM_Desea_incluir_seguro_de_robo__c = 'Si';
        objOpp.Uso_de_Motocicleta__c = 'Trabajo';
        objOpp.AM_Plan_de_financiacion__c = finantilPlanId;
        objOpp.AM_Canal_de_atencion__c = 'E-mail';
        objOpp.AM_Estado1__c = 'Activo';     
        if( isInsert ){
            insert objOpp;
        }   
        return objOpp;        
    }

    /*********************************************************************************************************
     * @name            The name of your class or method
     * @author          Andres Oliva <andresolivag@gmail.com>
     * @created         30 / 07 / 2020
     * @description     Description of your code
     * @param           String param : Explanation
     * @return          Explanation of the return value
    **********************************************************************************************************/
        public static MC_Contactos__c createContact( Boolean isInsert, id idReferidor  ){
        MC_Contactos__c Contacto1 = new MC_Contactos__c(); 
        Contacto1.MC_tratamiento_prospecto__c = 'Sr.';
        Contacto1.Name = 'Test1';
        Contacto1.MC_apellidos_prospecto__c = 'Test1';
        Contacto1.MC_fuente_prospecto__c = 'Referidos';
        Contacto1.MC_correo_electronico_prospecto__c = 'me@test1.com';
        Contacto1.MC_celular_prospecto__c = '3147710584';
        Contacto1.MC_No_autoriza_tratamiento_de_datosLeads__c = True;
        Contacto1.MC_No_autoriza_tratamiento_de_datosLeads__c = true;
        Contacto1.MC_Ultimo_comentaro__c = 'Nada';
        Contacto1.MC_Fecha_ultimo_contacto__c = Date.newInstance(2019, 12, 9);
        Contacto1.MC_Autoriza_tratadedatos_personales__c = 'No';
        Contacto1.SO_Referidor__c = idReferidor;
        if( isInsert ){
            insert Contacto1;
        }  
        return Contacto1;
    }

    /*********************************************************************************************************
     * @name            createAccount
     * @author          Andres Oliva <andresolivag@gmail.com>
     * @created         30 / 07 / 2020
     * @description     Description of your code
     * @param           String param : Explanation
     * @return          Explanation of the return value
    **********************************************************************************************************/
    public static account createAccount( Boolean isInsert , string sName, string iDocumentNumber){
           Account objAcc = new Account();
        objAcc.Phone = '8624597';
        objAcc.FirstName ='test';
        objAcc.LastName = sName;
        objAcc.Salutation = 'Sra.';
        objAcc.AM_Como_se_entero_de_la_marca__c = 'Radio';
        objAcc.AM_Genero__pc = 'Masculino';
        objAcc.PersonEmail = sName+'test@test.com';
        //objAcc.PersonOtherPhone = 3256745;
        objAcc.AM_Numero_de_documento__c = iDocumentNumber;
        objAcc.AM_Tipo_de_documento__c ='Cédula de ciudadanía';
        if( isInsert ){
            insert objAcc;
        }
        return objAcc;            
    }

    /*********************************************************************************************************
     * @name            createAccount
     * @author          Andres Oliva <andresolivag@gmail.com>
     * @created         30 / 07 / 2020
     * @description     Description of your code
     * @param           String param : Explanation
     * @return          Explanation of the return value
    **********************************************************************************************************/
    public static opportunity createOpportunity( Boolean isInsert , id accountId ){
        opportunity objOpp              = new opportunity();
        objOpp.Name                     = 'Opp test';
        objOpp.AccountId                = accountId;
        objOpp.CloseDate                = system.today().addDays( 10 );
        objOpp.Propietario_vehiculo__c  = accountId;
        objOpp.Forma_de_pago__c         = 'Contado';
        objOpp.LeadSource               = 'Actividades comerciales';
        objOpp.StageName                = 'P2';
        objOpp.Como_se_entero_del_vehiculo_o_marca__c   = 'Actividades comerciales';
        objOpp.Vehiculo_Anterior_MarcaLineaModelo__c    = 'N/A';
        objOpp.Es_un_HONDA_adicional__c                 = 'No';
        objOpp.Linea_Modelo__c                          =  'N/A';
        objOpp.Otra_Marca_Considero_Opcion_1__c         = 'DODGE';
        objOpp.Linea_Modelo_Marca_Considero_1__c        = 'DURANGO';
        objOpp.Posee_vehiculo_de_otra_marca__c          = 'NO';
        objOpp.MarcaLineaModelo__c                      = 'NO';
        objOpp.MarcaLineaModelo1__c                     = 'N/A';
        objOpp.Otra_Marca_Considero_Opcion_2__c         = 'FORD';
        objOpp.Linea_Modelo_Marca_Considero_2__c        = 'SCAPE';
        objOpp.Como_se_entero_del_vehiculo_o_marca__c = 'Actividades comerciales';
        if( isInsert ){
            insert objOpp;
        }
        return objOpp;             
    }
     /*********************************************************************************************************
     * @name            createtask
     * @author          Andres Oliva <andresolivag@gmail.com>
     * @created         30 / 07 / 2020
     * @description     Description of your code
     * @param           String param : Explanation
     * @return          Explanation of the return value
    **********************************************************************************************************/
    public static task createtask( Boolean isInsert ,  id whatId_opp){
        task objTask              = new task();
        objTask.WhatId            = whatId_opp;
        objTask.Subject           = 'Seguimiento a Oportunidad';
        objTask.ActivityDate      =  system.today().addDays( 5 );
        objTask.Description       = 'Tarea 1 de seguimeinto';
        objTask.Status            = 'Completada'; 
        if( isInsert ){
            insert objTask;
        }
        return objTask;             
    }
}