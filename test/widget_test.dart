// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_covidapp_bloc_test/bloc/global_bloc.dart';
import 'package:flutter_covidapp_bloc_test/data/covid_repository.dart';
import 'package:flutter_covidapp_bloc_test/data/models/global.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGlobalBloc extends MockBloc<GlobalEvent, GlobalState>
    implements GlobalBloc {}

class MockRepository extends Mock implements CovidRepository {}

void main() {
  final globalBloc = MockGlobalBloc();
  MockRepository mRepo;

  setUp(() {
    mRepo = MockRepository();
    // const global = Global(cases: 2342, deaths: 3242, recovered: 2342);
    //
    // test("testing", () {
    //   when(mockRepository.fetchGlobalData()).thenAnswer((_) => global);
    // });

    // blocTest<GlobalBloc, GlobalState>(
    //     "emits GlobalError when nothing is added",
    //     build: ()  {
    //       when(mockRepository.fetchGlobalData()).thenAnswer((_) async => global);
    //       return null;
    //     },
    //     expect: () => const GlobalError("repository is null"));
  });

  // group("global", () {
  //   when(const mRepo.fetchGlobalData()).thenAnswer((_) async => const Global(cases: 234, deaths: 234, recovered: 234));
  // });
  //
  // blocTest("bloc test",
  //     build: () {
  //   when(mRepo.fetchGlobalData()).thenAnswer((_) => const Global(cases: 1, deaths: 1, recovered: 1));
  //   return GlobalBloc(mRepo);
  // });
  // whenListen(globalBloc, Stream.fromIterable([]));
}
