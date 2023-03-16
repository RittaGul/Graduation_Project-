import 'package:graduation_project/core/class/Crud.dart';
import 'package:graduation_project/core/constant/linkUri.dart';
import 'package:graduation_project/data/model/home/categoriesModel.dart';
import 'package:graduation_project/data/model/home/homePageModel.dart';

class categoriesData {
  PostcategoriesData({required CategoriesModel categoriesModel}) async {
    var res = await Crud().postData(
      categoriesDataUri,
      categoriesModel.toJson(),
    );
    return res.fold((l) => l, (r) => r);
  }
}
