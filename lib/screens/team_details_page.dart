import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TeamDetails extends StatelessWidget {
  TeamDetails({super.key});
  late dynamic teamData;
  late int teamId;

  Future<dynamic> getTeamDetails(int teamId) async {
    Uri url = Uri.parse("http://40.81.243.181:8080/teams");
    http.Response response = await http.get(url);
    final String data = json.decode(response.body);
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Team ID: $teamId',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.1
            ),
          ),
          Text(
            'Team Name: ' + teamData['name'],
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.1
            ),
          ),
          Text(
            'Team Domain: ' + teamData['domain'],
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.1
            ),
          ),
          Text(
            'Abstract: ' + teamData['abstract'],
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.1
            ),
          ),
          Text(
            'Institution Name: ' + teamData['institutionName'],
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.1
            ),
          ),
          Text(
            'Room No: ' + teamData['roomNumber'],
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.1
            ),
          ),
        ],
      ),
    );
  }
}