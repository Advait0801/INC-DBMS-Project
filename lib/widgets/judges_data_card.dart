import 'package:dbmsl_mini_project/screens/judges_details_page.dart';
import 'package:flutter/material.dart';

class JudgeDataCard extends StatelessWidget {
  final int judgeId;
  final String judgeName;
  final String domain;
  const JudgeDataCard(
      {super.key,
      required this.judgeId,
      required this.judgeName,
      required this.domain});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, JudgeDetails.id, arguments: judgeId);
      },
      child: Card(
        elevation: 1.2,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.08,
                  backgroundImage: const AssetImage('images/INC_Logo.jpeg'),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                VerticalDivider(
                  thickness: MediaQuery.of(context).size.width * 0.005,
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'judgeId: $judgeId;',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    Text(
                      'Judge Name: $judgeName',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    Text(
                      'domain: $domain',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
