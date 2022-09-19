class Task {
  final String? text;
  bool isDone;

  Task({ required this.text, required this.isDone });

  String? get getText => text;
  bool get getIsDone => isDone;

  void toggle(){
    isDone = !isDone;
  }

  Map toJson() => {
    'text': text,
    'isDone': isDone
  };

  Task.fromMap(Map map) :
        text = map['text'] as String,
        isDone = map['isDone'] as bool;


  Map toMap() {
    return {
      'text' : text,
      'isDone' : isDone,
    };
  }
}
