import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String country;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;
  final int? casesPerOneMillion;
  final int? deathsPerOneMillion;
  final int? totalTests;
  final int? testsPerOneMillion;

  const Country(
      {required this.country,
      required this.cases,
      required this.todayCases,
      required this.deaths,
      required this.todayDeaths,
      required this.recovered,
      required this.active,
      required this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.totalTests,
      this.testsPerOneMillion});

  @override
  List<Object?> get props => [
        country,
        cases,
        todayCases,
        deaths,
        todayDeaths,
        recovered,
        active,
        critical,
        casesPerOneMillion,
        deathsPerOneMillion,
        totalTests,
        testsPerOneMillion
      ];

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        country: json['country'],
        cases: json['cases'],
        todayCases: json['todayCases'],
        deaths: json['deaths'],
        todayDeaths: json['todayDeaths'],
        recovered: json['recovered'],
        active: json['active'],
        critical: json['critical']);
  }
}
