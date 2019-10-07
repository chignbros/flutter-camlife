class CamlifeInfoModel {
  String name;
  String description;
  int id;
  String configurationType;
  bool isActive;
  String value;

  CamlifeInfoModel(
      {this.name,
      this.description,
      this.id,
      this.configurationType,
      this.isActive,
      this.value});

  CamlifeInfoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    id = json['id'];
    configurationType = json['configurationType'];
    isActive = json['isActive'];
    value = json['value'];
  }
}
