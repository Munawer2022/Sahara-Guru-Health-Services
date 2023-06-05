class AllSpeciallzationsModel {
  List<Departments>? departments;

  AllSpeciallzationsModel({this.departments});

  AllSpeciallzationsModel.fromJson(Map<String, dynamic> json) {
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(Departments.fromJson(v));
      });
    }
  }
}

class Departments {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Departments({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  Departments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
