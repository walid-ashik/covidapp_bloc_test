import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_covidapp_bloc_test/bloc/bloc.dart';
import 'package:flutter_covidapp_bloc_test/data/api_service.dart';
import 'package:flutter_covidapp_bloc_test/data/covid_repository.dart';
import 'package:flutter_covidapp_bloc_test/data/models/global.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCovidRepository extends Mock implements Repository {}

void main() {
  MockCovidRepository mockCovidRepository = MockCovidRepository();

  setUp(() {});

  group("Get Global Data", () {
    const global = Global(cases: 1, deaths: 1, recovered: 1);

    blocTest<GlobalBloc, GlobalState>("emits success states",
        build: () {
          when(mockCovidRepository.fetchGlobalData)
              .thenAnswer((invocation) async => global);
          return GlobalBloc(mockCovidRepository);
        },
        act: (bloc) => bloc.add(const GetGlobalData()),
        expect: () => [const GlobalLoading(), const GlobalDataLoaded(global)]);

    blocTest<GlobalBloc, GlobalState>(
      "emits No Internet states",
      build: () {
        when(mockCovidRepository.fetchGlobalData).thenThrow(InvalidFormatException);
        return GlobalBloc(mockCovidRepository);
      },
      act:(bloc) => bloc.add(const GetGlobalData()),
      expect: () => [const GlobalLoading(), const GlobalError("message")]
    );
  });
}
