import 'dart:html';

import 'package:dio/dio.dart';


// Future post(String path, Map<String, dynamic> data) async {
//   File file = File("file_path_here");
//   FormData formData = FormData.fromMap({
//     "image":
//     await MultipartFile.fromFile(file.path, filename: "file_name.jpg"),
//   });
//
//   var response = await Dio().post(
//       "https://count-object.herokuapp.com/upload", data: formData);
// }