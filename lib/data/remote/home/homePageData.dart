import 'package:graduation_project/core/class/Crud.dart';
import 'package:graduation_project/core/constant/linkUri.dart';
import 'package:graduation_project/data/model/home/homePageModel.dart';

class homePageData {
  PosthomePageData({required userId}) async {
    var res = await Crud().postData(
      homePageDataUri,
      {
        'user_id': '$userId',
      },
    );
    return res.fold((l) => l, (r) => r);
  }
}
