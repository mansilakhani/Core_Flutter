import 'dart:io';

class Contact {
  String? firstname;
  String? lastname;
  String? email;
  String? phonenumber;
  File? image;

  Contact({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phonenumber,
    required this.image,
  });
}
