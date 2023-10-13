class TeamListModel {
  int? teamId;
  String? teamName;
  String? projectAbstract;
  String? domain;
  String? projectType;
  String? roomNumber;
  String? instituteName;

  TeamListModel({
    this.teamId,
    this.teamName,
    this.projectAbstract,
    this.domain,
    this.roomNumber,
    this.projectType,
    this.instituteName
  });

  TeamListModel.fromJson(Map<String , dynamic> json){
    teamId = json['teamId'];
    teamName = json['name'];
    projectAbstract = json['abstract'];
    domain = json['domain'];
    projectType = json['projectType'];
    roomNumber = json['roomNumber'];
    instituteName = json['instituteName'];
  }
}

// static Future<List<Post>> getPosts() async {
//   var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1/photos");
//   final response = await http.get(url, headers: {"Content-Type": "application/json"});
//   final List body = json.decode(response.body);
//   return body.map((e) => Post.fromJson(e)).toList();
// }
// {
//         "teamId": 1,
//         "name": "developers-herd",
//         "abstract": "<sample-abstract>",
//         "domain": "Others",
//         "projectType": "SOFTWARE",
//         "roomNumber": "A2202",
//         "instituteName": "Pune Institute of Computer Technology"
//     },
