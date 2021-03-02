import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virus/Service/network.dart';
import 'package:virus/pannels/data.dart';

class CountriesData extends StatefulWidget {
  @override
  _CountriesDataState createState() => _CountriesDataState();
}

class _CountriesDataState extends State<CountriesData> {
  var countryData;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchCountry(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            countryData = snapshot.data;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                ),
                itemCount: countryData.length,
                itemBuilder: (BuildContext context, int index) {
                 return _countryList(index);

                }
            );
          }
          else if (snapshot.hasError) {
            return Center(
              child: Text("No Data Found "),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  _countryList(index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ CountryPannel(
          countryname: countryData[index].country.toString(),
          titleColor: Colors.black,
          cases: "Cases : " + countryData[index].cases.toString(),
          countColor: Colors.black,
          today: "Today Cases : " +
              countryData[index].todayCases.toString(),
          deathstotal: "Deaths : " + countryData[index].deaths.toString(),
          todaydeath: "Today Deaths : " +
              countryData[index].todayDeaths.toString(),
          recovered: 'Recovered : ' +
              countryData[index].recovered.toString(),
          active: "Active Cases : " + countryData[index].active.toString(),
          deathColor: Colors.white,
        ),
        ]);
  }
}