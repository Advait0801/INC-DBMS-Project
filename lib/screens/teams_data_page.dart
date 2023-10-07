import 'package:dbmsl_mini_project/widgets/teams_data_card.dart';
import 'package:flutter/material.dart';

class TeamsData extends StatefulWidget {
  const TeamsData({super.key});
  static const String id = 'teamsData';

  @override
  State<TeamsData> createState() => _TeamsDataState();
}

class _TeamsDataState extends State<TeamsData> {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
            horizontal: MediaQuery.of(context).size.width * 0.02),
        child: Column(
          children: [
            TeamDataCard(teamID: 1, teamName: 'A', domain: 'CN'),
            TeamDataCard(teamID: 2, teamName: 'B', domain: 'AD'),
            TeamDataCard(teamID: 3, teamName: 'C', domain: 'ES'),
            TeamDataCard(teamID: 4, teamName: 'D', domain: 'ML'),
            TeamDataCard(teamID: 5, teamName: 'E', domain: 'WEB'),
            TeamDataCard(teamID: 1, teamName: 'A', domain: 'CN'),
            TeamDataCard(teamID: 2, teamName: 'B', domain: 'AD'),
            TeamDataCard(teamID: 3, teamName: 'C', domain: 'ES'),
            TeamDataCard(teamID: 4, teamName: 'D', domain: 'ML'),
            TeamDataCard(teamID: 5, teamName: 'E', domain: 'WEB'),
          ],
        ),
      ),
    );
  }
}


