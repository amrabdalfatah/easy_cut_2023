import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "name") {
    if (!GetUtils.isUsername(val)) {
      return "Not Valid Name";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not Valid Email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not Valid Phone";
    }
  }

  if (val.isEmpty) {
    return "Can't be Empty";
  }

  if (val.length < min) {
    return "Can't be less than $min";
  }

  if (val.length > max) {
    return "Can't be greater than $max";
  }
}
