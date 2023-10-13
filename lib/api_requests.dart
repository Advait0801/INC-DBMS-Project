import 'dart:convert';
import 'package:dbmsl_mini_project/models/escorts_model.dart';
import 'package:dbmsl_mini_project/models/judges_model.dart';
import 'package:dbmsl_mini_project/models/teams_model.dart';
import 'package:http/http.dart' as http;

class Api{
  final String apiLink;

  Api(this.apiLink);

  Future<List<TeamsData>> getTeamsList() async {
    Uri url = Uri.parse(apiLink);
    http.Response response = await http.get(url);
    final List data = json.decode(response.body);
    return data.map((e) => TeamsData.fromJson(e)).toList();
  } 

  Future<List<JudgesData>> getJudgesList() async {
    Uri url = Uri.parse(apiLink);
    http.Response response = await http.get(url);
    final List data = json.decode(response.body);
    return data.map((e) => JudgesData.fromJson(e)).toList();
  } 

  Future<List<EscortsData>> getEscortsList() async {
    Uri url = Uri.parse(apiLink);
    http.Response response = await http.get(url);
    final List data = json.decode(response.body);
    return data.map((e) => EscortsData.fromJson(e)).toList();
  } 
}
