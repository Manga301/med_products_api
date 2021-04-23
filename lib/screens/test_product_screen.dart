import 'package:flutter/material.dart';

class TestProductScreen extends StatefulWidget {
  final productOverviewData;

  TestProductScreen({this.productOverviewData});

  @override
  _TestOverviewScreenState createState() => _TestOverviewScreenState();
}

class _TestOverviewScreenState extends State<TestProductScreen> {
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
    print(widget.productOverviewData);
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
                        productBrand,
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
                    productImage,
                    width: 50,
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: Column(
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        productType,
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
