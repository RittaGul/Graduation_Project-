import 'package:graduation_project/core/class/Crud.dart';
import 'package:graduation_project/core/constant/linkUri.dart';
import 'package:graduation_project/data/model/Auth/resetPasswordModel.dart';

class ResetPasswordData {
  postResetPassword({required ResetPasswordModel resetPasswordModel}) async {
    var res = await Crud().postData(
      resetPasswordUri,
      resetPasswordModel.toJson(),
    );

    return res.fold((l) => l, (r) => r);
  }
}
