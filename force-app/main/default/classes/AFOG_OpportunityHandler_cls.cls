public with sharing class AFOG_OpportunityHandler_cls {
    
    /******************************************************************************************************************
     * Date: 2023-03-02 
     * Author: andresolivag@gmail.com
     * Name: MethodTovalidateMandatoryFieldsToChangePUstatus
     * Description: Ajuste de obligatoriedad de campos - Solicitamos el favor de que los siguientes 
     *              campos que se encuentran en el objeto cuenta en SARHA cómo: cantidad de hijos, nivel socioeconómico, 
     *              fecha de nacimiento, estado civil, ¿Qué actividad realiza en tiempo libre?, grado de escolaridad y 
     *              Deporte que prefiere, sean obligatorios al pasar a PU.
     ******************************************************************************************************************/
    public static void MethodTovalidateMandatoryFieldsToChangePUstatus( map<id, opportunity > mapNewOpp,  map<id, opportunity > mapOldOpp ){
        set< id > setAccId = new  set< id > ();
        for( opportunity varOpp: mapNewOpp.values() ){
            if( varOpp.StageName == 'PU' && mapOldOpp.get( varOpp.Id ).StageName !='PU' ){
                setAccId.add( varOpp.AccountId );
            }
        }   
        list< Account > lstAcc = MethodQuerieAccount(  setAccId );  
        map< id,Boolean > mapaAccFieldsPopulated = MethodFieldsProperlyPopulated( lstAcc );
        for( opportunity varOpp: mapNewOpp.values() ){
            if( mapaAccFieldsPopulated.containsKey( varOpp.AccountId ) && !mapaAccFieldsPopulated.get( varOpp.AccountId ) ){
                varOpp.addError( System.Label.MandatoryFieldsToMovePUstage );
            }
        }
    }
    
    /******************************************************************************************************************
     * Date: 2023-03-02 
     * Author: andresolivag@gmail.com
     * Name: MethodQuerieAccount
     * Description: This method returns person accounts with the mandatory fields to change the stagename to PU
     ******************************************************************************************************************/
    public static list< Account > MethodQuerieAccount( set< id > setAccId ){
        list< account > lstAccount = [  SELECT  Id,Tiene_Hijos__c,AM_Nivel_Socioeconomico__c,
                                                PersonBirthdate,AM_Estado_civil__pc,
                                                Que_actividad_realiza_en_tiempo_libre__pc,
                                                Grado_de_Escolaridad__pc,AM_Deporte_que_prefiere__pc 
                                        FROM    Account 
                                        WHERE   IsPersonAccount =true 
                                                AND id IN: setAccId];
        return lstAccount;
    }

    
    /******************************************************************************************************************
     * Date: 2023-03-02 
     * Author: andresolivag@gmail.com
     * Name: MethodFieldsProperlyPopulated
     * Description: This method returns a map where key ==> Account ID
     *                                              VALUE ==> true (Fields properly populated)
     *                                                        false (one or more fields are not populated properly)
     * return:  map< id,Boolean >  key ==> Account ID
     *                                              VALUE ==> true (Fields properly populated)
     *                                                        false (one or more fields are not populated properly)
     ******************************************************************************************************************/
    public static map< id,Boolean > MethodFieldsProperlyPopulated( list< Account > lstAccounts ){
        map< id,Boolean > mapFieldsPopulated = new map< id,Boolean >();
        for( account varAcc: lstAccounts ){
            if( String.IsNotBlank( varAcc.Tiene_Hijos__c ) && String.IsNotBlank( varAcc.AM_Nivel_Socioeconomico__c ) &&
                 varAcc.PersonBirthdate !=null && String.IsNotBlank( varAcc.AM_Estado_civil__pc ) && 
                String.IsNotBlank( varAcc.Que_actividad_realiza_en_tiempo_libre__pc ) && String.IsNotBlank( varAcc.Grado_de_Escolaridad__pc )&&
                String.IsNotBlank( varAcc.AM_Deporte_que_prefiere__pc )  ){
                    mapFieldsPopulated.put( varAcc.Id, true );
            }
            else{
                mapFieldsPopulated.put( varAcc.Id, false );
            }
        }
        return mapFieldsPopulated;
    }

}