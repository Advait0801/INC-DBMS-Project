class EscortsDataModel {
  final int escortId;
  final String escortName;
  final String contactNumber;
  final int judgeId;

  EscortsDataModel(
      {required this.escortId,
      required this.escortName,
      required this.contactNumber,
      required this.judgeId});

  factory EscortsDataModel.fromJson(Map<String, dynamic> json) {
    return EscortsDataModel(
        escortId: json['escortId'],
        escortName: json['name'],
        contactNumber: json['contactNumber'],
        judgeId: json['judgeId']);
  }
}
