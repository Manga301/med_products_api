import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:med_store_app/model/product_model.dart';

class TestNetwork {
  final String url;

  TestNetwork(this.url);

  Future<List<ProductModel>> getProductData() async {
    //List<ProductModel> productListData;
    http.Response response = await http.get(
      Uri.parse(url),
    );

    String data = response.body;
    var decodedData = jsonDecode(data);
    var list = decodedData as List;

    List<ProductModel> products =
        list.map((prodData) => ProductModel.fromJson(prodData)).toList();

    return products;
    //
    // if (response.statusCode == 200) {
    //   String data = response.body;
    //   var decodedData = jsonDecode(data);
    //   return decodedData;
    // } else {
    //   print(response.statusCode);
    // }
  }
}
