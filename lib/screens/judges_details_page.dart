// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JudgeDetails extends StatelessWidget {
  JudgeDetails({super.key});
  static const String id = 'JudgeDetails';
  late int judgeId;
  late dynamic judgeData;

  Future<dynamic> getJudgeDetails(int judgeId) async {
    Uri url = Uri.parse("http://40.81.243.181:8080/judges/$judgeId");
    http.Response response = await http.get(url);
    var data = json.decode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    judgeId = ModalRoute.of(context)?.settings.arguments as int;
    judgeData = getJudgeDetails(judgeId);
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
        future: judgeData,
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
            'Judge ID: ' + data['judgeId'].toString(),
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
          ),
          Text(
            'Judge Name: ' + data['name'],
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
          ),
          Text(
            'Domain: ' + data['domain'],
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
          ),
          Text(
            'Contact No: ' + data['contactNumber'],
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1),
          ),
        ],
      ),
    );
  }
}
