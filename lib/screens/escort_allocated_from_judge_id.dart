// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EscortAllocatedDetails extends StatelessWidget {
  EscortAllocatedDetails({super.key});
  static const String id = 'escortAllocatedDetails';
  late dynamic escortDetails;
  late int judgeId;

  Future<dynamic> getEscortAllocatedDetails(int judgeId) async {
    Uri url = Uri.parse("http://40.81.243.181:8080/escorts/from-judge/$judgeId");
    http.Response response = await http.get(url);
    var escortData = jsonDecode(response.body);
    return escortData;
  }

  @override
  Widget build(BuildContext context) {
    judgeId = ModalRoute.of(context)?.settings.arguments as int;
    escortDetails = getEscortAllocatedDetails(judgeId);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Judge Details',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.08,
                color: Colors.white),
          ),
        ),
      ),
      body: FutureBuilder(
        future: escortDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // until data is fetched, show loader
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            // once data is fetched, display it on screen (call buildPosts())
            final data = snapshot.data!;
            return buildPosts(context, data);
          } else {
            return const Text("No data available");
          }
        },
      ),
    );
  }

  Widget buildPosts(BuildContext context, dynamic data) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Escort ID: ' + data['escortId'].toString(),
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
          ),
          Text(
            'Escort Name: ' + data['name'],
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
          ),
          Text(
            'Contact No: ' + data['contactNumber'],
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
          ),
          Text(
            'Judge allocated: $judgeId',
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
          ),
        ],
      ),
    );
  }
}

