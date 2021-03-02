import 'dart:convert';
import 'dart:ui';
 // import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:virus/pages/preventpage.dart';
import 'package:virus/pannels/data.dart';
import 'Service/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget space=SizedBox(height: 5,);
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          FutureBuilder<Services>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(children: [Column(children: [
                Container(
                width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4,
              child: ListView(
              scrollDirection:Axis.horizontal,
              children:<Widget> [
              FIrstpannel(
              title: "Total Cases",
              textColor: Colors.white,
              countColor:Colors.black,
              count: snapshot.data.cases.toString(),
              ),
              space,
              FIrstpannel(
              title: "Total Deaths",
              textColor: Colors.white,
              countColor: Colors.black,
              count: snapshot.data.deaths.toString(),
              ),space,
              FIrstpannel(
              title: "Recovered",
              textColor: Colors.white,
              countColor: Colors.black,
              count: snapshot.data.recovered.toString(),
              )
              ],
              ),
              ),
              Container(
              child: Container(
                child: PreventPage(),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/2,
              )
              ),

              ]),
                ]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return Center(child: CircularProgressIndicator(backgroundColor: Color(0xFFaf4448),));
            },
          ),
        ],

      );
  }
}
