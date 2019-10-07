class Products {
  String name;
  bool isOnline;
  String termConditionFile;
  int id;
  String iconUrl;
  String shortDescription;

  Products(
      {this.name,
      this.isOnline,
      this.termConditionFile,
      this.id,
      this.iconUrl,
      this.shortDescription});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isOnline = json['isOnline'];
    termConditionFile = json['termConditionFile'];
    id = json['id'];
    iconUrl = json['iconUrl'];
    shortDescription = json['shortDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['isOnline'] = this.isOnline;
    data['termConditionFile'] = this.termConditionFile;
    data['id'] = this.id;
    data['iconUrl'] = this.iconUrl;
    data['shortDescription'] = this.shortDescription;
    return data;
  }
}
