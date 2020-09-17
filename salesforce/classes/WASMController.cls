public class WASMController {
	
    private final StaticResource wasmResource;
    
    public WASMController(){
        wasmResource = [SELECT Id, Body FROM StaticResource WHERE Name = 'wasm_demo'];
    }  
    
    public StaticResource getWasmResource() {
        return wasmResource;
    }
    
    public String getBody(){
        return EncodingUtil.convertToHex(getWasmResource().Body);
    }
    
    public Blob getBbody(){
        return wasmResource.Body;
    }

    public String getBase64(){
        return EncodingUtil.base64Encode(wasmResource.Body);
    }
}