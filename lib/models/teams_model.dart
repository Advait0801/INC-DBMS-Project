class TeamsData {
  final int teamId;
  final String teamName;
  final String projectAbstract;
  final String domain;
  final String projectType;
  final String roomNumber;
  final String instituteName;

  TeamsData({
    required this.teamId,
    required this.teamName,
    required this.projectAbstract,
    required this.domain,
    required this.roomNumber,
    required this.projectType,
    required this.instituteName,
  });

  factory TeamsData.fromJson(Map<String, dynamic> json) {
    return TeamsData(
      teamId: json['teamId'],
      teamName: json['name'],
      projectAbstract: json['abstract'],
      domain: json['domain'],
      projectType: json['projectType'],
      roomNumber: json['roomNumber'],
      instituteName: json['instituteName'],
    );
  }
}
