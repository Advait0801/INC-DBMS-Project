import 'package:dbmsl_mini_project/widgets/judges_data_card.dart';
import 'package:flutter/material.dart';

class JudgesData extends StatefulWidget {
  const JudgesData({super.key});
  static const String id = 'judgesData';

  @override
  State<JudgesData> createState() => _JudgesDataState();
}

class _JudgesDataState extends State<JudgesData> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
            horizontal: MediaQuery.of(context).size.width * 0.02),
        child: Column(
          children: [
            JudgeDataCard(JudgeID: 1, JudgeName: "Niranjan Joshi", Projects: "CN001"),
            JudgeDataCard(JudgeID: 2, JudgeName: "B", Projects: "AD002"),
            JudgeDataCard(JudgeID: 3, JudgeName: "C", Projects: "ES002"),
            JudgeDataCard(JudgeID: 4, JudgeName: "D", Projects: "CN002"),
            JudgeDataCard(JudgeID: 5, JudgeName: "E", Projects: "AD002"),
            JudgeDataCard(JudgeID: 6, JudgeName: "F", Projects: "AD002"),
            JudgeDataCard(JudgeID: 7, JudgeName: "G", Projects: "AD002"),
            JudgeDataCard(JudgeID: 8, JudgeName: "H", Projects: "AD002"),
            JudgeDataCard(JudgeID: 9, JudgeName: "I", Projects: "AD002")

          ],
        ),
      ),
    );
  }
}
