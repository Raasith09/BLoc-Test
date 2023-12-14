import "package:bloctest/bloc_examples/cubit/counter_cubits_dart_cubit.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class MyCount extends StatefulWidget {
  const MyCount({super.key});

  @override
  State<MyCount> createState() => _MyCountState();
}

class _MyCountState extends State<MyCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Counter Cubic",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("You have pushed the button this times :"),
            const SizedBox(height: 24),
            BlocBuilder<CounterCubitsDartCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: const TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                );
              },
            ),
            const SizedBox(height: 34),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    iconSize: 60,
                    color: Colors.purple,
                    onPressed: () {
                      BlocProvider.of<CounterCubitsDartCubit>(context)
                          .decrement();
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    iconSize: 60,
                    color: Colors.purple,
                    onPressed: () {
                      BlocProvider.of<CounterCubitsDartCubit>(context)
                          .increment();
                    },
                    icon: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
