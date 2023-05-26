class AppointmentConfirmationModel {
  AppointmentDetails? appointmentDetails;

  AppointmentConfirmationModel({this.appointmentDetails});

  AppointmentConfirmationModel.fromJson(Map<String, dynamic> json) {
    appointmentDetails = json['appointment_details'] != null
        ? new AppointmentDetails.fromJson(json['appointment_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointmentDetails != null) {
      data['appointment_details'] = this.appointmentDetails!.toJson();
    }
    return data;
  }
}

class AppointmentDetails {
  int? id;
  int? patientId;
  int? doctorId;
  int? receptionistId;
  String? fees;
  String? createdAt;
  String? updatedAt;
  int? status;
  Null? referDoctorId;
  String? appointmentTime;
  String? appointmentDate;
  Doctor? doctor;
  Null? diagnosis;
  Null? referDoctor;
  Patient? patient;
  Patient? receptionist;
  List<Null>? tests;

  AppointmentDetails(
      {this.id,
      this.patientId,
      this.doctorId,
      this.receptionistId,
      this.fees,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.referDoctorId,
      this.appointmentTime,
      this.appointmentDate,
      this.doctor,
      this.diagnosis,
      this.referDoctor,
      this.patient,
      this.receptionist,
      this.tests});

  AppointmentDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    doctorId = json['doctor_id'];
    receptionistId = json['receptionist_id'];
    fees = json['fees'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    referDoctorId = json['refer_doctor_id'];
    appointmentTime = json['appointment_time'];
    appointmentDate = json['appointment_date'];
    doctor =
        json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    diagnosis = json['diagnosis'];
    referDoctor = json['refer_doctor'];
    patient =
        json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    receptionist = json['receptionist'] != null
        ? new Patient.fromJson(json['receptionist'])
        : null;
    // if (json['tests'] != null) {
    //   tests = <Null>[];
    //   json['tests'].forEach((v) {
    //     tests!.add(Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['doctor_id'] = this.doctorId;
    data['receptionist_id'] = this.receptionistId;
    data['fees'] = this.fees;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status'] = this.status;
    data['refer_doctor_id'] = this.referDoctorId;
    data['appointment_time'] = this.appointmentTime;
    data['appointment_date'] = this.appointmentDate;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    data['diagnosis'] = this.diagnosis;
    data['refer_doctor'] = this.referDoctor;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    if (this.receptionist != null) {
      data['receptionist'] = this.receptionist!.toJson();
    }
    // if (this.tests != null) {
    //   data['tests'] = this.tests!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Doctor {
  int? id;
  int? userType;
  String? firstName;
  String? lastName;
  String? email;
  Null? emailVerifiedAt;
  Null? profile;
  Null? phoneNumber;
  String? dateOfBirth;
  String? gender;
  Null? height;
  Null? weight;
  Null? blood;
  Null? adharcardNo;
  Null? address;
  Null? bio;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? departmentId;
  String? profession;
  String? fees;
  int? age;
  Null? education;
  Null? signature;

  Doctor(
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

  Doctor.fromJson(Map<String, dynamic> json) {
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

class Patient {
  int? id;
  int? userType;
  String? firstName;
  String? lastName;
  String? email;
  Null? emailVerifiedAt;
  Null? profile;
  String? phoneNumber;
  String? dateOfBirth;
  String? gender;
  Null? height;
  Null? weight;
  Null? blood;
  Null? adharcardNo;
  String? address;
  Null? bio;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? departmentId;
  Null? profession;
  Null? fees;
  int? age;
  Null? education;
  Null? signature;

  Patient(
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

  Patient.fromJson(Map<String, dynamic> json) {
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
