import 'package:bloctest/bloc_examples/stream_counter_bloc/counter_stream.dart';
import "package:flutter/material.dart";

class IncrementCounter extends StatefulWidget {
  const IncrementCounter({super.key});
  @override
  State<IncrementCounter> createState() => _IncrementCounterState();
}

class _IncrementCounterState extends State<IncrementCounter> {
  final counterBlc = CounterBloc();
  @override
  void dispose() {
    counterBlc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Stream Counter",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: StreamBuilder(
          initialData: 0,
          stream: counterBlc.stateStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Display a loading indicator while waiting for data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 24, color: Colors.black),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            counterBlc.eventSink.add(CounterAction.increment);
          },
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )),
    );
  }
}
