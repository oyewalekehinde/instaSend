import 'package:equatable/equatable.dart';

class CreateAccountModel extends Equatable {
  CreateAccountModel({
    this.firstName = "",
    this.lastName = "",
    this.emailAddress = "",
    this.phoneNumber = "",
    this.password = "",
  });

  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
  final String password;

  factory CreateAccountModel.fromJson(Map<String, dynamic> json) =>
      CreateAccountModel(
        firstName: json["first_name"],
        lastName: json["last_name"],
        emailAddress: json["email_address"],
        phoneNumber: json["phone_number"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email_address": emailAddress,
        "phone_number": phoneNumber,
        "password": password,
      };

  @override
  List<Object?> get props =>
      [firstName, lastName, emailAddress, phoneNumber, password];
}
