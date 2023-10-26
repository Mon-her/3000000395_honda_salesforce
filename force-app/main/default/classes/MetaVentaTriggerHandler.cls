//Made by me, August 2021
public class MetaVentaTriggerHandler extends TriggerHandler{
    //Listas de MetaVenta
    private list<Meta_de_Venta__c> newMetaVentaList;
    
    //Mapa de MetaVenta de tipo id, MetaVenta
    private Map<Id, Meta_de_Venta__c> newMetaVentaMap;
    private Map<Id, Meta_de_Venta__c> oldMetaVentaMap;

    public MetaVentaTriggerHandler() {
        //Cargamos la lista de Opportunity con lo que viene en el contexto de trigger.new
        newMetaVentaList = (list<Meta_de_Venta__c>) Trigger.New;
        
        //Cargamos el mapa de Opportunity con lo que viene en el contexto de trigger.newmap
        newMetaVentaMap = (Map<Id, Meta_de_Venta__c>) Trigger.NewMap;
        
        //Cargamos el mapa de Opportunity con lo que viene en el contexto de trigger.oldmap
        oldMetaVentaMap = (Map<Id, Meta_de_Venta__c>) Trigger.OldMap;
        
    }
    
    public override void afterInsert(){
        
        set<string> setFamilias = new set<String>();
        for (Meta_de_Venta__c mv: newMetaVentaList){
            setFamilias.add(mv.Version__c);
        }
        
        system.debug('setFamilias: ' + setFamilias);
        
        //User GGAutos
        User usuarioGGAutos = [select Id from User where userName=:Label.UserNameGGAutos];
        
        //look for olis with the families in new Meta Ventas 
        list<OpportunityLineItem> lstOlis = [select Id,Product2.Family, Opportunity.OwnerId, Opportunity.Owner.ManagerId from OpportunityLineItem where Opportunity.StageName in ('P5','PU') and Product2.Family in:setFamilias ];
        list<OpportunityLineItem> lstOlisUpdate = new list<OpportunityLineItem>();
        //look for meta de Venta for Opportunity ownerId and Owner.Manager Id
        String mesActual = monthNames.get(system.today().month());
        String anioActual = String.valueof(system.today().year());
        list<Meta_de_Venta__c> listaMetaVentas = [select Id,Version__c,Asesor__c from Meta_de_Venta__c where Version__c in:setFamilias and Mes__c=:mesActual and Anio__c=:anioActual];
        map<String, map<Id,Meta_de_Venta__c>> mapMetasxVersionxUsuario = new map<String, map<Id,Meta_de_Venta__c>>(); //meta de ventas por usuario agrupados por versión
        for (Meta_de_Venta__c mv: listaMetaVentas){
            if (!mapMetasxVersionxUsuario.containsKey(mv.Version__c)) mapMetasxVersionxUsuario.put(mv.Version__c, new map<Id,Meta_de_Venta__c>());
            mapMetasxVersionxUsuario.get(mv.Version__c).put(mv.Asesor__c, mv);
        }
        
        for (OpportunityLineItem oli: lstOlis){
            map<Id,Meta_de_Venta__c> mapVentasxUsuario = mapMetasxVersionxUsuario.get(oli.Product2.Family);
            if (mapVentasxUsuario!=null){
            	oli.Meta_asesor__c = mapVentasxUsuario.get(oli.Opportunity.OwnerId)?.Id; 
                oli.Meta_Manager__c = mapVentasxUsuario.get(oli.Opportunity.Owner.ManagerId)?.Id;
                oli.Meta_GerenteGeneral__c = mapVentasxUsuario.get(usuarioGGAutos.Id)?.Id;
                lstOlisUpdate.add(oli);
            }
        }
        
        batchMetaVentaUpdatingOlis shn = new batchMetaVentaUpdatingOlis(lstOlisUpdate); 
        database.executeBatch(shn, 1);
        
    }
    
    Map<Integer,String> monthNames = new Map<Integer,String>{
        1 => 'Enero',
        2 => 'Febrero',
        3 => 'Marzo',
        4 => 'Abril',
        5 => 'Mayo',
        6 => 'Junio',
        7 => 'Julio',
        8 => 'Agosto',
        9 => 'Septiembre',
        10 => 'Octubre',
        11 => 'Noviembre',
        12 => 'Diciembre'
    };
}