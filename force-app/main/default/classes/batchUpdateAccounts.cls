public class batchUpdateAccounts implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
		String rtOppAutos = 'Oportunidad_Autos';
        set<String> setProfilesAdministradores = new set<String>{'System Administrator','Administrador del sistema','Integraciones'};
        return Database.getQueryLocator(
            'SELECT Id,Owner.Profile.Name, Owner.isActive, RecordType.DeveloperName, Owner.ManagerId, (select id from OpportunityTeamMembers) FROM Opportunity Where Owner.isActive=true and Owner.Manager.isActive=true and owner.profile.name not in:setProfilesAdministradores and RecordType.DeveloperName=:rtOppAutos'
            //'SELECT ID FROM Account Where CreatedDate > 2021-07-01T00:00:00Z and Genero__c=null and isPersonAccount=true'
        );
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> records){
        // process each batch of records
        //Triggerhandler.bypass('AccountTriggerHandler');
        //Triggerhandler.bypass('ContactTriggerHandler');
        //Triggerhandler.bypass('TaskTriggerHandler');
        system.debug(records.size());
        
        list<OpportunityTeamMember> lstOppTM = new list<OpportunityTeamMember>();
        for (Opportunity op: records){
            if (op.OpportunityTeamMembers.size()==0){
                OpportunityTeamMember  opTeam = New OpportunityTeamMember();
                opTeam.OpportunityAccessLevel = 'Edit';
                opTeam.OpportunityId = op.Id;
                opTeam.UserId =  op.Owner.ManagerId;
                opTeam.TeamMemberRole = 'Sales Manager';//'Gerente_ventas';
                
                lstOppTM.add(opTeam) ;  
            }
            
        }
       system.debug('cantidad Opp Team Members to Create: ' + lstOppTM.size());
        insert lstOppTM;
        //update records;
    }
    public void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}