// To parse this JSON data, do
//
//     final counterSevice = counterSeviceFromJson(jsonString);

import 'dart:convert';

List<CounterSevice> counterSeviceFromJson(String str) => List<CounterSevice>.from(json.decode(str).map((x) => CounterSevice.fromJson(x)));

String counterSeviceToJson(List<CounterSevice> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CounterSevice {
  CounterSevice({
  this.country,
  this.cases,
  this.todayCases,
  this.deaths,
  this.todayDeaths,
  this.recovered,
  this.active,
  this.critical,
  this.casesPerOneMillion,
  this.deathsPerOneMillion,
  this.totalTests,
  this.testsPerOneMillion,
  });

  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int totalTests;
  int testsPerOneMillion;

  factory CounterSevice.fromJson( Map<String, dynamic>json) => CounterSevice(
    country: json["country"],
    cases: json["cases"],
    todayCases: json["todayCases"],
    deaths: json["deaths"],
    todayDeaths: json["todayDeaths"],
    recovered: json["recovered"],
    active: json["active"],
    critical: json["critical"],
    casesPerOneMillion: json["casesPerOneMillion"],
    deathsPerOneMillion: json["deathsPerOneMillion"],
    totalTests: json["totalTests"],
    testsPerOneMillion: json["testsPerOneMillion"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "cases": cases,
    "todayCases": todayCases,
    "deaths": deaths,
    "todayDeaths": todayDeaths,
    "recovered": recovered,
    "active": active,
    "critical": critical,
    "casesPerOneMillion": casesPerOneMillion,
    "deathsPerOneMillion": deathsPerOneMillion,
    "totalTests": totalTests,
    "testsPerOneMillion": testsPerOneMillion,
  };
}
