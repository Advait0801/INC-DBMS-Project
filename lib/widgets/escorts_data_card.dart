import 'package:dbmsl_mini_project/screens/escort_details_page.dart';
import 'package:flutter/material.dart';

class EscortDataCard extends StatelessWidget {
  final int escortId;
  final String escortName;
  final int judgeId;
  const EscortDataCard(
      {super.key,
      required this.escortId,
      required this.escortName,
      required this.judgeId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EscortDetails.id, arguments: escortId);
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
                      'escortId: $escortId',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    Text(
                      'Escort Name: $escortName',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002,
                    ),
                    Text(
                      'Judges Assigned: $judgeId',
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
