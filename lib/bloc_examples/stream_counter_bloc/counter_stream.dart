import 'dart:async';

enum CounterAction { increment, decrement, reset }

class CounterBloc {
  late int countNum;
  // => State  Stream
  final _stateStreamController = StreamController<int>();
  StreamSink<int> get stateSink => _stateStreamController.sink; //What goes in
  Stream<int> get stateStream => _stateStreamController.stream; //What goes out

  // => Event  Stream
  final _eventStreamController = StreamController<CounterAction>();
  StreamSink get eventSink => _eventStreamController.sink; //What goes in
  Stream get eventStream => _eventStreamController.stream; //What goes out

  CounterBloc() {
    countNum = 0;
    eventStream.listen((event) {
      if (event == CounterAction.increment) {
        countNum++;
        stateSink.add(countNum);
      } else if (event == CounterAction.decrement) {
        countNum--;
        stateSink.add(countNum);
      } else if (event == CounterAction.reset) {
        countNum = 0;
        stateSink.add(countNum);
      }
    });
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}


/*You can add up to multiple listener in stream controlle but below that is a single subscription 
so it doesnt have multiple listener,if you want multiple listener you should make your controller 
with .broadcast.*/

//  final _stateStreamController = StreamController<int>.broadcast()


//For API fetch and listen

// class API_Manager {
//   Future<NewsModel> getNews() async {
//     var client = http.Client();
//     var newsModel;

//     try {
//       var response = await client.get(Strings.news_url);
//       if (response.statusCode == 200) {
//         var jsonString = response.body;
//         var jsonMap = json.decode(jsonString);

//         newsModel = NewsModel.fromJson(jsonMap);
//       }
//     } catch (Exception) {
//       return newsModel;
//     }

//     return newsModel;
//   }
// }