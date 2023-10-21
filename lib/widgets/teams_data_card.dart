import 'package:flutter/material.dart';

class TeamDataCard extends StatelessWidget {
  final int teamID;
  final String teamName;
  final String domain;
  const TeamDataCard(
      {super.key,
      required this.teamID,
      required this.teamName,
      required this.domain});

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
                    'TeamId: $teamID',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.002,
                  ),
                  Text(
                    'Team Name: $teamName',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.002,
                  ),
                  Text(
                    'Domain: $domain',
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
    );
  }
}
