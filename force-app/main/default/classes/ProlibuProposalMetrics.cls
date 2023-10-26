//Made by me, June 2021
//this is called from clsScheduleGetProposalMetrics in this way: ProlibuProposalMetrics.getProposalMetrics();
public class ProlibuProposalMetrics {
    @future(callout=true)
    public Static void getProposalMetricsFuture(){
        getProposalMetrics();
    }
	public static String getProposalMetrics (){
        try{
            //Enviar todas las cotizaciones que estén creadas en Prolibu
            String IdsQuotes ='';
            
            map<String, Quote> mapQuotes = new map<String, Quote>();
            for (Quote q: [select QuoteNumber, Id from Quote where Creado_Prolibu__c=true and Opportunity.isClosed=false]){
                //if (IdsQuotes=='') IdsQuotes = q.Id;  else IdsQuotes = IdsQuotes +',' + q.Id;
                if (IdsQuotes=='') IdsQuotes = q.QuoteNumber;  else IdsQuotes = IdsQuotes +',' + q.QuoteNumber;
                mapQuotes.put(q.QuoteNumber, q);
            }
            system.debug('IdsQuotes: ' + IdsQuotes);
            if (idsQuotes=='') return 'No Quotes to send!!!!';
            // HTTP Request
            HttpRequest req = new HttpRequest();
            // Callout extended by /changeStatus
            req.setEndpoint('callout:Prolibu/metrics?ids=' + idsQuotes);
            req.setMethod('GET');
            req.setTimeout(120000);  
            //req.setHeader('Content-Type', 'application/json');
            // Authentication
            req.setHeader('Authorization', 'Bearer {!$Credential.Password}');
            //req.setBody();
            // send request
            Http http = new Http();
            HTTPResponse res = http.send(req);
            System.debug('Cuerpo de la respuesta...' + res.getBody());
            system.debug('El codigo de respuesta es:'+res.getStatusCode());
            
            switch on res.getStatusCode() {
                when 200,201 {		
                    List<ProposalMetricsResponse> metricas = parseSuccess(res.getBody());
                    list<Quote> quotesUpdate = new list<Quote>();
                    
                    for (ProposalMetricsResponse metric: metricas){
                        system.debug(metric);
                        //Recorrer cada metrica y actualizar los campos Ultima Fecha Visualizacion Cotizacion, Numero de Visualizaciones de la Cotizacion, Temperatura en Cotizacion
                        /*Quote q = new Quote(Id=metric.proposalNumber);//new Quote(Id=metric.id);
                        q.Temperatura__c =metric.rating;
                        if (metric.lastSeen!=null){
                            string fechaHora = metric.lastSeen.replace('T',' ');
                            q.UltiFecVisuaCoti__c =  Datetime.valueOfGmt(fechaHora);//Datetime.parse(metric.lastSeen);//Date.parse(metric.lastSeen);    
                        }
                        q.NumVisuaCoti__c =metric.views;
                        quotesUpdate.add(q); system.debug('q: ' + q);
                        */
                        Quote q;
                        if  (mapQuotes.containsKey(metric.proposalNumber)) q=mapQuotes.get(metric.proposalNumber);
                        if (q!=null){
                            q.Temperatura__c =metric.rating;
                            if (metric.lastSeen!=null){
                                string fechaHora = metric.lastSeen.replace('T',' ');
                                q.UltiFecVisuaCoti__c =  Datetime.valueOfGmt(fechaHora);//Datetime.parse(metric.lastSeen);//Date.parse(metric.lastSeen);    
                            }
                            q.NumVisuaCoti__c =metric.views;
                        }
                    }
                    
                    //update mapQuotes.values();//update quotesUpdate;
                    
                    Database.SaveResult[] results = Database.update(mapQuotes.values(), false);
                    // Iterate SaveResult array
                    for (Database.SaveResult result : results) {
                        if (result.isSuccess()) { System.debug('Quote Updated with Prolibu Information Id is: ' + result.getId());}
                        else {
                            //Handle error
                            for(Database.Error error : result.getErrors()) { 
                                 System.debug(error.getStatusCode() + ': ' + error.getMessage() + ' Fields that affected the error: ' + error.getFields());
                            }
                        }
                    }
                    
                    //system.debug('quotesUpdate' + mapQuotes.values());//system.debug('quotesUpdate' + quotesUpdate);
                    return 'Cotizaciones Actualizadas con datos obtenidos de Prolibu';
                }	
                when 400,500 {		
                    // code block 2
                    return res.getStatusCode() + '. '+ res.getStatus();
                }
                when else {		  // default block, optional
                    return res.getStatusCode() + '. '+ res.getStatus();
                }
            }
            
            
            
        	//List<ProposalMetricsResponse> quoteEstado = new List<ProposalMetricsResponse>();    
        }catch(Exception ex){
             return ex.getMessage();
        }
        
    }
	
	///Este se entrega el 9 de junio
    //Clase para parsear la respuesta obtenida en las metricas de Prolibu
    public class ProposalMetricsResponse {
		public String proposalNumber;
		public String rating;
		public String lastSeen;
		public Integer views;
		public String id;
	}

	
	public static List<ProposalMetricsResponse> parseSuccess(String json) {
		return (List<ProposalMetricsResponse>) System.JSON.deserialize(json, List<ProposalMetricsResponse>.class);
	}
}