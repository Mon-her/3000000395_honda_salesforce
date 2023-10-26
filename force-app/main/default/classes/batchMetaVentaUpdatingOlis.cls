//Created by me, Aug '21
//update the Olis, the olis have been processed at the MetaVentaTriggerHandler, this class calls this batch
public class batchMetaVentaUpdatingOlis implements Database.Batchable<OpportunityLineItem> {
	list<OpportunityLineItem> datosUpdate;
       
    public batchMetaVentaUpdatingOlis(list<OpportunityLineItem> datos) {
        datosUpdate = datos;
       
        system.debug('Constructor batchMetaVentaUpdatingOlis.datos: ' + datosUpdate);
    }
    
    public Iterable<OpportunityLineItem> start(Database.BatchableContext bc) {
    	return datosUpdate;
  	}

    public void execute(Database.BatchableContext bc, List<OpportunityLineItem> iteraciones){
       update iteraciones;
    }
     
    public void finish(Database.BatchableContext BC) {
        
    }
}