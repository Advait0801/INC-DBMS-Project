import 'package:dbmsl_mini_project/screens/escorts_data_page.dart';
import 'package:dbmsl_mini_project/screens/judges_data_page.dart';
import 'package:dbmsl_mini_project/screens/teams_data_page.dart';
import 'package:dbmsl_mini_project/models/teams_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static const String id = 'home';
  final List<String> queries = [
    'Get Team allocated from Judge Id',
    'Get Team Details from Escort Id',
    'Get Judge allocated details from Team Id',  
    'Get Judge Contact Number from Judge Id',
    'Get Escort allocated from Judge Id',
    'Get Escort details from Escort Id'
  ];

  Future<List<TeamsDataModel>> getTeamsListFromJudgeId(int judgeId) async {
    Uri url = Uri.parse("http://40.81.243.181:8080/allocation/teams/{$judgeId}");
    http.Response response = await http.get(url);
    final List data = json.decode(response.body);
    return data.map((e) => TeamsDataModel.fromJson(e)).toList();
  }

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
                      onPressed: () {},
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
