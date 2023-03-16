/* 

category_id = 0  ==>  laptob
category_id = 1  ==>  mobile
category_id = 2 ==>  pants
category_id = 3  ==>  Tshirt
category_id = 4  ==>  All
 */

import 'package:graduation_project/core/constant/getProducts.dart';

var getCategories = [
  {
    'category_id': 1,
    'category_type': getMobile,
    'image_type': 'svg',
    'imageLink': 'assets/images/cate-5.svg',
    'title': 'Mobile',
  },
  {
    'category_id': 2,
    'category_type': getLaptob,
    'image_type': 'svg',
    'imageLink': 'assets/images/cate-6.svg',
    'title': 'Laptob',
  },
  {
    'category_id': 3,
    'category_type': getPants,
    'image_type': 'svg',
    'imageLink': 'assets/images/cate-3.svg',
    'title': 'Pants',
  },
  {
    'category_id': 4,
    'category_type': getTshirt,
    'image_type': 'svg',
    'imageLink': 'assets/images/cate-4.svg',
    'title': 'Tshirt',
  },
  {
    'category_id': 5,
    'category_type': AllProducts,
    'image_type': 'svg',
    'imageLink': 'assets/images/else1.svg',
    'title': 'All',
  },
];
