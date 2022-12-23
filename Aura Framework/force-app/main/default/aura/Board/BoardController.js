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
     }
})
