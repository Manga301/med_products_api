import 'package:flutter/material.dart';
import 'package:med_store_app/services/networking.dart';

class ProductOverviewScreen extends StatefulWidget {
  final productOverviewData;

  ProductOverviewScreen({this.productOverviewData});

  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var productId;
  var productName;
  var productBrand;
  var productType;
  var productImage;
  List productList;
  bool isFavorite;

  @override
  void initState() {
    updateUI(widget.productOverviewData);
    super.initState();
  }

  void updateUI(dynamic productData) {
    productList = productData['products'];
    productId = productData['products'][0]['id'];
    productName = productData['products'][0]['name'];
    productBrand = productData['products'][0]['brand']['name'];
    productType = productData['products'][0]['product_type'];
    productImage = productData['products'][0]['image_url'];
    print(productId);
  }

  // toggle favorite product
  void toggleIcon() {
    isFavorite = !isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Overview'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                header: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productList[index]['brand']['name'],
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      IconButton(
                        color: Theme.of(context).accentColor,
                        icon: Icon(
                          Icons.favorite_border,
                          color: Theme.of(context).accentColor,
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
                child: Container(
                  width: 60,
                  child: Image.network(
                    productList[index]['image_url'],
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: Column(
                    children: [
                      Text(
                        productList[index]['name'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        productList[index]['product_type'],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
