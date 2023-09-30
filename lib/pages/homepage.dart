

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../api/api.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Response> fetchresponse;
  late Future<List<Response>> userList;

  @override
  void initState() {
    super.initState();
    fetchresponse = fetchResponse();
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('ocxeantech', style: TextStyle(color: Colors.black)),
            toolbarHeight: 80,
            backgroundColor: Colors.white70),
        body: ListView(
          children: [

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                            child: Text('Name:A-Z'),
                            color: Colors.white70,
                            height: 30,
                            width: 75),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            child: Text('Name:A-Z'),
                            color: Colors.white70,
                            height: 30,
                            width: 75),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            child: Text('Name:A-Z'),
                            color: Colors.white70,
                            height: 30,
                            width: 75),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            child: Text('Name:A-Z'),
                            color: Colors.white70,
                            height: 30,
                            width: 75),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            child: Text('Name:A-Z'),
                            color: Colors.white70,
                            height: 30,
                            width: 75),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 150,
                  width: 350,
                  color: Colors.white70,
                  child: FutureBuilder(
                    future: fetchResponse(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return
                          ListView(
                          children: [
                            // Text(snapshot.data![index].name.toString()),
                           Text(snapshot.data!.body),

                            // ,Text(snapshot.data?.body.length as String),Text(snapshot.connectionState.name),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('no data ');
                        // return Text('${snapshot.hasError}');
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}










// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import '../api/api.dart'; // Make sure to import your API related code
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   late Future<Response> futureresponse;
//
//   @override
//   void initState() {
//     super.initState();
//     futureresponse = fetchResponse();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('ocxeantech', style: TextStyle(color: Colors.black)),
//           toolbarHeight: 80,
//           backgroundColor: Colors.white70,
//         ),
//         body: ListView(
//           children: [
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         Container(
//                           child: Text('Name:A-Z'),
//                           color: Colors.white70,
//                           height: 30,
//                           width: 75,
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         // Add more containers here if needed
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   height: 150,
//                   width: 350,
//                   color: Colors.white70,
//                   child: FutureBuilder<Response>(
//                     future: futureresponse, // Use the futureresponse variable
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return CircularProgressIndicator();
//                       } else if (snapshot.hasError) {
//                         return Text('Error: ${snapshot.error}');
//                       } else if (!snapshot.hasData ||
//                           snapshot.data?.statusCode != 200) {
//                         return Text('No data available');
//                       } else {
//                         // Parse the JSON response here, assuming it's a list of 'respons'
//                         // You may need to adjust this based on your actual API response structure
//                         // You can access the response body using snapshot.data?.body
//                         // Example:
//                         final List<dynamic> responseData =
//                         jsonDecode(snapshot.data!.body);
//
//                         // You can map the response data to your 'respons' objects
//                         final List<respons> responsList = responseData
//                             .map((json) => respons.fromJson(json))
//                             .toList();
//
//                         // Use responsList to display the data
//                         return ListView.builder(
//                           itemCount: responsList.length,
//                           itemBuilder: (context, index) {
//                             final responsItem = responsList[index];
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('Name: ${responsItem.Name}'),
//                                 Text('Price: ${responsItem.Price}'),
//                                 Text('Average Rating: ${responsItem.AverageRating}'),
//                                 Text('Id: ${responsItem.Id.toString()}'),
//                                 Divider(), // Add a divider between items
//                               ],
//                             );
//                           },
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         backgroundColor: Colors.grey,
//       ),
//     );
//   }
// }
