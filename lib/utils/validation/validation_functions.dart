class Validations {
  String? validatePhone(String value) {
    RegExp regex = RegExp(r'^[6-9]\d{9}$');
    final containsUpperCase = value.contains(RegExp(r'[1-9]'));
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    } else if (containsUpperCase == false) {
      return 'Please enter a valid phone number';
    } else {
      return null;
    }
  }

  String? validateEmail(String value) {
    RegExp regex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}(\.[a-zA-Z]{2,})?$');
    if (value.isEmpty) {
      return 'Please enter email';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid email';
      } else {
        return null;
      }
    }
  }

  String? validateName(String value) {
    RegExp regex = RegExp(r'^[A-Za-z ]+$');

    if (value.isEmpty) {
      return 'Please provide Name';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid name';
      } else {
        return null;
      }
    }
  }
}
