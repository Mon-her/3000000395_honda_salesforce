//Generated by wsdl2apex

public class AutosCrearPedidoEnUnoeeSoapWs {
    public class LogInfo {
        public String category;
        public String level;
        private String[] category_type_info = new String[]{'category','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] level_type_info = new String[]{'level','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee','true','false'};
        private String[] field_order_type_info = new String[]{'category','level'};
    }
    public class DebuggingInfo_element {
        public String debugLog;
        private String[] debugLog_type_info = new String[]{'debugLog','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee','true','false'};
        private String[] field_order_type_info = new String[]{'debugLog'};
    }
    public class address {
        public String city;
        public String country;
        public String countryCode;
        public String geocodeAccuracy;
        public String postalCode;
        public String state;
        public String stateCode;
        public String street;
        private String[] city_type_info = new String[]{'city','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] country_type_info = new String[]{'country','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] countryCode_type_info = new String[]{'countryCode','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] geocodeAccuracy_type_info = new String[]{'geocodeAccuracy','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] postalCode_type_info = new String[]{'postalCode','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] state_type_info = new String[]{'state','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] stateCode_type_info = new String[]{'stateCode','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] street_type_info = new String[]{'street','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee','true','false'};
        private String[] field_order_type_info = new String[]{'city','country','countryCode','geocodeAccuracy','postalCode','state','stateCode','street'};
    }
    public class crearResponse_element {
        public AutosCrearPedidoEnUnoeeSoapWs.Output[] result;
        private String[] result_type_info = new String[]{'result','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee','true','false'};
        private String[] field_order_type_info = new String[]{'result'};
    }
    public class SessionHeader_element {
        public String sessionId;
        private String[] sessionId_type_info = new String[]{'sessionId','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee','true','false'};
        private String[] field_order_type_info = new String[]{'sessionId'};
    }
    public class CrearInput {
        public String f419_direccion1;
        public String f419_email;
        public String f419_id_ciudad;
        public String f419_telefono;
        public String f430_fecha_entrega;
        public String f430_id_co;
        public String f430_id_cond_pago;
        public String f430_id_moneda_local;
        public String f430_id_punto_envio;
        public String f430_id_sucursal_fact;
        public String f430_id_sucursal_rem;
        public String f430_id_tercero_fact;
        public String f430_id_tercero_rem;
        public String f430_id_tercero_vendedor;
        public String f430_id_tipo_cli_fact;
        public String f430_id_tipo_docto;
        public Decimal f430_ind_backorder;
        public Decimal f430_num_dias_entrega;
        public String f430_num_docto_referencia;
        public String f430_referencia;
        public Decimal f431_cant_pedida_base;
        public Decimal f431_consec_docto;
        public String f431_detalle;
        public String f431_fecha_entrega;
        public String f431_id_bodega;
        public String f431_id_ccosto_movto;
        public String f431_id_co;
        public String f431_id_co_movto;
        public Decimal f431_id_concepto;
        public String f431_id_ext1_detalle;
        public String f431_id_lista_precio;
        public String f431_id_motivo;
        public String f431_id_punto_envio;
        public String f431_id_tipo_docto;
        public String f431_id_un_movto;
        public String f431_id_unidad_medida;
        public Decimal f431_ind_backorder;
        public Decimal f431_ind_impto_asumido;
        public Decimal f431_ind_obsequio;
        public Decimal f431_ind_precio;
        public String f431_notas;
        public Decimal f431_nro_registro;
        public Decimal f431_num_dias_entrega;
        public Decimal f431_precio_unitario;
        public String f431_referencia_item;
        private String[] f419_direccion1_type_info = new String[]{'f419_direccion1','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f419_email_type_info = new String[]{'f419_email','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f419_id_ciudad_type_info = new String[]{'f419_id_ciudad','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f419_telefono_type_info = new String[]{'f419_telefono','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_fecha_entrega_type_info = new String[]{'f430_fecha_entrega','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_id_co_type_info = new String[]{'f430_id_co','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_id_cond_pago_type_info = new String[]{'f430_id_cond_pago','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_id_moneda_local_type_info = new String[]{'f430_id_moneda_local','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_id_punto_envio_type_info = new String[]{'f430_id_punto_envio','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_id_sucursal_fact_type_info = new String[]{'f430_id_sucursal_fact','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_id_sucursal_rem_type_info = new String[]{'f430_id_sucursal_rem','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_id_tercero_fact_type_info = new String[]{'f430_id_tercero_fact','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_id_tercero_rem_type_info = new String[]{'f430_id_tercero_rem','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_id_tercero_vendedor_type_info = new String[]{'f430_id_tercero_vendedor','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_id_tipo_cli_fact_type_info = new String[]{'f430_id_tipo_cli_fact','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_id_tipo_docto_type_info = new String[]{'f430_id_tipo_docto','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_ind_backorder_type_info = new String[]{'f430_ind_backorder','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_num_dias_entrega_type_info = new String[]{'f430_num_dias_entrega','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_num_docto_referencia_type_info = new String[]{'f430_num_docto_referencia','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f430_referencia_type_info = new String[]{'f430_referencia','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_cant_pedida_base_type_info = new String[]{'f431_cant_pedida_base','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_consec_docto_type_info = new String[]{'f431_consec_docto','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_detalle_type_info = new String[]{'f431_detalle','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_fecha_entrega_type_info = new String[]{'f431_fecha_entrega','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_id_bodega_type_info = new String[]{'f431_id_bodega','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_id_ccosto_movto_type_info = new String[]{'f431_id_ccosto_movto','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_id_co_type_info = new String[]{'f431_id_co','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_id_co_movto_type_info = new String[]{'f431_id_co_movto','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_id_concepto_type_info = new String[]{'f431_id_concepto','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_id_ext1_detalle_type_info = new String[]{'f431_id_ext1_detalle','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_id_lista_precio_type_info = new String[]{'f431_id_lista_precio','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_id_motivo_type_info = new String[]{'f431_id_motivo','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_id_punto_envio_type_info = new String[]{'f431_id_punto_envio','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_id_tipo_docto_type_info = new String[]{'f431_id_tipo_docto','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_id_un_movto_type_info = new String[]{'f431_id_un_movto','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_id_unidad_medida_type_info = new String[]{'f431_id_unidad_medida','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_ind_backorder_type_info = new String[]{'f431_ind_backorder','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_ind_impto_asumido_type_info = new String[]{'f431_ind_impto_asumido','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_ind_obsequio_type_info = new String[]{'f431_ind_obsequio','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_ind_precio_type_info = new String[]{'f431_ind_precio','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_notas_type_info = new String[]{'f431_notas','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_nro_registro_type_info = new String[]{'f431_nro_registro','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_num_dias_entrega_type_info = new String[]{'f431_num_dias_entrega','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_precio_unitario_type_info = new String[]{'f431_precio_unitario','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] f431_referencia_item_type_info = new String[]{'f431_referencia_item','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee','true','false'};
        private String[] field_order_type_info = new String[]{'f419_direccion1','f419_email','f419_id_ciudad','f419_telefono','f430_fecha_entrega','f430_id_co','f430_id_cond_pago','f430_id_moneda_local','f430_id_punto_envio','f430_id_sucursal_fact','f430_id_sucursal_rem','f430_id_tercero_fact','f430_id_tercero_rem','f430_id_tercero_vendedor','f430_id_tipo_cli_fact','f430_id_tipo_docto','f430_ind_backorder','f430_num_dias_entrega','f430_num_docto_referencia','f430_referencia','f431_cant_pedida_base','f431_consec_docto','f431_detalle','f431_fecha_entrega','f431_id_bodega','f431_id_ccosto_movto','f431_id_co','f431_id_co_movto','f431_id_concepto','f431_id_ext1_detalle','f431_id_lista_precio','f431_id_motivo','f431_id_punto_envio','f431_id_tipo_docto','f431_id_un_movto','f431_id_unidad_medida','f431_ind_backorder','f431_ind_impto_asumido','f431_ind_obsequio','f431_ind_precio','f431_notas','f431_nro_registro','f431_num_dias_entrega','f431_precio_unitario','f431_referencia_item'};
    }
    public class crear_element {
        public AutosCrearPedidoEnUnoeeSoapWs.CrearInput[] inputList;
        private String[] inputList_type_info = new String[]{'inputList','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','-1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee','true','false'};
        private String[] field_order_type_info = new String[]{'inputList'};
    }
    public class Output {
        public String error;
        public String idSF;
        public String MnsjRta;
        private String[] error_type_info = new String[]{'error','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] idSF_type_info = new String[]{'idSF','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] MnsjRta_type_info = new String[]{'MnsjRta','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','1','true'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee','true','false'};
        private String[] field_order_type_info = new String[]{'error','idSF','MnsjRta'};
    }
    public class CallOptions_element {
        public String client;
        private String[] client_type_info = new String[]{'client','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee','true','false'};
        private String[] field_order_type_info = new String[]{'client'};
    }
    public class DebuggingHeader_element {
        public AutosCrearPedidoEnUnoeeSoapWs.LogInfo[] categories;
        public String debugLevel;
        private String[] categories_type_info = new String[]{'categories','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'0','-1','false'};
        private String[] debugLevel_type_info = new String[]{'debugLevel','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee','true','false'};
        private String[] field_order_type_info = new String[]{'categories','debugLevel'};
    }
    public class location {
        public Double latitude;
        public Double longitude;
        private String[] latitude_type_info = new String[]{'latitude','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] longitude_type_info = new String[]{'longitude','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee','true','false'};
        private String[] field_order_type_info = new String[]{'latitude','longitude'};
    }
    public class AllowFieldTruncationHeader_element {
        public Boolean allowFieldTruncation;
        private String[] allowFieldTruncation_type_info = new String[]{'allowFieldTruncation','http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',null,'1','1','false'};
        private String[] apex_schema_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee','true','false'};
        private String[] field_order_type_info = new String[]{'allowFieldTruncation'};
    }
    public class CrearPedidoEnUnoee {
        public String endpoint_x = 'https://cs90.salesforce.com/services/Soap/class/CrearPedidoEnUnoee';
        public Map<String,String> inputHttpHeaders_x;
        public Map<String,String> outputHttpHeaders_x;
        public String clientCertName_x;
        public String clientCert_x;
        public String clientCertPasswd_x;
        public Integer timeout_x;
        public AutosCrearPedidoEnUnoeeSoapWs.AllowFieldTruncationHeader_element AllowFieldTruncationHeader;
        public AutosCrearPedidoEnUnoeeSoapWs.DebuggingInfo_element DebuggingInfo;
        public AutosCrearPedidoEnUnoeeSoapWs.CallOptions_element CallOptions;
        public AutosCrearPedidoEnUnoeeSoapWs.SessionHeader_element SessionHeader;
        public AutosCrearPedidoEnUnoeeSoapWs.DebuggingHeader_element DebuggingHeader;
        private String AllowFieldTruncationHeader_hns = 'AllowFieldTruncationHeader=http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee';
        private String DebuggingInfo_hns = 'DebuggingInfo=http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee';
        private String CallOptions_hns = 'CallOptions=http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee';
        private String SessionHeader_hns = 'SessionHeader=http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee';
        private String DebuggingHeader_hns = 'DebuggingHeader=http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee';
        private String[] ns_map_type_info = new String[]{'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee', 'AutosCrearPedidoEnUnoeeSoapWs'};
        public AutosCrearPedidoEnUnoeeSoapWs.Output[] crear(AutosCrearPedidoEnUnoeeSoapWs.CrearInput[] inputList) {
            AutosCrearPedidoEnUnoeeSoapWs.crear_element request_x = new AutosCrearPedidoEnUnoeeSoapWs.crear_element();
            request_x.inputList = inputList;
            AutosCrearPedidoEnUnoeeSoapWs.crearResponse_element response_x;
            Map<String, AutosCrearPedidoEnUnoeeSoapWs.crearResponse_element> response_map_x = new Map<String, AutosCrearPedidoEnUnoeeSoapWs.crearResponse_element>();
            response_map_x.put('response_x', response_x);
            WebServiceCallout.invoke(
              this,
              request_x,
              response_map_x,
              new String[]{endpoint_x,
              '',
              'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',
              'crear',
              'http://soap.sforce.com/schemas/class/CrearPedidoEnUnoee',
              'crearResponse',
              'AutosCrearPedidoEnUnoeeSoapWs.crearResponse_element'}
            );
            response_x = response_map_x.get('response_x');
            return response_x.result;
        }
    }
}