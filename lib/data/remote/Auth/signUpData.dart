import 'package:graduation_project/core/class/Crud.dart';
import 'package:graduation_project/core/constant/linkUri.dart';
import 'package:graduation_project/data/model/Auth/SignUpModel.dart';

class signUpData {
  postSignUpData({required SignUpModel signUpModel}) async {
    var res = await Crud().postData(
      signUpUri,
      signUpModel.toJson(),
    );
    return res.fold((l) => l, (r) => r);
  }
}
