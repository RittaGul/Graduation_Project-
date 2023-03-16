import 'package:graduation_project/core/class/Crud.dart';
import 'package:graduation_project/core/constant/linkUri.dart';
import 'package:graduation_project/data/model/Auth/sendVerifyCodeModel.dart';

class sendVerifyCodeData {
  postsendVerifyCodeData(
      {required SendVerifyCodeModel sendVerifyCodeModel}) async {
    var res = await Crud().postData(
      sendVerifyCodeUri,
      sendVerifyCodeModel.toJson(),
    );
    return res.fold((l) => l, (r) => r);
  }
}
