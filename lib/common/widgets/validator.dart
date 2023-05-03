var regEx = RegExp(
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
RegExp numReg = RegExp(r".*[0-9].*");
RegExp phoneNumReg =
    RegExp(r"^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$");
RegExp letterReg = RegExp(r".*[A-Za-z].*");

String? emailValidator(String? value) {
  if (!regEx.hasMatch(value!)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? uNameValidator(String? value) {
  if (value!.isEmpty) {
    return 'Enter your user name';
  }
  if (value.length > 15) {
    return 'Exceeded 15 characters';
  }
  return null;
}

String? countryValidator(String? value) {
  if (value!.isEmpty) {
    return 'Enter your State';
  }
  return null;
}

String? sectionValidator(String? value) {
  if (value!.isEmpty) {
    return 'Cann\'t be empty';
  }
  return null;
}

String? commonValidator(String? value) {
  if (value!.isEmpty) {
    return 'Cann\'t be empty';
  }
  return null;
}

String? cityValidator(String? value) {
  if (value!.isEmpty) {
    return 'Enter your City';
  }
  return null;
}

String? addressValidator(String? value) {
  if (value!.isEmpty) {
    return 'Enter a Valid Address';
  }
  return null;
}

String? passValidator(String? value) {
  if (value!.length < 6) {
    return 'can not have less than 6 characters';
  }
  return null;
}

String? phoneValidator(String? value) {
  // if (!phoneNumReg.hasMatch(value!)) {
  //   return 'Enter a valid phone number';
  // } else
  if (value!.length > 13 || value.length < 8) {
    return 'Enter at least 8 numbers!';
  }
  return null;
}
