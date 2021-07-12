import 'package:equatable/equatable.dart';

class Global extends Equatable {
  final int cases;
  final int deaths;
  final int recovered;

  const Global({required this.cases, required this.deaths, required this.recovered});

  @override
  List<Object?> get props => [cases, deaths, recovered];

  factory Global.fromJson(Map<String, dynamic> json) {
    return Global(cases: json['cases'], deaths: json['deaths'], recovered: json['recovered']);
  }
}
