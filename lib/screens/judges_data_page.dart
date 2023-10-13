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
        child: const Column(
          children: [
            JudgeDataCard(judgeId: 1, judgeName: "Niranjan Joshi", projects: "CN001"),
            JudgeDataCard(judgeId: 2, judgeName: "B", projects: "AD002"),
            JudgeDataCard(judgeId: 3, judgeName: "C", projects: "ES002"),
            JudgeDataCard(judgeId: 4, judgeName: "D", projects: "CN002"),
            JudgeDataCard(judgeId: 5, judgeName: "E", projects: "AD002"),
            JudgeDataCard(judgeId: 6, judgeName: "F", projects: "AD002"),
            JudgeDataCard(judgeId: 7, judgeName: "G", projects: "AD002"),
            JudgeDataCard(judgeId: 8, judgeName: "H", projects: "AD002"),
            JudgeDataCard(judgeId: 9, judgeName: "I", projects: "AD002")

          ],
        ),
      ),
    );
  }
}
