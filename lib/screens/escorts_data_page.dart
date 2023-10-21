import 'package:dbmsl_mini_project/models/escorts_model.dart';
import 'package:dbmsl_mini_project/widgets/escorts_data_card.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EscortsData extends StatefulWidget {
  const EscortsData({super.key});
  static const String id = 'escortsData';

  @override
  State<EscortsData> createState() => _EscortsDataState();
}

class _EscortsDataState extends State<EscortsData> {
  late Future<List<EscortsDataModel>> escortsData;

  Future<List<EscortsDataModel>> getTeamsList() async {
    Uri url = Uri.parse("http://40.81.243.181:8080/escorts");
    http.Response response = await http.get(url);
    final List data = json.decode(response.body);
    return data.map((e) => EscortsDataModel.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    escortsData = getTeamsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Escorts',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.08,
                color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<EscortsDataModel>>(
          future: escortsData,
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

  Widget buildPosts(List<EscortsDataModel> data) {
    // ListView Builder to show data in a list
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final escort = data[index];
        return EscortDataCard(
            escortId: escort.escortId,
            escortName: escort.escortName,
            judgeId: escort.judgeId);
      },
    );
  }
}
