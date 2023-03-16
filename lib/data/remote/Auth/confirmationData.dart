import 'package:graduation_project/core/class/Crud.dart';
import 'package:graduation_project/core/constant/linkUri.dart';
import 'package:graduation_project/data/model/Auth/confirmationModel.dart';

class confirmationData {
  PostconfirmationData({required ConfirmationModel confirmationModel}) async {
    var res = await Crud().postData(
      confirmationUri,
      confirmationModel.toJson(),
    );
    return res.fold((l) => l, (r) => r);
  }
}
