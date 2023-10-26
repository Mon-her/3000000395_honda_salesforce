public class AssignCasesUsingAssignmentRules
{
    @InvocableMethod
    public static void CaseAssign(List<Id> CaseIds)
    {
         /*   //Fetching the assignment rules on case
            AssignmentRule AR = new AssignmentRule();
            AR = [select id from AssignmentRule where SobjectType = 'Case' and Active = true limit 1];
            
            //Creating the DMLOptions for "Assign using active assignment rules" checkbox
            Database.DMLOptions dmo= new Database.DMLOptions();
            dmo.assignmentRuleHeader.assignmentRuleId= AR.id;*/
     Case Cases=[select id from case where case.id in :CaseIds];
    // Cases.setOptions(dmo);
        //    update Cases;
             
            Database.DMLOptions dmlOption = new Database.DMLOptions();
    dmlOption.assignmentRuleHeader.useDefaultRule = true;
    Database.update(Cases, dmlOption);
                 
            
   }
}