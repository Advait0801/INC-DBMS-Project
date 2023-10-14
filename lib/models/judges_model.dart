class JudgesDataModel {
  final int judgeId;
  final String judgeName;
  final String domain;
  final String contactNumber;

  JudgesDataModel({
    required this.judgeId,
    required this.judgeName,
    required this.domain,
    required this.contactNumber
  });

  factory JudgesDataModel.fromJson(Map<String, dynamic> json) {
    return JudgesDataModel(
      judgeId: json['judgeId'],
      judgeName: json['name'],
      domain: json['domain'],
      contactNumber: json['contactNumber']
    );
  }
}