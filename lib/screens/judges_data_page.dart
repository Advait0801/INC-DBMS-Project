import 'package:dbmsl_mini_project/models/judges_model.dart';
import 'package:dbmsl_mini_project/widgets/judges_data_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JudgesData extends StatefulWidget {
  const JudgesData({super.key});
  static const String id = 'judgesData';

  @override
  State<JudgesData> createState() => _JudgesDataState();
}

class _JudgesDataState extends State<JudgesData> {
  late Future<List<JudgesDataModel>> judgesData;

  Future<List<JudgesDataModel>> getTeamsList() async {
    Uri url = Uri.parse("http://40.81.243.181:8080/judges");
    http.Response response = await http.get(url);
    final List data = json.decode(response.body);
    return data.map((e) => JudgesDataModel.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    judgesData = getTeamsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Judges',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.08,
                color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<JudgesDataModel>>(
          future: judgesData,
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

  Widget buildPosts(List<JudgesDataModel> data) {
    // ListView Builder to show data in a list
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final judge = data[index];
        return JudgeDataCard(
          judgeId: judge.judgeId,
          judgeName: judge.judgeName,
          domain: judge.domain
        );
      },
    );
  }
}
