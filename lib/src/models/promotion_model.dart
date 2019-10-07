class TopPromotions {
  double discountPercentage;
  String endDate;
  bool isTop;
  String promotionImage;
  String name;
  String description;
  Merchant merchant;
  int id;
  bool isActive;
  String startDate;

  TopPromotions(
      {this.discountPercentage,
      this.endDate,
      this.isTop,
      this.promotionImage,
      this.name,
      this.description,
      this.merchant,
      this.id,
      this.isActive,
      this.startDate});

  TopPromotions.fromJson(Map<String, dynamic> json) {
    discountPercentage = json['discountPercentage'];
    endDate = json['endDate'];
    isTop = json['isTop'];
    promotionImage = json['promotionImage'];
    name = json['name'];
    description = json['description'];
    merchant = json['merchant'] != null
        ? new Merchant.fromJson(json['merchant'])
        : null;
    id = json['id'];
    isActive = json['isActive'];
    startDate = json['startDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discountPercentage'] = this.discountPercentage;
    data['endDate'] = this.endDate;
    data['isTop'] = this.isTop;
    data['promotionImage'] = this.promotionImage;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.merchant != null) {
      data['merchant'] = this.merchant.toJson();
    }
    data['id'] = this.id;
    data['isActive'] = this.isActive;
    data['startDate'] = this.startDate;
    return data;
  }
}

class Merchant {
  int id;
  String address;
  String fax;
  String name;
  String tel;
  String merchantCategoryName;
  String info;
  String logoUrl;
  int merchantCategoryId;
  String email;
  bool isDelete;
  String website;

  Merchant(
      {this.id,
      this.address,
      this.fax,
      this.name,
      this.tel,
      this.merchantCategoryName,
      this.info,
      this.logoUrl,
      this.merchantCategoryId,
      this.email,
      this.isDelete,
      this.website});

  Merchant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    fax = json['fax'];
    name = json['name'];
    tel = json['tel'];
    merchantCategoryName = json['merchantCategoryName'];
    info = json['info'];
    logoUrl = json['logoUrl'];
    merchantCategoryId = json['merchantCategoryId'];
    email = json['email'];
    isDelete = json['isDelete'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['fax'] = this.fax;
    data['name'] = this.name;
    data['tel'] = this.tel;
    data['merchantCategoryName'] = this.merchantCategoryName;
    data['info'] = this.info;
    data['logoUrl'] = this.logoUrl;
    data['merchantCategoryId'] = this.merchantCategoryId;
    data['email'] = this.email;
    data['isDelete'] = this.isDelete;
    data['website'] = this.website;
    return data;
  }
}
