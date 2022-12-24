({
    doInit : function(component, event, helper) {
        console.log("Initialization completed");
        const gameMode = component.get("v.mode");
        let column = 0;
         //in javascript gameMode - we're checking if the value is not null;== checks for value equality only, not type.while === checks for the same value and type
        if(gameMode && gameMode === "hard"){
           column = 6;
        }else if(gameMode === "medium"){
            column = 4;
        }else{
            column = 3;
        }
       // get block width/size
        let blockSize = 12/column;
        // set the value of blockSize attribute
        component.set("v.blockSize", blockSize);
        // build a list of 100 words
        const words = helper.getWords(column * column);
        component.set("v.words", words);
        //console.log("Words: " + words);
        // get win word
        const winWord = helper.getWinWord(words);
        component.set("v.winWord", winWord);
        //console.log("Win word: " + helper.getWinWord(words))
     },
     doRender : function(component, event, helper) {
        console.log("Render completed");
     },

     blockClickHandler : function(component, event, helper){
         // current click count ( + 1 because user clicked on a tile)
         let clickCount = component.get("v.clickCount") + 1;
         // get event value
         const value = event.getParam("value");
         //check if value is equals to winWord
         if(value === component.get("v.winWord")){
             // user has won
             component.set("v.result", "YOU WIN");
             console.log("you win");
             helper.disableBoard(component);
         }else if(clickCount === 3){
             // user lose
             component.set("v.result", "YOU LOSE");
             console.log("you lose");
             helper.disableBoard(component);
         }
         component.set("v.clickCount", clickCount);
     }
})
