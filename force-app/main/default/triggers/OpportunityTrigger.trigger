trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {     
    if( trigger.isUpdate && trigger.isBefore ){
        AFOG_OpportunityHandler_cls.MethodTovalidateMandatoryFieldsToChangePUstatus( trigger.newMap, trigger.oldMap );
        AFOG_OpportunityHandlerMotos_cls.crearActividadSeguimientoMotos( trigger.new );
    }       
}