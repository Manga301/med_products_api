import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future<dynamic> getProductData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );

    String data = response.body;
    var decodedData = jsonDecode(data);

    if (response.statusCode == 200) {
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
