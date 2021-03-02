import 'dart:convert';
import 'package:charts_flutter/flutter.dart'as charts;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:virus/Service/services.dart';
import 'package:http/http.dart' as http;
class Charts extends StatefulWidget {
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
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
    seriesPieData=List<charts.Series<Task,String>>();
    futureData = fetchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       child:  FutureBuilder<Services>(
        future: futureData,
        builder: (context, snapshot)
    {
      if (snapshot.hasData) {
        var pieData = [
          new Task("Total Cases",snapshot.data.cases,Colors.yellow),
          new Task("Total recover",snapshot.data.recovered,Colors.green),
          new Task("Total Deaths",snapshot.data.deaths,Colors.red)
        ];
        seriesPieData.add(
          charts.Series(
            data: pieData,
            domainFn: (Task rate,_)=>rate.name,
            measureFn: (Task rate,_)=>rate.count,
            colorFn: (Task rate,_)=>
                charts.ColorUtil.fromDartColor(rate.colorVal),
            id: 'Daily Chart',
            labelAccessorFn: (Task row,_)=>'${row.count}',
          ),
        );
        return  Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
          ),
        );
      }else{
        return Center(child: CircularProgressIndicator());
      }
    }
     ),
     ),
    );
  }
}
  class Task{
  String name;
  int count;
  Color colorVal;

  Task(this.name,this.count,this.colorVal);
  }


