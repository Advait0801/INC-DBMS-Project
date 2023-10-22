// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TeamDetails extends StatelessWidget {
  TeamDetails({super.key});
  static const String id = 'teamDetails';
  late int teamId;
  late dynamic teamData;

  Future<dynamic> getTeamDetails(int teamId) async {
    Uri url = Uri.parse("http://40.81.243.181:8080/teams/$teamId");
    http.Response response = await http.get(url);
    var data = json.decode(response.body);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    teamId = ModalRoute.of(context)?.settings.arguments as int;
    teamData = getTeamDetails(teamId);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Team Details',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.08,
                color: Colors.white),
          ),
        ),
      ),
      body: FutureBuilder(
        future: teamData,
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
            'Team ID: ' + data['teamId'].toString(),
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
          ),
          Text(
            'Team Name: ' + data['name'],
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
          ),
          Text(
            'Team Domain: ' + data['domain'],
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
          ),
          Text(
            'Abstract: ' + data['abstract'],
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
          ),
          Text(
            'Institution Name: ' + data['instituteName'],
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
          ),
          Text(
            'Room No: ' + data['roomNumber'],
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
          ),
        ],
      ),
    );
  }
}
