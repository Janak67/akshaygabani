import 'dart:convert';
import 'package:http/http.dart'as http;


Future<http.Response> fetchResponse() {
  return http.get(Uri.parse('https://praticle-service.s3.ap-south-1.amazonaws.com/red_and_white_api.json'));
}

class respons {
  late int Id;
  late String CategoryName;
  late String Name;
  late String Price;
  late String Image;
  late String AverageRating;

  respons({
    required this.Id,
    required this.CategoryName,
    required this.Name,
    required this.Price,
    required this.Image,
    required this.AverageRating,

  });
  factory respons.fromJson(Map<String, dynamic> json) {
    return respons(
      Id: json['Id'],
      CategoryName: json['CategoryName'],
      Name: json['Name'],
      Price: json['Price'],
      Image: json['Image'],
      AverageRating: json['AverageRating'],
    );
  }
}


Future<List<respons>> getUserApi() async {
  List<respons> userList = [];
  final response =
  await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  var data = jsonDecode(response.body); //try .toString()
  if (response.statusCode == 200) {
    for (Map<String, dynamic> item in data) {
      userList.add(respons.fromJson(item));
    }
    return userList;
  } else {
    return userList;
  }
}


// Future<respons> fetchresponse() async {
//   final Response = await http
//       .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
//
//   if (Response.statusCode == 200) {
//     return respons.fromJson(jsonDecode(Response.body));
//   } else {
//     throw Exception('Failed to load ');
//   }
// }


