import 'package:khmer_phone_validator/khmer_phone_validator.dart';

class Validator {
  static String validateName(String value) {
    if (value.isEmpty) {
      return "Name is empty!";
    }
    return null;
  }

  static String validateDate(DateTime value) {
    if (value == null) {
      return "Date is empty!";
    } else if (!value.isBefore(DateTime.now())) {
      return "Invalid date!";
    }
    return null;
  }

  static String validatePhone(phone) {
    final newPhone = KhmerPhoneValidator.validPhone(phone);
    if (!newPhone.status) {
      return "Invalid Phone";
    }
    return null;
  }
}
