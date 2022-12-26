({
    fetchResult : function(component) {
        var action = component.get("c.getResults");
        action.setCallback(this,function(response) {
            const state = response.getState();
            if (state === "SUCCESS") {
                // Handle response here - response.getReturnValue();
                const resp = response.getReturnValue();
                // set result inside our data attribute
                component.set("v.data", resp);
            }
        });
        $A.enqueueAction(action);

    }
})
