import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/constant/statusRequest.dart';
import 'package:graduation_project/core/functions/checkInternet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
////// rest api http
class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUri, Map map) async {
    try {
      if (await checkInternet()) {
        var res = await http.post(Uri.parse(linkUri), body: map);
        if (res.statusCode == 200 || res.statusCode == 201) {
          var resBody = jsonDecode(res.body);
          return Right(resBody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offline);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }





  postRequestWithFile(String url, Map data, File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile("user_image", stream, length,
        filename: basename(file.path));
    request.files.add(multipartFile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myRequest = await request.send();
    var response = await http.Response.fromStream(myRequest);
    if (myRequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('errrorrr');
    }
  }
}
