import 'package:flutter/material.dart';

class loginBody{
  String _email;
  String _password;

  loginBody(this._email, this._password);

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}

class registerBody{
  String _firstName ,  _lastName , _email , _password , _gender ;

  registerBody(this._firstName, this._lastName, this._email, this._password,
      this._gender);

  get gender => _gender;

  set gender(value) {
    _gender = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get lastName => _lastName;

  set lastName(value) {
    _lastName = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }
}