//Generated by wsdl2apex

public class AsyncFanalcaCrearModificarClientesUNOEE {
    public class DT_GenericResponseFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            FanalcaCrearModificarClientesUNOEE.DT_GenericResponse response = (FanalcaCrearModificarClientesUNOEE.DT_GenericResponse)System.WebServiceCallout.endInvoke(this);
            return response.id;
        }
    }
    public class AsyncHTTPS_Port {
        public String endpoint_x = 'https://fnpodev01.fanalca.lo:50001/XISOAPAdapter/MessageServlet?senderParty=&senderService=BC_SALESFORCE&receiverParty=&receiverService=&interface=SI_CR_CUSTOMER_SQL_OUT&interfaceNamespace=http%3A%2F%2Ffanalca.com%2FSalesForceCustomer2Unoe';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://fanalca.com/SalesForceCustomer2Unoe', 'FanalcaCrearModificarClientesUNOEE'};
        public AsyncFanalcaCrearModificarClientesUNOEE.DT_GenericResponseFuture beginINSERT_x(System.Continuation continuation,String nit,String id_tipo_ident,String razon_social,String apellido1,String apelido2,String nombre1,String nombre2,String id_sucursal,String descripcion_sucursal,Integer ind_tipo_tercero,String direccion1,String direccion2,String fax,String celular,String email_emp,String email_persona,String id_ciudad,String autoriza_datos,Double cupo_credito) {
            FanalcaCrearModificarClientesUNOEE.DT_CREATE_CUSTOMER request_x = new FanalcaCrearModificarClientesUNOEE.DT_CREATE_CUSTOMER();
            request_x.nit = nit;
            request_x.id_tipo_ident = id_tipo_ident;
            request_x.razon_social = razon_social;
            request_x.apellido1 = apellido1;
            request_x.apelido2 = apelido2;
            request_x.nombre1 = nombre1;
            request_x.nombre2 = nombre2;
            request_x.id_sucursal = id_sucursal;
            request_x.descripcion_sucursal = descripcion_sucursal;
            request_x.ind_tipo_tercero = ind_tipo_tercero;
            request_x.direccion1 = direccion1;
            request_x.direccion2 = direccion2;
            request_x.fax = fax;
            request_x.celular = celular;
            request_x.email_emp = email_emp;
            request_x.email_persona = email_persona;
            request_x.id_ciudad = id_ciudad;
            request_x.autoriza_datos = autoriza_datos;
            request_x.cupo_credito = cupo_credito;
            return (AsyncFanalcaCrearModificarClientesUNOEE.DT_GenericResponseFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncFanalcaCrearModificarClientesUNOEE.DT_GenericResponseFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://sap.com/xi/WebService/soap1.1',
              'http://fanalca.com/SalesForceCustomer2Unoe',
              'MT_CREATE_CUSTOMER_OUT',
              'http://fanalca.com/SalesForceCustomer2Unoe',
              'MT_GenericResponse_IN',
              'FanalcaCrearModificarClientesUNOEE.DT_GenericResponse'}
            );
        }
    }
}