import 'package:flutter/material.dart';
import 'screens/product_overview.dart';
import 'services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(
      MaterialApp(
        title: 'Med Store',
        home: LoadingScreen(),
      ),
    );

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    getProductData();
    super.initState();
  }

  void getProductData() async {
    NetworkHelper networkHelper =
        NetworkHelper('https://dev.busymed.com/api/products_top_20');
    var productData = await networkHelper.getProductData();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ProductOverviewScreen(productOverviewData: productData);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const SpinKitRotatingCircle(
          color: Colors.blue,
          size: 100.0,
        ),
      ),
    );
  }
}
