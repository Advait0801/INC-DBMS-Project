import 'package:dbmsl_mini_project/widgets/escorts_data_card.dart';
import 'package:flutter/material.dart';

class EscortsData extends StatefulWidget {
  const EscortsData({super.key});
  static const String id = 'escortsData';

  @override
  State<EscortsData> createState() => _EscortsDataState();
}

class _EscortsDataState extends State<EscortsData> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Padding(
          padding:EdgeInsets.all(8.0),
          child: Text(
            'Escorts',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width *0.08,
              color: Colors.white
            ),
          ),
           ),
        
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height *0.01,
          horizontal: MediaQuery.of(context).size.width *0.02
        ),
        child: Column(
          children: [
            EscortDataCard(EscortID: 1, EscortName: 'advait', Judges_Assigned: '1,2,3'),
            EscortDataCard(EscortID: 2, EscortName: 'advait', Judges_Assigned: '1,2,3'),
            EscortDataCard(EscortID: 3, EscortName: 'advait', Judges_Assigned: '1,2,3'),
            EscortDataCard(EscortID: 4, EscortName: 'advait', Judges_Assigned: '1,2,3'),
            EscortDataCard(EscortID: 5, EscortName: 'advait', Judges_Assigned: '1,2,3'),
            EscortDataCard(EscortID: 6, EscortName: 'advait', Judges_Assigned: '1,2,3'),
            EscortDataCard(EscortID: 7, EscortName: 'advait', Judges_Assigned: '1,2,3'),
            EscortDataCard(EscortID: 8, EscortName: 'advait', Judges_Assigned: '1,2,3'),
            EscortDataCard(EscortID: 9, EscortName: 'advait', Judges_Assigned: '1,2,3'),
          ],
        ),
      ),
      
    );
  }
}
