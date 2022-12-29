({
    fetchRecentHealthChanges : function(component) {
      let action = component.get("c.getRecentPersonHealthChanges");

      action.setCallback(this, function(response){
          const state = response.getState();

          if(state === 'SUCCESS'){
              const data = response.getReturnValue();
              component.set("v.data", data);
          }

      });
      $A.enqueueAction(action);
    }
})
