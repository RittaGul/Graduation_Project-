import 'package:graduation_project/core/class/Crud.dart';
import 'package:graduation_project/core/constant/linkUri.dart';
import 'package:graduation_project/data/model/home/FavoriteModel.dart';
import 'package:graduation_project/data/model/home/homePageModel.dart';

class FavoriteData {
  PostAddToFavoriteData({required FavoriteModel favoriteModel}) async {
    var res = await Crud().postData(
      addToFavoriteUri,
      favoriteModel.toJson(),
    );
    return res.fold((l) => l, (r) => r);
  }

  PostDeleteFromFavoriteData({required FavoriteModel favoriteModel}) async {
    var res = await Crud().postData(
      deleteFromFavoriteUri,
      favoriteModel.toJson(),
    );
    return res.fold((l) => l, (r) => r);
  }

  PostForiteInfo({required FavoriteModel favoriteModel}) async {
    var res = await Crud().postData(
      favoriteInfoUri,
      favoriteModel.toJson(),
    );
    return res.fold((l) => l, (r) => r);
  }
}
