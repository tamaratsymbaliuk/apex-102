public with sharing class ConfigLoader {
    public CPQ_APIDataModels.ProductModel load(Id productId, CPQ_APIDataModels.QuoteModel quote, CPQ_APIDataModels.ProductModel parentProduct) {
        ConfigLoadContext ctx = new ConfigLoadContext(quote, parentProduct);
        String productJSON = SBQQ.ServiceRouter.load('SBQQ.ConfigAPI.ConfigLoader', productId, JSON.serialize(ctx));
        return (CPQ_APIDataModels.ProductModel) JSON.deserialize(productJSON, CPQ_APIDataModels.ProductModel.class);
    }

    private class ConfigLoadContext {
        private CPQ_APIDataModels.QuoteModel quote;
        private CPQ_APIDataModels.ProductModel parentProduct;
    
        private ConfigLoadContext(CPQ_APIDataModels.QuoteModel quote, CPQ_APIDataModels.ProductModel parentProduct) {
            this.quote = quote;
            this.parentProduct = parentProduct;
        }
    }
}