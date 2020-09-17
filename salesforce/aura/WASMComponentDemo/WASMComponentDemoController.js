({
    afterScriptLoaded: function(component, event, helper){
        let action = component.get('c.getWASMResource');
        action.setCallback(this, function(response){
            const { greet } = wasm_bindgen;
            let base64String = response.getReturnValue();
                      let binaryString = window.atob(base64String);
                      let lengthOfString = binaryString.length;
                      let bytes = new Uint8Array(lengthOfString);
                      for(let i = 0; i < lengthOfString; i++){
                          bytes[i] = binaryString.charCodeAt(i);
                      }
                      let buffer = bytes.buffer;
                      wasm_bindgen(buffer).then( function() {
                          greet();
                    });
        });
        $A.enqueueAction(action);
    }
})