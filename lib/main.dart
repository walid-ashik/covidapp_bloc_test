import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covidapp_bloc_test/bloc/global_bloc.dart';
import 'package:flutter_covidapp_bloc_test/pages/home.dart';
import 'package:flutter_covidapp_bloc_test/routes.dart';
import 'package:bloc/bloc.dart';
import 'data/covid_repository.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    repository: Repository(),
  ));
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  final Repository repository;

  const MyApp({
    Key? key,
    required this.appRouter,
    required this.repository,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GlobalBloc>(
          create: (BuildContext context) => GlobalBloc(widget.repository),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        onGenerateRoute: widget.appRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        title: 'Covid App',
        theme: ThemeData(
            primarySwatch: Colors.grey,
            primaryColor: Colors.black,
            brightness: Brightness.light),
        home: const Home(key: Key("homepage")),
      ),
    );
  }
}
