/******************************************************************************************************************************
*   @Class          :   AFOG_AnualacionPedido
*   @Author         :   Andrés Oliva andresolivag@gmail.com
*   @Created        :   11/01/2022
*   @Description    :   Esta clase ejecuta acciones para eliminar el pedido.
*
*      Author                   Date                     Description
*      Andrés Oliva              11/01/2022                 Class creation
*******************************************************************************************************************************/
public without sharing class AFOG_HandlerLeadTrigger {
    /***************************************************************************************************************************  
    * @Method          :   beforeUpdate
    * @Author          :   AFOG andresolivag@gmail.com
    * @Created         :   26/04/2022
    * @Description     :   Handler before update
    * @param           :   opportunity  objOpp 
     ****************************************************************************************************************************/  
    public static void beforeUpdate( map< id,lead > mNewLead, map<id,lead > maOldLead ){
        updateLeadDate(  mNewLead,  maOldLead );
    }
     
    /***************************************************************************************************************************  
    * @Method          :   updateLeadDate
    * @Author          :   Andrés Oliva andresolivag@gmail.com
    * @Created         :   26/04/2022
    * @Description     :   Este método se encarga de actualizar la fecha de reasignación del lead del usuario de callcenter  
    *                      'CALL CENTER','CALL CENTER2' a otro usuario de SFDC
    * @param           :   opportunity  objOpp 
    ****************************************************************************************************************************/  
    
    public static void  updateLeadDate( map< id,lead > mapNewLead, map<id,lead > mapOldLead ){
       id idUser = UserInfo.getUserId();
        map<id, user > mapUserCallCenter = new   map<id, user >([SELECT ID, name,IsActive,UserRole.Name from user where UserRole.Name = 'AGENTE CONTACT CENTER' AND Name IN ('CALL CENTER','CALL CENTER2')]);
        for(lead varOld: mapOldLead.values() ){
            if( mapUserCallCenter.containsKey( idUser ) && varOld.OwnerId != mapNewLead.get(varOld.id).OwnerId && mapUserCallCenter.containsKey( varOld.OwnerId )){
                Datetime now = Datetime.now();
                Integer offset = UserInfo.getTimezone().getOffset(now);
                Datetime local = now.addSeconds(offset/1000);
                mapNewLead.get( varOld.id ).AFOG_reasignacionLleadsSARHA__c = now ; 
            }        
            else if(  mapNewLead.get( varOld.id ).AFOG_reasignacionLleadsSARHA__c != varOld.AFOG_reasignacionLleadsSARHA__c  ){
                 mapNewLead.get( varOld.id ).addError('No puede modificar este campo directamente');
            }
        }
    }
     
    
}