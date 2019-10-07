class ProductDetailModel {
  List<ProductPaymentTypes> productPaymentTypes;
  String termCondition;
  String code;
  String externalCode;
  String validateUrl;
  bool isDelete;
  String description;
  bool isOnline;
  String shortDescription;
  bool isActive;
  String imageUrl;
  String name;
  String termConditionFile;
  String iconUrl;
  int id;

  ProductDetailModel(
      {this.productPaymentTypes,
      this.termCondition,
      this.code,
      this.externalCode,
      this.validateUrl,
      this.isDelete,
      this.description,
      this.isOnline,
      this.shortDescription,
      this.isActive,
      this.imageUrl,
      this.name,
      this.termConditionFile,
      this.iconUrl,
      this.id});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['productPaymentTypes'] != null) {
      productPaymentTypes = new List<ProductPaymentTypes>();
      json['productPaymentTypes'].forEach((v) {
        productPaymentTypes.add(new ProductPaymentTypes.fromJson(v));
      });
    }
    termCondition = json['termCondition'];
    code = json['code'];
    externalCode = json['externalCode'];
    validateUrl = json['validateUrl'];
    isDelete = json['isDelete'];
    description = json['description'];
    isOnline = json['isOnline'];
    shortDescription = json['shortDescription'];
    isActive = json['isActive'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    termConditionFile = json['termConditionFile'];
    iconUrl = json['iconUrl'];
    id = json['id'];
  }
}

class ProductPaymentTypes {
  String paymentType;
  int paymentTypeId;
  int id;
  List<PriceLists> priceLists;

  ProductPaymentTypes(
      {this.paymentType, this.paymentTypeId, this.id, this.priceLists});

  ProductPaymentTypes.fromJson(Map<String, dynamic> json) {
    paymentType = json['paymentType'];
    paymentTypeId = json['paymentTypeId'];
    id = json['id'];
    if (json['priceLists'] != null) {
      priceLists = new List<PriceLists>();
      json['priceLists'].forEach((v) {
        priceLists.add(new PriceLists.fromJson(v));
      });
    }
  }
}

class PriceLists {
  int id;
  double sumAssured;
  double premium;

  PriceLists({this.id, this.sumAssured, this.premium});

  PriceLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sumAssured = json['sumAssured'];
    premium = json['premium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sumAssured'] = this.sumAssured;
    data['premium'] = this.premium;
    return data;
  }
}
