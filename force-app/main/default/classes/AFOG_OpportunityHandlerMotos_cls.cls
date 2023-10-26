public with sharing class AFOG_OpportunityHandlerMotos_cls {
      
    /***************************************************************************************************************************  
    * @Method          :   crearActividadSeguimientoMotos
    * @Author          :   Andrés Oliva andresolivag@gmail.com
    * @Created         :   11/01/2022
    * @Description     :   En la oportunidad quitar el checkbox de se creó pedido en UNO-E y regresar la oportunidad a P3
    * @param           :   opportunity  objOpp 
    ****************************************************************************************************************************/   
    public static void crearActividadSeguimientoMotos( list< opportunity > lstNewOpp ){
        list< task > lstTareasMotos = new list< task >();
        list< recordtype > lstMotos = [select id,DeveloperName,SobjectType from recordtype where  DeveloperName  in ('Motos_Opportunity_Layout','Motos_Tareas') ];
        map< string,id > mapNameRT =  new  map< string,id > (); 
        map< string,id > mapidRT =  new  map< string,id > (); 
        for( recordtype varRT: lstMotos ){
            mapNameRT.put( varRT.DeveloperName, varRT.Id );
            mapidRT.put( varRT.Id, varRT.DeveloperName );
        }
        for(opportunity varOpp: lstNewOpp ){
            if( mapidRT.containsKey( varOpp.recordtypeId )){
                task oTask = new task();
                otask.Subject                           =   'Seguimiento a Oportunidad';
                otask.status                            =   'Programada';//
                otask.Priority                          =   'Normal';
                otask.AM_Telefono_Light__c             =   varOpp.Telefono_contacto__c;
                otask.ownerId                           =   varOpp.OwnerId;
                otask.Fecha_de_cierre_de_oportunidad__c =   varOpp.Fecha_de_validez__c;
                otask.Etapa_de_Oportunidad_del__c       =   varopp.StageName;
                otask.activityDate                      =   system.today().addDays(1) ;
                otask.IsReminderSet                     =   false;
                oTask.WhatId                            =   varOpp.Id;
                oTask.Producto_de_Interes__c            =   varOpp.Producto_de_Interes__c;
                oTask.RecordTypeId                      =   mapNameRT.get('Motos_Tareas');
                lstTareasMotos.add( oTask );
            }
        }
        if( !lstTareasMotos.isEmpty()){
            insert lstTareasMotos;
        }
    }
}