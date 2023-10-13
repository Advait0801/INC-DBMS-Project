class EscortsData {
  final int teamId;
  final String teamName;
  final String projectAbstract;
  final String domain;
  final String projectType;
  final String roomNumber;
  final String instituteName;

  EscortsData({
    required this.teamId,
    required this.teamName,
    required this.projectAbstract,
    required this.domain,
    required this.roomNumber,
    required this.projectType,
    required this.instituteName,
  });

  factory EscortsData.fromJson(Map<String, dynamic> json) {
    return EscortsData(
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
