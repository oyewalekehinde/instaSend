String? emailValidator(value) {
  final val = value.trim();
  final RegExp reg = RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-.]+$");
  if (!reg.hasMatch(val)) {
    return 'Invalid email address';
  }
  return null;
}

String? emptyStringValidator(value) {
  final val = value.trim();
  if (val.isEmpty) {
    return 'It is required';
  }
  return null;
}

String? passwordValidator(value) {
  final val = value.trim();
  if (val.isEmpty) {
    return 'Password is required';
  } else if (val.length < 6) {
    return 'password should be greater than 6';
  }
  return null;
}

String? phoneValidator(val) {
  if (val.isEmpty) {
    return 'Phone is required';
  } else if (val.length < 11 || val.length > 12) {
    return 'phone should be 10 digits';
  }
  return null;
}
