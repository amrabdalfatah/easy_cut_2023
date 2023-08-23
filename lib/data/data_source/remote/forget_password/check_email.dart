import 'package:easycut/core/class/crud.dart';
import 'package:easycut/linkapi.dart';

class CheckEmailData {
  Crud crud;

  CheckEmailData(this.crud);

  postData(String email) async {
    print(AppLink.checkEmail);
    var response = await crud.postData(AppLink.checkEmail, {
      "email": email,
    });
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
