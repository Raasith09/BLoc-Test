import 'package:bloctest/bloc_examples/cubit/counter_cubits_dart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_examples/cubit/cubit_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubitsDartCubit>(
      lazy: false,
      create: (context) => CounterCubitsDartCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
//Sub-Tree
        home: const MyCount(),
      ),
    );
  }
}
//Bloc Provider will provide instance of a bloc to the subtree below of it.
