import 'package:http/http.dart';

class DBManager {

  String hostname;

  DBManager() {
    this.hostname = '192.168.1.10:8000';
  }

  Future<Response> getInfo() async {
    return await post(Uri.http(this.hostname, 'requests'));
  }

}