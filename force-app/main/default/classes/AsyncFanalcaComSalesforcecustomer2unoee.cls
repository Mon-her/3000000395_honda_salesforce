//Generated by wsdl2apex

public class AsyncFanalcaComSalesforcecustomer2unoee {
    public class DT_GenericResponseFuture extends System.WebServiceCalloutFuture {
        public String getValue() {
            fanalcaComSalesforcecustomer2unoee.DT_GenericResponse response = (fanalcaComSalesforcecustomer2unoee.DT_GenericResponse)System.WebServiceCallout.endInvoke(this);
            return response.id;
        }
    }
}