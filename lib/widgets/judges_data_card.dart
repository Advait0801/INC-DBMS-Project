import 'package:flutter/material.dart';

class JudgeDataCard extends StatelessWidget {
  final int JudgeID;
  final String JudgeName;
  final String Projects;
  const JudgeDataCard({super.key, required this.JudgeID, required this.JudgeName, required this.Projects});

  @override
  Widget build(BuildContext context) {
    return Card(
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
              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
              VerticalDivider(thickness: MediaQuery.of(context).size.width * 0.005,color: Colors.white,),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'JudgeId: $JudgeID',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.002,),
                  Text(
                    'Judge Name: $JudgeName',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.002,),
                  Text(
                    'Projects: $Projects',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
