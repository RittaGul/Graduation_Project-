import 'package:graduation_project/core/class/Crud.dart';
import 'package:graduation_project/core/constant/linkUri.dart';
import 'package:graduation_project/data/model/home/homePageModel.dart';

class profileData {
  PostprofileData({required userId}) async {
    var res = await Crud().postData(
      profileInfoUri,
      {
        'user_id': '$userId',
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  editUserName({required userId, required user_name}) async {
    var res = await Crud().postData(
      editUserNameUri,
      {
        'user_id': '$userId',
        'user_name': '$user_name',
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  editBio({required userId, required user_bio}) async {
    var res = await Crud().postData(
      editbioUri,
      {
        'user_id': '$userId',
        'user_bio': '$user_bio',
      },
    );
    return res.fold((l) => l, (r) => r);
  }

  editUserProfile({required userId, required user_image}) async {
    var res = await Crud().postRequestWithFile(
      editUserProfileUri,
      {
        'user_id': '$userId',
      },
      user_image,
    );
    return res;
  }
}
