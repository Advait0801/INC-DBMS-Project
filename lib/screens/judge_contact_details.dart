// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JudgeContactNumber extends StatelessWidget {
  JudgeContactNumber({super.key});
  static const String id = 'judgeContactNumber';
  late dynamic judgeContactNumber;
  late int judgeId;

  Future<dynamic> getJudgeContactNumber(int judgeId) async {
    Uri url = Uri.parse("http://40.81.243.181:8080/judges/contact_num/$judgeId");
    http.Response response = await http.get(url);
    var contactNo = jsonDecode(response.body);
    return contactNo;
  }

  @override
  Widget build(BuildContext context) {
    judgeId = ModalRoute.of(context)?.settings.arguments as int;
    judgeContactNumber = getJudgeContactNumber(judgeId);
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
        future: judgeContactNumber,
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
            'Judge ID: $judgeId',
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
          ),
          Text(
            'Judge Contact No: ' + data['contactNumber'],
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
          ),
        ],
      ),
    );
  }
}

