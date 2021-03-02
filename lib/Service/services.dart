import 'dart:convert';

List<Services> welcomeFromJson(String str) => List<Services>.from(json.decode(str).map((x) => Services.fromJson(x)));

String welcomeToJson(List<Services> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Services {
  Services({
    this.country,
    this.todayCases,
    this.todayDeaths,
    this.cases,
    this.deaths,
    this.recovered,
  });
  String country;
  int todayCases;
  int todayDeaths;
  int cases;
  int deaths;
  int recovered;

  factory Services.fromJson(Map<String, dynamic> json) => Services(
    cases: json["cases"],
    deaths: json["deaths"],
    recovered: json["recovered"],
    country: json["country"],
    todayCases: json["todayCases"],
    todayDeaths: json["todayDeaths"]
  );

  Map<String, dynamic> toJson() => {
    "cases": cases,
    "deaths": deaths,
    "recovered": recovered,
    "country":country,
    "todayCases":todayCases,
    "todayDeaths":todayDeaths
  };
}