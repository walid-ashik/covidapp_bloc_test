import 'package:flutter_covidapp_bloc_test/data/api_service.dart';
import 'package:flutter_covidapp_bloc_test/data/models/country.dart';
import 'package:flutter_covidapp_bloc_test/data/models/global.dart';

abstract class CovidRepository {
  Future<Global> fetchGlobalData();
  Future<Country> fetchCountryData({required String countryName});
}

class Repository implements CovidRepository {

  final _apiService = ApiService();

  @override
  Future<Country> fetchCountryData({required String countryName}) {
    throw UnimplementedError();
  }

  @override
  Future<Global> fetchGlobalData() async {
    return _apiService.fetchGlobalData();
  }


}