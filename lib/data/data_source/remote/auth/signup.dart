import 'package:easycut/core/class/crud.dart';
import 'package:easycut/linkapi.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postData(
    String name,
    String email,
    String password,
    String phone,
    String gender,
    String country,
    String city,
    String address,
  ) async {
    var response = await crud.postData(AppLink.signUp, {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "gender": gender,
      "country": country,
      "city": city,
      "address": address,
    });
    return response.fold((l) => l, (r) => r);
  }
}
