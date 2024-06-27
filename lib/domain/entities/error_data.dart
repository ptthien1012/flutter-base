class ErrorData {
  ErrorData({this.messages});
  final String? messages;

  //To String
  @override
  String toString() {
    return 'Error{messages: $messages}';
  }
}
