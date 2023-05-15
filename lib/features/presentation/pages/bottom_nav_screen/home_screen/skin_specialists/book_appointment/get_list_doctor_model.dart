class Getlistdoctor {
  List<Departments>? departments;

  Getlistdoctor({this.departments});

  Getlistdoctor.fromJson(Map<String, dynamic> json) {
    if (json['departments'] != null) {
      departments = <Departments>[];
      json['departments'].forEach((v) {
        departments!.add(new Departments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.departments != null) {
      data['departments'] = this.departments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Departments {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  List<Doctors>? doctors;

  Departments(
      {this.id, this.name, this.createdAt, this.updatedAt, this.doctors});

  Departments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(new Doctors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.doctors != null) {
      data['doctors'] = this.doctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctors {
  int? id;
  int? userType;
  String? firstName;
  String? lastName;
  String? email;
  Null? emailVerifiedAt;
  String? profile;
  String? phoneNumber;
  String? dateOfBirth;
  String? gender;
  Null? height;
  Null? weight;
  Null? blood;
  String? adharcardNo;
  Null? address;
  Null? bio;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? departmentId;
  String? profession;
  String? fees;
  int? age;
  String? education;
  Null? signature;

  Doctors(
      {this.id,
      this.userType,
      this.firstName,
      this.lastName,
      this.email,
      this.emailVerifiedAt,
      this.profile,
      this.phoneNumber,
      this.dateOfBirth,
      this.gender,
      this.height,
      this.weight,
      this.blood,
      this.adharcardNo,
      this.address,
      this.bio,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.departmentId,
      this.profession,
      this.fees,
      this.age,
      this.education,
      this.signature});

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userType = json['user_type'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    profile = json['profile'];
    phoneNumber = json['phone_number'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    blood = json['blood'];
    adharcardNo = json['adharcard_no'];
    address = json['address'];
    bio = json['bio'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    departmentId = json['department_id'];
    profession = json['profession'];
    fees = json['fees'];
    age = json['age'];
    education = json['education'];
    signature = json['signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_type'] = this.userType;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['profile'] = this.profile;
    data['phone_number'] = this.phoneNumber;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['blood'] = this.blood;
    data['adharcard_no'] = this.adharcardNo;
    data['address'] = this.address;
    data['bio'] = this.bio;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['department_id'] = this.departmentId;
    data['profession'] = this.profession;
    data['fees'] = this.fees;
    data['age'] = this.age;
    data['education'] = this.education;
    data['signature'] = this.signature;
    return data;
  }
}
