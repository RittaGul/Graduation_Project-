import 'package:graduation_project/core/class/Crud.dart';
import 'package:graduation_project/core/constant/linkUri.dart';
import 'package:graduation_project/data/model/Auth/LoginModel.dart';

class LoginData {
  postLoginData({required LoginModel loginModel}) async {
    var res = await Crud().postData(
      loginUri,
      loginModel.toJson(),
    );
    return res.fold((l) => l, (r) => r);
  }
}
