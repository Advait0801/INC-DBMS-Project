import 'package:dbmsl_mini_project/screens/escorts_data_page.dart';
import 'package:dbmsl_mini_project/screens/judges_data_page.dart';
import 'package:dbmsl_mini_project/screens/teams_data_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String id = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Image.asset('images/INC_Logo.jpeg')),
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'INC',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.08,
                color: Colors.white),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    child: Text(
                      'Teams',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, TeamsData.id);
                    },
                  ),
                  VerticalDivider(
                    thickness: MediaQuery.of(context).size.width * 0.005,
                    color: Colors.white,
                  ),
                  TextButton(
                    child: Text(
                      'Judges',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, JudgesData.id);
                    },
                  ),
                  VerticalDivider(
                    thickness: MediaQuery.of(context).size.width * 0.005,
                    color: Colors.white,
                  ),
                  TextButton(
                    child: Text(
                      'Escorts',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, EscortsData.id);
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Expanded(
              child: Container(
            color: Colors.red,
          ))
        ],
      ),
    );
  }
}

// GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.59,
//                   ),
//                   itemCount: eventList.length,
//                   itemBuilder: ((context, index) {
//                     final event = eventList[index];

//                     return Padding(
//                       padding: EdgeInsets.only(
//                         top: 10,
//                         left: MediaQuery.of(context).size.width * 0.02,
//                         right: MediaQuery.of(context).size.width * 0.02,
//                       ),
//                       child: null
//                     );
//                   }),
//                 )),
