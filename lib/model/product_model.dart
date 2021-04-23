class ProductModel {
  var productId;
  var productName;
  var productBrand;
  var productType;
  var productImage;

  bool isFavorite;

  ProductModel({
    this.productId,
    this.productName,
    this.productBrand,
    this.productType,
    this.productImage,
    this.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json['products'][0]['id'],
        productName: json['products'][0]['name'],
        productBrand: json['products'][0]['brand']['name'],
        productImage: json['products'][0]['image_url'],
        productType: json['products'][0]['product_type'],
      );

  Map<String, dynamic> toJson() => {
        'id': productId,
        'productName': productName,
        'productBrand': productBrand,
        'productImage': productImage,
        'productType': productType,
      };
}

// productList = productData['products'];
// productId = productData['products'][0]['id'];
// productName = productData['products'][0]['name'];
// productBrand = productData['products'][0]['brand']['name'];
// productType = productData['products'][0]['product_type'];
// productImage = productData['products'][0]['image_url'];
