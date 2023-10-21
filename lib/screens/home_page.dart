import 'package:dbmsl_mini_project/screens/escorts_data_page.dart';
import 'package:dbmsl_mini_project/screens/judge_data_from_teamid.dart';
import 'package:dbmsl_mini_project/screens/judges_data_page.dart';
import 'package:dbmsl_mini_project/screens/teams_data_from_escortid.dart';
import 'package:dbmsl_mini_project/screens/teams_data_from_judgeid.dart';
import 'package:dbmsl_mini_project/screens/teams_data_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static const String id = 'home';
  final textController = TextEditingController();
  final List<String> queries = [
    'Get Team allocated from Judge Id',
    'Get Team Details from Escort Id',
    'Get Judge allocated details from Team Id',
    'Get Judge Contact Number from Judge Id',
    'Get Escort allocated from Judge Id',
    'Get Escort details from Escort Id'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Image.asset('images/INC_Logo.jpeg')),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'INC',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.08,
                color: Colors.white),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: Text(
                      'Teams',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, TeamsData.id);
                    },
                  ),
                  VerticalDivider(
                    thickness: MediaQuery.of(context).size.width * 0.005,
                    color: Colors.white,
                  ),
                  TextButton(
                    child: Text(
                      'Judges',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, JudgesData.id);
                    },
                  ),
                  VerticalDivider(
                    thickness: MediaQuery.of(context).size.width * 0.005,
                    color: Colors.white,
                  ),
                  TextButton(
                    child: Text(
                      'Escorts',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, EscortsData.id);
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          Expanded(
            child: Container(
              color: Colors.red,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                ),
                itemCount: queries.length,
                itemBuilder: ((context, index) {
                  final query = queries[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: MediaQuery.of(context).size.width * 0.02,
                      right: MediaQuery.of(context).size.width * 0.02,
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      onPressed: () {
                        if (index == 0) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      'Enter Judge ID',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width * 0.05,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    content: TextField(
                                      controller: textController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    actions: [
                                      MaterialButton(
                                        child: Text(
                                          'Go..',
                                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
                                        ),
                                        onPressed: () {
                                          int val = int.parse(textController.text);
                                          Navigator.pop(context);
                                          textController.clear();
                                          Navigator.pushNamed(context, TeamsDataFromJudgeId.id,arguments: val);
                                        },
                                      )
                                    ],
                                  ),
                            );
                        }
                        if (index == 1) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      'Enter Escort ID',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width * 0.05,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    content: TextField(
                                      controller: textController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    actions: [
                                      MaterialButton(
                                        child: Text(
                                          'Go..',
                                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
                                        ),
                                        onPressed: () {
                                          int val = int.parse(textController.text);
                                          Navigator.pop(context);
                                          textController.clear();
                                          Navigator.pushNamed(context, TeamsDataFromEscortId.id,arguments: val);
                                        },
                                      )
                                    ],
                                  ),
                            );
                        }
                        if (index == 2) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      'Enter Team ID',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width * 0.05,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    content: TextField(
                                      controller: textController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    actions: [
                                      MaterialButton(
                                        child: Text(
                                          'Go..',
                                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
                                        ),
                                        onPressed: () {
                                          int val = int.parse(textController.text);
                                          Navigator.pop(context);
                                          textController.clear();
                                          Navigator.pushNamed(context, JudgesDataFromTeamId.id,arguments: val);
                                        },
                                      )
                                    ],
                                  ),
                            );
                        }
                        if (index == 3) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      'Enter Judge ID',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width * 0.05,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    content: TextField(
                                      controller: textController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    actions: [
                                      MaterialButton(
                                        child: Text(
                                          'Go..',
                                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
                                        ),
                                        onPressed: () {
                                          int val = int.parse(textController.text);
                                          Navigator.pop(context);
                                          textController.clear();
                                          Navigator.pushNamed(context, TeamsDataFromJudgeId.id,arguments: val);
                                        },
                                      )
                                    ],
                                  ),
                            );
                        }
                        if (index == 4) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      'Enter Judge ID',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width * 0.05,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    content: TextField(
                                      controller: textController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    actions: [
                                      MaterialButton(
                                        child: Text(
                                          'Go..',
                                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
                                        ),
                                        onPressed: () {
                                          int val = int.parse(textController.text);
                                          Navigator.pop(context);
                                          textController.clear();
                                          Navigator.pushNamed(context, TeamsDataFromJudgeId.id,arguments: val);
                                        },
                                      )
                                    ],
                                  ),
                            );
                        }
                        if (index == 5) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      'Enter Judge ID',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width * 0.05,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    content: TextField(
                                      controller: textController,
                                      keyboardType: TextInputType.number,
                                    ),
                                    actions: [
                                      MaterialButton(
                                        child: Text(
                                          'Go..',
                                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
                                        ),
                                        onPressed: () {
                                          int val = int.parse(textController.text);
                                          Navigator.pop(context);
                                          textController.clear();
                                          Navigator.pushNamed(context, TeamsDataFromJudgeId.id,arguments: val);
                                        },
                                      )
                                    ],
                                  ),
                            );
                        }
                      },
                      child: Center(
                        child: Text(
                          query,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
