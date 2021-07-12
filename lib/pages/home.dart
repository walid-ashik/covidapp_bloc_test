import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_covidapp_bloc_test/bloc/global_bloc.dart';

class Home extends StatefulWidget {
  const Home({required Key key}): super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    BlocProvider.of<GlobalBloc>(context).add(const GetGlobalData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Global Data"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: BlocConsumer<GlobalBloc, GlobalState>(
            listener: (context, state) {
              if (state is GlobalError) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is GlobalInitial) {
                return const Center(child: Text("initial"));
              }
              if (state is GlobalLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                      key: Key("loading global"),
                    ));
              }
              if (state is GlobalDataLoaded) {
                return Column(
                  children: [
                    Text("cases: ${state.global.cases}"),
                    const SizedBox(height: 8),
                    Text("deaths: ${state.global.deaths}"),
                    const SizedBox(height: 8),
                    Text("recovered: ${state.global.recovered}"),
                  ],
                );
              }
              return const Center(child: Text("No state"));
            },
          ),
        ));
  }
}
