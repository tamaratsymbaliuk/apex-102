({
    doInit : function(component, event, helper) {
      component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Phone ', fieldName: 'Mobile__c', type: 'text'},
            {label: 'Health Status', fieldName: 'Health_Status__c', type: 'text'},
            {label: 'Status Update Date', fieldName: 'Status_Update_Date__c', type: 'date'},
            {label: 'Token', fieldName: 'Token__c', type: 'text'},
        ]);
     helper.fetchRecentHealthChanges(component);
    }
});
