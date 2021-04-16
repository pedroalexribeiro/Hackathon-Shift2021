import 'package:http/http.dart';

class DBManager {

  DBManager() {

  }

  Future<Response> getInfo() async {
    return await get(Uri.https('127.0.0.1', 'requests'));
  }

}