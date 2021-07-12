import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_covidapp_bloc_test/bloc/bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGlobalBloc extends MockBloc<GlobalEvent, GlobalState> implements GlobalBloc {}
class FakeGlobalEvent extends Fake implements GlobalEvent {}
class FakeGlobalState extends Fake implements GlobalState {}

void main() {
  MockGlobalBloc mockGlobalBloc = MockGlobalBloc();

  setUpAll(() {
    registerFallbackValue<GlobalEvent>(FakeGlobalEvent());
    registerFallbackValue<GlobalState>(FakeGlobalState());
  });

  test("Global Bloc Test", () {
    whenListen(mockGlobalBloc, Stream.fromIterable([const GlobalInitial(),const GlobalLoading()]));
    expectLater(mockGlobalBloc, emitsInOrder([const GlobalInitial(), const GlobalLoading()]));
  });
}