class Task {
  final String text;
  bool isDone;

  Task({ required this.text, required this.isDone });

  String get getText => text;
  bool get getIsDone => isDone;

  void toggle(){
    isDone = !isDone;
  }
}
