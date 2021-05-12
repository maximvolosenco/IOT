import 'package:flutter/material.dart';

class StatisticsScreen extends StatefulWidget {
  @override
  StatisticsScreenState createState() {
    return new StatisticsScreenState();
  }
}

class StatisticsScreenState extends State<StatisticsScreen> {

  Widget _createSpace(double edgeAll){
    return new Container(
      padding: EdgeInsets.all(edgeAll),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: Column(
          children: [
            _createSpace(10),

            Image.network(
              'https://i0.wp.com/beatexcel.com/wp-content/uploads/2013/04/incell_chart.jpg?w=504',
              cacheWidth: 400,
              cacheHeight: 450,
            ),
          ]
        )
      )

    );
  }
}