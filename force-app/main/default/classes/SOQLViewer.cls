public with sharing class SOQLViewer {
    public static String pwd { get; set; }
    public static String execString { get; set; }
    public static String jsonString { get; set; }
    public static Object result { get; set; }

    public SOQLViewer() {
        execString = 'SELECT Id FROM User';
    }

    public static PageReference exec() {
        if(pwd == 'EXECUTE'){
            result = Database.query(execString);
            jsonString = JSON.serializePretty(result);
        }
        return null;
    }
}