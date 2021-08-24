class ReferralItem {
  int csrId;
  int csrMerchantNo;
  String csrLoyaltyId;
  String csrFName;
  String csrRefName;
  String csrRefMobile;
  String csrRefEmail;
  int csrRefStatus;
  String csrRefAddress;
  int csrUserNo;
  String csrProduct;
  int csrLocation;
  Null productName;
  String csrRefNo;
  Null csrUserFName;
  Null csrLocationName;
  String csrRefMobileCountryCode;
  Null csrRefCompany;
  Null csrRefCity;
  bool csrPushed;
  int csrPushErrCount;
  Null csrPushResponse;
  Null cusRefAttrs;
  List<Null> links;

  ReferralItem(
      {this.csrId,
        this.csrMerchantNo,
        this.csrLoyaltyId,
        this.csrFName,
        this.csrRefName,
        this.csrRefMobile,
        this.csrRefEmail,
        this.csrRefStatus,
        this.csrRefAddress,
        this.csrUserNo,
        this.csrProduct,
        this.csrLocation,
        this.productName,
        this.csrRefNo,
        this.csrUserFName,
        this.csrLocationName,
        this.csrRefMobileCountryCode,
        this.csrRefCompany,
        this.csrRefCity,
        this.csrPushed,
        this.csrPushErrCount,
        this.csrPushResponse,
        this.cusRefAttrs,
        this.links});

  ReferralItem.fromJson(Map<String, dynamic> json) {
    csrId = json['csrId'];
    csrMerchantNo = json['csrMerchantNo'];
    csrLoyaltyId = json['csrLoyaltyId'];
    csrFName = json['csrFName'];
    csrRefName = json['csrRefName'];
    csrRefMobile = json['csrRefMobile'];
    csrRefEmail = json['csrRefEmail'];
    csrRefStatus = json['csrRefStatus'];
    csrRefAddress = json['csrRefAddress'];
    csrUserNo = json['csrUserNo'];
    csrProduct = json['csrProduct'];
    csrLocation = json['csrLocation'];
    productName = json['productName'];
    csrRefNo = json['csrRefNo'];
    csrUserFName = json['csrUserFName'];
    csrLocationName = json['csrLocationName'];
    csrRefMobileCountryCode = json['csrRefMobileCountryCode'];
    csrRefCompany = json['csrRefCompany'];
    csrRefCity = json['csrRefCity'];
    csrPushed = json['csrPushed'];
    csrPushErrCount = json['csrPushErrCount'];
    csrPushResponse = json['csrPushResponse'];
    cusRefAttrs = json['cusRefAttrs'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['csrId'] = this.csrId;
    data['csrMerchantNo'] = this.csrMerchantNo;
    data['csrLoyaltyId'] = this.csrLoyaltyId;
    data['csrFName'] = this.csrFName;
    data['csrRefName'] = this.csrRefName;
    data['csrRefMobile'] = this.csrRefMobile;
    data['csrRefEmail'] = this.csrRefEmail;
    data['csrRefStatus'] = this.csrRefStatus;
    data['csrRefAddress'] = this.csrRefAddress;
    data['csrUserNo'] = this.csrUserNo;
    data['csrProduct'] = this.csrProduct;
    data['csrLocation'] = this.csrLocation;
    data['productName'] = this.productName;
    data['csrRefNo'] = this.csrRefNo;
    data['csrUserFName'] = this.csrUserFName;
    data['csrLocationName'] = this.csrLocationName;
    data['csrRefMobileCountryCode'] = this.csrRefMobileCountryCode;
    data['csrRefCompany'] = this.csrRefCompany;
    data['csrRefCity'] = this.csrRefCity;
    data['csrPushed'] = this.csrPushed;
    data['csrPushErrCount'] = this.csrPushErrCount;
    data['csrPushResponse'] = this.csrPushResponse;
    data['cusRefAttrs'] = this.cusRefAttrs;

    return data;
  }

}