// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:graduation_project/core/constant/statusRequest.dart';
// import 'package:graduation_project/core/functions/handlingData.dart';
// import 'package:graduation_project/core/services/services.dart';
// import 'package:graduation_project/data/model/home/categoriesModel.dart';
// import 'package:graduation_project/data/model/home/homePageModel.dart';
// import 'package:graduation_project/data/remote/home/categoriesData.dart';

// abstract class CategoriesController extends GetxController {
//   getproductById(categoriesId);
//   favorite(product_id);
// }

// MyServices myServices = Get.find();

// class CategoriesControllerImp extends CategoriesController {
//   late StatusRequest statusRequest;
//   late List<HomePageModel> allInfo;
//   @override
//   void onInit() {
//     statusRequest = StatusRequest.none;
//     allInfo = [];
//     super.onInit();
//   }

//   @override
//   getproductById(categoriesId) async {
//     allInfo = [];
//     update();
//     statusRequest = StatusRequest.loading;
//     update();
//     Future.delayed(Duration(seconds: 2), () async {
//       var res = await categoriesData().PostcategoriesData(
//         categoriesModel: CategoriesModel(
//           categories_id: '$categoriesId',
//           user_id: '${myServices.sharedPreferences.get('user_id')}',
//         ),
//       );
//       statusRequest = handlingData(res);

//       if (statusRequest == StatusRequest.success) {
//         if (allInfo.isEmpty) {
//           if (res['STATUS'] == 'SUCCESSFUL') {
//             statusRequest = StatusRequest.success;
//             update();
//             for (var item in res['INFO']) {
//               allInfo.add(HomePageModel.fromJson(item));
//             }

//             print('============${allInfo[0].categories_id}');
//             print('============${allInfo[0].product_title}');
//           } else {
//             print('is Empty');
//             statusRequest = StatusRequest.emptyInfo;
//             update();
//           }
//         }
//       } else {
//         statusRequest = StatusRequest.failure;
//         update();
//       }
//     });
//   }

//   @override
//   favorite(product_id) async {
//     for (var item in allInfo) {
//       if (item.product_id == product_id) {
//         item.favorite = 0;
//         update();
//         print('${item.favorite}');
//         print('${item.product_price}');
//         print('${item.product_title}');
//       }
//     }
//   }
// }
