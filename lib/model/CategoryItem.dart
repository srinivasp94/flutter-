class CategoryItem {
  int catProductNo;
  int catMerchantNo;
  String catProductCode;
  String catDescription;
  String catLongDescription;
  int catCategory;
  int catProductImage;
  int catRewardCurrencyId;
  double catNumPoints;
  int catPartialCashPaymentRequired;
  double catPartialCash;
  int catDeliveryType;
  String catProductImagePath;
  int catRedemptionType;
  int catRedemptionMerchant;
  String catMessageSpiel;
  int catAvailableStock;
  String catProductValues;
  String catLocationValues;
  int catCustomerType;
  String catCustomerTier;
  String catStartDate;
  String catEndDate;
  int catPasaRewardsEnabled;
  String catChannelValues;
  int catRedemptionVoucherExpiry;
  int catRedemptionVoucherExpiryDateAfter;
  String rwdCurrencyName;
  String merMerchantName;
  String catCategoryName;
  String catVoucherSpiel;
  int catType;
  int catSpecificationEnabled;
  List<Null> catalogueSpecificationSet;
  List<Null> links;
  String catExtReference;
  double catProductCost;
  String catRedemptionVoucherExpiryDate;

  CategoryItem(
      {this.catProductNo,
        this.catMerchantNo,
        this.catProductCode,
        this.catDescription,
        this.catLongDescription,
        this.catCategory,
        this.catProductImage,
        this.catRewardCurrencyId,
        this.catNumPoints,
        this.catPartialCashPaymentRequired,
        this.catPartialCash,
        this.catDeliveryType,
        this.catProductImagePath,
        this.catRedemptionType,
        this.catRedemptionMerchant,
        this.catMessageSpiel,
        this.catAvailableStock,
        this.catProductValues,
        this.catLocationValues,
        this.catCustomerType,
        this.catCustomerTier,
        this.catStartDate,
        this.catEndDate,
        this.catPasaRewardsEnabled,
        this.catChannelValues,
        this.catRedemptionVoucherExpiry,
        this.catRedemptionVoucherExpiryDateAfter,
        this.rwdCurrencyName,
        this.merMerchantName,
        this.catCategoryName,
        this.catVoucherSpiel,
        this.catType,
        this.catSpecificationEnabled,
        this.catalogueSpecificationSet,
        this.links,
        this.catExtReference,
        this.catProductCost,
        this.catRedemptionVoucherExpiryDate});

  CategoryItem.fromJson(Map<String, dynamic> json) {
    catProductNo = json['catProductNo'];
    catMerchantNo = json['catMerchantNo'];
    catProductCode = json['catProductCode'];
    catDescription = json['catDescription'];
    catLongDescription = json['catLongDescription'];
    catCategory = json['catCategory'];
    catProductImage = json['catProductImage'];
    catRewardCurrencyId = json['catRewardCurrencyId'];
    catNumPoints = json['catNumPoints'];
    catPartialCashPaymentRequired = json['catPartialCashPaymentRequired'];
    catPartialCash = json['catPartialCash'];
    catDeliveryType = json['catDeliveryType'];
    catProductImagePath = json['catProductImagePath'];
    catRedemptionType = json['catRedemptionType'];
    catRedemptionMerchant = json['catRedemptionMerchant'];
    catMessageSpiel = json['catMessageSpiel'];
    catAvailableStock = json['catAvailableStock'];
    catProductValues = json['catProductValues'];
    catLocationValues = json['catLocationValues'];
    catCustomerType = json['catCustomerType'];
    catCustomerTier = json['catCustomerTier'];
    catStartDate = json['catStartDate'];
    catEndDate = json['catEndDate'];
    catPasaRewardsEnabled = json['catPasaRewardsEnabled'];
    catChannelValues = json['catChannelValues'];
    catRedemptionVoucherExpiry = json['catRedemptionVoucherExpiry'];
    catRedemptionVoucherExpiryDateAfter =
    json['catRedemptionVoucherExpiryDateAfter'];
    rwdCurrencyName = json['rwdCurrencyName'];
    merMerchantName = json['merMerchantName'];
    catCategoryName = json['catCategoryName'];
    catVoucherSpiel = json['catVoucherSpiel'];
    catType = json['catType'];
    catSpecificationEnabled = json['catSpecificationEnabled'];
    if (json['catalogueSpecificationSet'] != null) {
      catalogueSpecificationSet = new List<Null>();
      json['catalogueSpecificationSet'].forEach((v) {
        // catalogueSpecificationSet.add(new Null.fromJson(v));
      });
    }
    if (json['links'] != null) {
      links = new List<Null>();
      json['links'].forEach((v) {
        // links.add(new Null.fromJson(v));
      });
    }
    catExtReference = json['catExtReference'];
    catProductCost = json['catProductCost'];
    catRedemptionVoucherExpiryDate = json['catRedemptionVoucherExpiryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catProductNo'] = this.catProductNo;
    data['catMerchantNo'] = this.catMerchantNo;
    data['catProductCode'] = this.catProductCode;
    data['catDescription'] = this.catDescription;
    data['catLongDescription'] = this.catLongDescription;
    data['catCategory'] = this.catCategory;
    data['catProductImage'] = this.catProductImage;
    data['catRewardCurrencyId'] = this.catRewardCurrencyId;
    data['catNumPoints'] = this.catNumPoints;
    data['catPartialCashPaymentRequired'] = this.catPartialCashPaymentRequired;
    data['catPartialCash'] = this.catPartialCash;
    data['catDeliveryType'] = this.catDeliveryType;
    data['catProductImagePath'] = this.catProductImagePath;
    data['catRedemptionType'] = this.catRedemptionType;
    data['catRedemptionMerchant'] = this.catRedemptionMerchant;
    data['catMessageSpiel'] = this.catMessageSpiel;
    data['catAvailableStock'] = this.catAvailableStock;
    data['catProductValues'] = this.catProductValues;
    data['catLocationValues'] = this.catLocationValues;
    data['catCustomerType'] = this.catCustomerType;
    data['catCustomerTier'] = this.catCustomerTier;
    data['catStartDate'] = this.catStartDate;
    data['catEndDate'] = this.catEndDate;
    data['catPasaRewardsEnabled'] = this.catPasaRewardsEnabled;
    data['catChannelValues'] = this.catChannelValues;
    data['catRedemptionVoucherExpiry'] = this.catRedemptionVoucherExpiry;
    data['catRedemptionVoucherExpiryDateAfter'] =
        this.catRedemptionVoucherExpiryDateAfter;
    data['rwdCurrencyName'] = this.rwdCurrencyName;
    data['merMerchantName'] = this.merMerchantName;
    data['catCategoryName'] = this.catCategoryName;
    data['catVoucherSpiel'] = this.catVoucherSpiel;
    data['catType'] = this.catType;
    data['catSpecificationEnabled'] = this.catSpecificationEnabled;
   /* if (this.catalogueSpecificationSet != null) {
      data['catalogueSpecificationSet'] =
          this.catalogueSpecificationSet.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.map((v) => v.toJson()).toList();
    }*/
    data['catExtReference'] = this.catExtReference;
    data['catProductCost'] = this.catProductCost;
    data['catRedemptionVoucherExpiryDate'] =
        this.catRedemptionVoucherExpiryDate;
    return data;
  }
}