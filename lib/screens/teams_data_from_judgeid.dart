import 'package:dbmsl_mini_project/models/teams_model.dart';
import 'package:dbmsl_mini_project/widgets/teams_data_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeamsDataFromJudgeId extends StatefulWidget {
  const TeamsDataFromJudgeId({super.key});
  static const String id = 'TeamsDataFromJudgeId';

  @override
  State<TeamsDataFromJudgeId> createState() => _TeamsDataFromJudgeIdState();
}

class _TeamsDataFromJudgeIdState extends State<TeamsDataFromJudgeId> {
  late Future<List<TeamsDataModel>> teamList;
  late int judgeId;

  Future<List<TeamsDataModel>> getTeamsListFromJudgeId(int judgeId) async {
    Uri url = Uri.parse("http://40.81.243.181:8080/allocation/teams/$judgeId");
    http.Response response = await http.get(url);
    final List data = json.decode(response.body);
    return data.map((e) => TeamsDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    judgeId = ModalRoute.of(context)?.settings.arguments as int;
    teamList = getTeamsListFromJudgeId(judgeId);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Teams',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.08,
                color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<TeamsDataModel>>(
          future: teamList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // until data is fetched, show loader
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              // once data is fetched, display it on screen (call buildPosts())
              final data = snapshot.data!;
              return buildPosts(data);
            } else {
              return const Text("No data available");
            }
          },
        ),
      ),
    );
  }

  Widget buildPosts(List<TeamsDataModel> data) {
    // ListView Builder to show data in a list
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final team = data[index];
        return TeamDataCard(
            teamID: team.teamId, teamName: team.teamName, domain: team.domain);
      },
    );
  }
}
