class TrendingProductResponse {
  String slNo;
  String productName;
  String shortDetails;
  String productDescription;
  int availableStock;
  int orderQty;
  int salesQty;
  int orderAmount;
  int salesAmount;
  int discountPercent;
  int discountAmount;
  int unitPrice;
  String productImage;
  String sellerName;
  String sellerProfilePhoto;
  String sellerCoverPhoto;
  String ezShopName;
  int defaultPushScore;
  String myProductVarId;

  TrendingProductResponse(
      {this.slNo,
        this.productName,
        this.shortDetails,
        this.productDescription,
        this.availableStock,
        this.orderQty,
        this.salesQty,
        this.orderAmount,
        this.salesAmount,
        this.discountPercent,
        this.discountAmount,
        this.unitPrice,
        this.productImage,
        this.sellerName,
        this.sellerProfilePhoto,
        this.sellerCoverPhoto,
        this.ezShopName,
        this.defaultPushScore,
        this.myProductVarId});

  TrendingProductResponse.fromJson(Map<String, dynamic> json) {
    slNo = json['slNo'];
    productName = json['productName'];
    shortDetails = json['shortDetails'];
    productDescription = json['productDescription'];
    availableStock = json['availableStock'];
    orderQty = json['orderQty'];
    salesQty = json['salesQty'];
    orderAmount = json['orderAmount'];
    salesAmount = json['salesAmount'];
    discountPercent = json['discountPercent'];
    discountAmount = json['discountAmount'];
    unitPrice = json['unitPrice'];
    productImage = json['productImage'];
    sellerName = json['sellerName'];
    sellerProfilePhoto = json['sellerProfilePhoto'];
    sellerCoverPhoto = json['sellerCoverPhoto'];
    ezShopName = json['ezShopName'];
    defaultPushScore = json['defaultPushScore'];
    myProductVarId = json['myProductVarId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slNo'] = this.slNo;
    data['productName'] = this.productName;
    data['shortDetails'] = this.shortDetails;
    data['productDescription'] = this.productDescription;
    data['availableStock'] = this.availableStock;
    data['orderQty'] = this.orderQty;
    data['salesQty'] = this.salesQty;
    data['orderAmount'] = this.orderAmount;
    data['salesAmount'] = this.salesAmount;
    data['discountPercent'] = this.discountPercent;
    data['discountAmount'] = this.discountAmount;
    data['unitPrice'] = this.unitPrice;
    data['productImage'] = this.productImage;
    data['sellerName'] = this.sellerName;
    data['sellerProfilePhoto'] = this.sellerProfilePhoto;
    data['sellerCoverPhoto'] = this.sellerCoverPhoto;
    data['ezShopName'] = this.ezShopName;
    data['defaultPushScore'] = this.defaultPushScore;
    data['myProductVarId'] = this.myProductVarId;
    return data;
  }
}