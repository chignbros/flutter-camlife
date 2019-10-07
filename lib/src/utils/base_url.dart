class BaseUrl {
  static String baseUrlDevelopment =
      'https://staging.trendsoftinnovation.com:8804';
  static String baseUrlProduction =
      'https://staging.trendsoftinnovation.com:8804';

  static String xApiKey = "1ccbc4c913bc4ce785a0a2de444aa0d6";
  static String photoUri = '/api/v1/readUploadFiles?fileName=';
  static String topActivePromotionUri = '/api/TopActivePromotion';
  static String categoryUri =
      '/api/merchantCategoryIsActive?offset=0&max=20&sort=name&order=desc&name';
  static String productsUri = '/api/product/listProductForMobile';
  static String activePromotionByid =
      '/api/activePromotions?merchantCategoryId=';

  static String infoUri = '/api/getCamlifeInfoByName?name=CompanyProfile';
  static String productDetailUri = '/api/product';
}
