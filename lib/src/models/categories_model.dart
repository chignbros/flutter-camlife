class CategoriesModel {
  int id;
  bool isActive;
  String name;
  String description;

  CategoriesModel({this.id, this.isActive, this.name, this.description});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isActive = json['isActive'];
    name = json['name'];
    description = json['description'];
  }
}
