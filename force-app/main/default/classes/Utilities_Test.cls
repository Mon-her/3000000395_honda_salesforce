@isTest
public class Utilities_Test {
    public static testmethod void testear(){
        Utilities.getTipoDocumentoSAP_To_SF('anything');
        Utilities.getTipoDocumentoSF_To_SAP('anything');
        Utilities.getSalutationSAP_To_SF('anything');
        Utilities.getSalutationSF_To_SAP('anything');
        
        Utilities.getTipoDocumentoSF_To_UNOEE('anything');
        Utilities.getTipoDocumentoUNOEE_To_SF('anything');
    }
}