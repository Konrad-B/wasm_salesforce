public with sharing class WASMComponentController {

    @AuraEnabled(cacheable=true)
    public static String getWASMResource(){
        return EncodingUtil.base64Encode([SELECT Id, Body FROM StaticResource WHERE Name = 'wasm_demo'].Body);
    }

}