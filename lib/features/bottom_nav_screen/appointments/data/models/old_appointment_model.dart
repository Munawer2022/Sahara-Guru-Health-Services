class OldMyAppointmentModel {
  AppointmentData? appointmentData;

  OldMyAppointmentModel({this.appointmentData});

  OldMyAppointmentModel.fromJson(Map<String, dynamic> json) {
    appointmentData = json['appointmentData'] != null
        ? AppointmentData.fromJson(json['appointmentData'])
        : null;
  }
}

class AppointmentData {
  List<Old>? old;

  AppointmentData({this.old});

  AppointmentData.fromJson(Map<String, dynamic> json) {
    if (json['old'] != null) {
      old = <Old>[];
      json['old'].forEach((v) {
        old!.add(Old.fromJson(v));
      });
    }
  }
}

class Old {
  int? id;
  int? patientId;
  int? doctorId;
  int? receptionistId;
  String? fees;
  String? createdAt;
  String? updatedAt;
  int? status;
  int? referDoctorId;
  String? appointmentTime;
  String? appointmentDate;
  Doctor? doctor;

  Old(
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
      this.doctor});

  Old.fromJson(Map<String, dynamic> json) {
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
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
  }
}

class Doctor {
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
  Department? department;

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
      this.signature,
      this.department});

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
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
  }
}

class Department {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Department({this.id, this.name, this.createdAt, this.updatedAt});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}


// class OldAppointmentsModel {
//   int id;
//   String firstName;
//   String lastName;
//   String fees;
//   String appointmentTime;
//   String appointmentDate;

//   OldAppointmentsModel({
//     required this.id,
//     required this.fees,
//     required this.firstName,
//     required this.lastName,
//     required this.appointmentTime,
//     required this.appointmentDate,
//   });

//   factory OldAppointmentsModel.fromJson(Map<String, dynamic> json) =>
//       OldAppointmentsModel(
//           id: json['id'],
//           fees: json['fees'],
//           firstName: json['firstName'],
//           lastName: json['lastName'],
//           appointmentTime: json['appointmentTime'],
//           appointmentDate: json['appointmentDate']);

//   MockOldAppointmentsModel toDomain() => MockOldAppointmentsModel(
//       fees: fees,
//       appointmentTime: appointmentTime,
//       firstName: firstName,
//       lastName: lastName,
//       appointmentDate: appointmentDate,
//       id: id);
// }
