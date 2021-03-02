
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart'as charts;
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:virus/Service/services.dart';


class WorldService extends StatefulWidget {
  @override
  _WorldServiceState createState() => _WorldServiceState();
}

class _WorldServiceState extends State<WorldService> {
  generateData(){
    var pieData=[
    new Task('Recovered', 15,Colors.green),
      new Task('Total Cases', 25,Colors.red),
      new Task('Deaths', 45,Colors.yellow),
    ];

    seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (Task rate,_)=>rate.caseVal,
        measureFn: (Task rate,_)=>rate.recover,
        colorFn: (Task rate,_)=>
        charts.ColorUtil.fromDartColor(rate.colorVal),
        id: 'Daily Chart',
        labelAccessorFn: (Task row,_)=>'${row.recover}',
      ),
    );
  }
List<charts.Series<Task,String>>seriesPieData;
  Future<Services> futureData;

  Future<Services> fetchData() async {
    final response =
    await http.get('https://coronavirus-19-api.herokuapp.com/all');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Services.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    futureData = fetchData();
    seriesPieData=List<charts.Series<Task,String>>();
    generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            body:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: Center(
                  child: Column(
                    children: [
                      Text(""),
                      Expanded(child:charts.PieChart(
                        seriesPieData,
                        animate: true,
                        animationDuration: Duration(seconds: 5),
                        behaviors: [
                          new charts.DatumLegend(
                            outsideJustification: charts.OutsideJustification.endDrawArea,
                            horizontalFirst: false,
                            desiredMaxRows: 2,
                            cellPadding: new EdgeInsets.only(right: 4.0,bottom: 4.0),
                            entryTextStyle: charts.TextStyleSpec(color: charts.MaterialPalette.purple.shadeDefault,
                            fontFamily: 'Georgia',
                            fontSize: 11),
                          )
                        ],
                        defaultRenderer: new charts.ArcRendererConfig(
                          arcWidth: 100,
                          arcRendererDecorators: [
                            new charts.ArcLabelDecorator(labelPosition: charts.ArcLabelPosition.inside)
                          ]
                        ),
                      ) )
                    ],
                  ),
                )),
              )
          );

        }
  }
class Task{
  String caseVal;
  int recover;
  Color colorVal;

  Task(this.caseVal,this.recover,this.colorVal);
}




