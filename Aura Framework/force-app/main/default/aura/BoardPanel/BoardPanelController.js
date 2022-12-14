({ //BoardPanel > Board > Block (parent> chilnd > grandchild)
    startGame : function(component, event, helper) {
        // access combobox
        let gameModeComboBox = component.find("gameMode");

        // access the value of combobox 
       let selectedValue =  gameModeComboBox.get("v.value");

       const selectedMode = component.get("v.selectedMode");

       // update selectedMode attribute
       component.set("v.selectedMode", selectedValue);
       if(selectedMode){
           const boardComp = component.find("boardComp");
           // call aura method
           boardComp.startGame();
       }
       //console.log("The start new game button is clicked. The game mode is " + selectedValue);
       //alert("The start new game button is clicked. The game mode is " + selectedValue);

       //console.log("Selected mode attribute value: " + component.get("v.selectedMode"));
    },
    reshuffleBoard: function(component, event, helper) {
        const boardComp = component.find("boardComp");
        boardComp.reshuffleBoard();
        component.set("v.reshuffleDisabled", true);
     },
      // method that tells if user won or lost
     onResultHandler : function(component, event, helper) {
         const result = event.getParam("result");
         if (result === "win"){
             component.set("v.reshuffleDisabled", true);
             helper.showToast("You are the winner", "Hooray!", "success");
         }else{
            component.set("v.reshuffleDisabled", false);
            helper.showToast("You lost", "Reshuffle the board to keep playing", "error");
         }
         helper.addResultRecord(component, result);
         
     },
});
