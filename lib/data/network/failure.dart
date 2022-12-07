class Failure {
  late int code; // 200 or 400
  late String message; // error or success

  Failure(this.code, this.message);
}
