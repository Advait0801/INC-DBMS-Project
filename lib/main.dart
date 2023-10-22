import 'package:dbmsl_mini_project/screens/escort_details_page.dart';
import 'package:dbmsl_mini_project/screens/escorts_data_page.dart';
import 'package:dbmsl_mini_project/screens/home_page.dart';
import 'package:dbmsl_mini_project/screens/judge_data_from_teamid.dart';
import 'package:dbmsl_mini_project/screens/judges_data_page.dart';
import 'package:dbmsl_mini_project/screens/judges_details_page.dart';
import 'package:dbmsl_mini_project/screens/team_details_page.dart';
import 'package:dbmsl_mini_project/screens/teams_data_from_escortid.dart';
import 'package:dbmsl_mini_project/screens/teams_data_from_judgeid.dart';
import 'package:dbmsl_mini_project/screens/teams_data_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      routes: {
        HomePage.id: (context) => HomePage(),
        TeamsData.id: (context) => const TeamsData(),
        JudgesData.id: (context) => const JudgesData(),
        EscortsData.id: (context) => const EscortsData(),
        TeamsDataFromJudgeId.id: (context) => const TeamsDataFromJudgeId(),
        JudgesDataFromTeamId.id: (context) => const JudgesDataFromTeamId(),
        TeamsDataFromEscortId.id: (context) => const TeamsDataFromEscortId(),
        TeamDetails.id: (context) => TeamDetails(),
        JudgeDetails.id: (context) => JudgeDetails(),
        EscortDetails.id: (context) => EscortDetails()
      },
      initialRoute: HomePage.id,
    );
  }
}
