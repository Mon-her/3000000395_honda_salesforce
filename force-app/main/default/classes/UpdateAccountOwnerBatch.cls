/**
 * Fanalca
 * @author           Juan Ansaldi
 * Description:      .
 *
 * Changes (Version)
 * -------------------------------------
 *           No.     Date            Author                  Description
 *           -----   ----------      --------------------    ---------------
 * @version  1.0     03/17/2021      Juan Ansaldi            Class definition.
 * @version  1.1     Aug/2021        Me            			 Tuning this class and changing vitrina to account.
 *********************************************************************************************************/
public with sharing class UpdateAccountOwnerBatch implements Database.Batchable<sObject> {
  /*list<Id> accountIds;
  Id newOwnerUser;
  public UpdateAccountOwnerBatch(List<Id> accIds, list<Id> newOwners) {
      accountIds = accIds;
      newOwnerUser = newOwner;
  }*/
  list<changeAccountOwner.accountOwnerChangesData> datosCuentas;
  map<Id,changeAccountOwner.accountOwnerChangesData> mapDatosCuentas;
  set<Id> newOwnerIds;
  map<Id, list<Id>> mapConcesionariosXUsuario;
  public UpdateAccountOwnerBatch(list<changeAccountOwner.accountOwnerChangesData> datos) {
      datosCuentas = datos;
      mapDatosCuentas = new map<Id,changeAccountOwner.accountOwnerChangesData>();
      newOwnerIds = new set<Id>();  
      mapConcesionariosXUsuario = new map<Id, list<Id>>();
      for (changeAccountOwner.accountOwnerChangesData dato: datos){
      	mapDatosCuentas.put(dato.accountId, dato);
        newOwnerIds.add(dato.newOwnerId);  
      }
      
      for (Miembro_de_Concesionario__c mc: [Select Id,Nombre_de_asesor__c,Concesionario__c from Miembro_de_Concesionario__c where Nombre_de_asesor__c in: newOwnerIds]){
          if (!mapConcesionariosXUsuario.containsKey(mc.Nombre_de_asesor__c)) mapConcesionariosXUsuario.put(mc.Nombre_de_asesor__c, new list<Id>());
          mapConcesionariosXUsuario.get(mc.Nombre_de_asesor__c).add(mc.Concesionario__c);
      }
      
      system.debug('Constructor UpdateAccountOwnerBatch. mapDatosCuentas: ' + mapDatosCuentas.values());
  }
    
  public Database.QueryLocator start(Database.BatchableContext bc) {
    String limitString = '';
    if (Test.isRunningTest()) {
      limitString = 'LIMIT 20';
    }
    
   	//set<Id> accountIds = new set<Id>();
    //for (changeAccountOwner.accountOwnerChangesData dato: datosCuentas){
	//	accountIds.add(dato.accountId);	          
    //}
      
    String query;// = 'Select Id, OwnerId from Account where Id in:mapDatosCuentas.keySet() '+ limitString;//String query = 'Select Id, OwnerId from Account where Id =\'' + (new list<Id>(accountIds))[0] +'\''+ limitString;
    if (datosCuentas.size()==1) query = 'Select Id, OwnerId from Account where Id = \''+ datosCuentas.get(0).accountId +'\' '+ limitString;
    else query = 'Select Id, OwnerId from Account where Id in:mapDatosCuentas.keySet() '+ limitString;
    system.debug('query: ' + query);  
    return Database.getQueryLocator(query);
  }

  public void execute(Database.BatchableContext BC, List<Account> accounts) {
      List<Account> lstUpdateAccounts = new List<Account>();
      for (Account acc : accounts) {
         Account updateAcc = new Account();
         updateAcc.Id = acc.Id;
         updateAcc.OwnerId = mapDatosCuentas.get(acc.Id).newOwnerId;//updateAcc.OwnerId = newOwnerUser;
          //buscar en el mapa de concesionarios por usuario y setear concesionario cuando solo tiene un concesionario matriculado el new owner
          if (mapConcesionariosXUsuario.containsKey(updateAcc.OwnerId)){
              if (mapConcesionariosXUsuario.get(updateAcc.OwnerId).size()==1) updateAcc.Concesionario_Vitrina__c= mapConcesionariosXUsuario.get(updateAcc.OwnerId)[0];
          }
         lstUpdateAccounts.add(updateAcc);
      }
      update lstUpdateAccounts;
  }

  public void finish(Database.BatchableContext BC) {
      UpdateOpportunityOwnerBatch batchable = new UpdateOpportunityOwnerBatch(datosCuentas);//UpdateOpportunityOwnerBatch batchable = new UpdateOpportunityOwnerBatch(accountIds, newOwnerUser);
      Database.executebatch(batchable, 1);
  }
}