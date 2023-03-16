import 'package:get/get.dart';
import 'package:graduation_project/core/constant/routes.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/core/functions/handlingData.dart';
import 'package:graduation_project/core/services/services.dart';
import 'package:graduation_project/data/model/home/FavoriteModel.dart';
import 'package:graduation_project/data/model/home/categoriesModel.dart';
import 'package:graduation_project/data/model/home/homePageModel.dart';
import 'package:graduation_project/data/remote/home/FavoriteData.dart';
import 'package:graduation_project/data/remote/home/categoriesData.dart';
import 'package:graduation_project/data/remote/home/homePageData.dart';
import 'package:http/http.dart' as http;

abstract class homePageController extends GetxController {
  getDetailsPage(index);
  getproductById(categoriesId);
  getData();
  favorite(product_id, type);
  favoriteInfo();
}

MyServices myServices = Get.find();

class homePageControllerImp extends homePageController {
  late StatusRequest statusRequest;
  late List<HomePageModel> allInfo;
  late List<HomePageModel> categoryInfo;
  late List<HomePageModel> favoriteProduct;
  getDetailsPage(index) {
    Get.toNamed(AppRoute.ProductDetailsScreen, arguments: {
      'index': index,
    });
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.none;
    allInfo = [];
    categoryInfo = [];
    favoriteProduct = [];
    super.onInit();
  }

  @override
  getData() async {
    allInfo = [];
    update();
    statusRequest = StatusRequest.loading;
    update();
    var res = await homePageData().PosthomePageData(
      userId: '${myServices.sharedPreferences.getString('user_id')}',
    );
    statusRequest = handlingData(res);
    if (statusRequest == StatusRequest.success) {
      if (allInfo.isEmpty) {
        for (var item in res['INFO']) {
          allInfo.add(HomePageModel.fromJson(item));
        }
      }
      statusRequest = StatusRequest.none;
      update();
    } else {
      statusRequest = StatusRequest.failure;
      update();
    }
  }

  @override
  favorite(product_id, type) async {
    for (var item in (type == 0
        ? allInfo
        : type == 1
            ? categoryInfo
            : favoriteProduct)) {
      if (item.product_id == product_id) {
        if (item.favorite == '1') {
          if (type == 2) {
            await favoriteInfo();
          } else {
            await getData();
          }
          var res = await FavoriteData().PostDeleteFromFavoriteData(
            favoriteModel: FavoriteModel(
              user_id: '${myServices.sharedPreferences.getString('user_id')}',
              product_id: '${item.product_id}',
            ),
          );
          print('======== $res');
          item.favorite = '0';
          update();
        } else {
          var res = await FavoriteData().PostAddToFavoriteData(
            favoriteModel: FavoriteModel(
              user_id: '${myServices.sharedPreferences.getString('user_id')}',
              product_id: '${item.product_id}',
            ),
          );
          print('======== $res');
          item.favorite = '1';
          update();
        }
        print('${item.favorite}');
        print('${item.product_id}');
        print('${item.product_price}');
        print('${item.product_title}');
      }
    }
  }

  @override
  getproductById(categoriesId) async {
    categoryInfo = [];
    update();
    statusRequest = StatusRequest.loading;
    update();
    Future.delayed(Duration(seconds: 2), () async {
      var res = await categoriesData().PostcategoriesData(
        categoriesModel: CategoriesModel(
          categories_id: '$categoriesId',
          user_id: '${myServices.sharedPreferences.getString('user_id')}',
        ),
      );
      statusRequest = handlingData(res);

      if (statusRequest == StatusRequest.success) {
        if (categoryInfo.isEmpty) {
          if (res['STATUS'] == 'SUCCESSFUL') {
            statusRequest = StatusRequest.success;
            update();
            for (var item in res['INFO']) {
              categoryInfo.add(HomePageModel.fromJson(item));
            }

          } else {
            print('is Empty');
            statusRequest = StatusRequest.emptyInfo;
            update();
          }
        }
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    });
  }

  @override
  favoriteInfo() {
    favoriteProduct = [];
    update();
    statusRequest = StatusRequest.loading;
    update();
    Future.delayed(Duration(seconds: 2), () async {
      var res = await FavoriteData().PostForiteInfo(
        favoriteModel: FavoriteModel(
          user_id: '${myServices.sharedPreferences.getString('user_id')}',
          product_id: '',
        ),
      );
      print('============= $res');
      statusRequest = handlingData(res);

      if (statusRequest == StatusRequest.success) {
        if (favoriteProduct.isEmpty) {
          if (res['STATUS'] == 'SUCCESSFUL') {
            statusRequest = StatusRequest.success;
            update();
            for (var item in res['INFO']) {
              favoriteProduct.add(HomePageModel.fromJson(item));
            }

          } else {
            print('is Empty');
            statusRequest = StatusRequest.emptyInfo;
            update();
          }
        }
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    });
  }
}
