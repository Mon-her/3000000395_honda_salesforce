trigger LeadTrigger on Lead ( after insert, before update) {//(before update, before insert, after insert, after update) {
    new LeadTriggerHandler().run();
    
    if(Trigger.IsUpdate && Trigger.IsBefore ){
        AFOG_HandlerLeadTrigger.beforeUpdate( Trigger.NewMap, Trigger.oldMap );
    }
}