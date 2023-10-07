import 'package:flutter/material.dart';

class EscortDataCard extends StatelessWidget {
  final int EscortID;
  final String EscortName;
  final String Judges_Assigned;
  const EscortDataCard({super.key, required this.EscortID, required this.EscortName, required this.Judges_Assigned});

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
                    'EscortId: $EscortID',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.002,),
                  Text(
                    'Escort Name: $EscortName',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.002,),
                  Text(
                    'Judges Assigned: $Judges_Assigned',
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
