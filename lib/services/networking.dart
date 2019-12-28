import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper {

  NetworkingHelper(this.url);
  final String url;

  Future GetData() async {

    http.Response response = await http.get(url);
    print(response.statusCode);
    if(response.statusCode == 200) {

      String data = response.body;
      var decodedData = jsonDecode(data);

      return decodedData;
  } else {
      print(response.statusCode);
    }

}
}