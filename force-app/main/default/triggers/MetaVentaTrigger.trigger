trigger MetaVentaTrigger on Meta_de_Venta__c (after insert) {
	new MetaVentaTriggerHandler().run();
}