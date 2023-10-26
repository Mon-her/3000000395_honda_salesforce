@isTest
public with sharing class SOQLViewer_Test {

    @isTest
    static void exec() {
        SOQLViewer.execString = 'SELECT Id FROM User';
        SOQLViewer.pwd = 'EXECUTE';
        Pagereference pr = SOQLViewer.exec();
        System.assertEquals(pr == null, true);
    }
}