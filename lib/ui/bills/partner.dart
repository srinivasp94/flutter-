class Partner {
  int remNo;
  String remName;
  int remCategory;
  String remContactEmail;
  String remContactMobile;
  String remVoucherPrefix;
  int remStatus;
  int remSettlementType;
  String remCode;
  int remType;
  int remSettlementLevel;
  int remSettlementFrequency;

  /* List<RedemptionMerchantLocations> redemptionMerchantLocations;
  List<Null> links;*/
  String remAddress;
  String remBranchAddress;

  Partner(
      {this.remNo,
      this.remName,
      this.remCategory,
      this.remContactEmail,
      this.remContactMobile,
      this.remVoucherPrefix,
      this.remStatus,
      this.remSettlementType,
      this.remCode,
      this.remType,
      this.remSettlementLevel,
      this.remSettlementFrequency,
      /*  this.redemptionMerchantLocations,
      this.links,*/
      this.remAddress,
      this.remBranchAddress});

  Partner.fromJson(Map<String, dynamic> json) {
    remNo = json['remNo'];
    remName = json['remName'];
    remCategory = json['remCategory'];
    remContactEmail = json['remContactEmail'];
    remContactMobile = json['remContactMobile'];
    remVoucherPrefix = json['remVoucherPrefix'];
    remStatus = json['remStatus'];
    remSettlementType = json['remSettlementType'];
    remCode = json['remCode'];
    remType = json['remType'];
    remSettlementLevel = json['remSettlementLevel'];
    remSettlementFrequency = json['remSettlementFrequency'];

    /*if (json['redemptionMerchantLocations'] != null) {
      redemptionMerchantLocations = new List<RedemptionMerchantLocations>();
      json['redemptionMerchantLocations'].forEach((v) {
        redemptionMerchantLocations
            .add(new RedemptionMerchantLocations.fromJson(v));
      });
    }
    if (json['links'] != null) {
      links = new List<Null>();
      json['links'].forEach((v) {
        links.add(new Null.fromJson(v));
      });
    }*/
    remAddress = json['remAddress'];
    remBranchAddress = json['remBranchAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remNo'] = this.remNo;
    data['remName'] = this.remName;
    data['remCategory'] = this.remCategory;
    data['remContactEmail'] = this.remContactEmail;
    data['remContactMobile'] = this.remContactMobile;
    data['remVoucherPrefix'] = this.remVoucherPrefix;
    data['remStatus'] = this.remStatus;
    data['remSettlementType'] = this.remSettlementType;
    data['remCode'] = this.remCode;
    data['remType'] = this.remType;
    data['remSettlementLevel'] = this.remSettlementLevel;
    data['remSettlementFrequency'] = this.remSettlementFrequency;
  /*  if (this.redemptionMerchantLocations != null) {
      data['redemptionMerchantLocations'] =
          this.redemptionMerchantLocations.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links.map((v) => v.toJson()).toList();
    }*/
    data['remAddress'] = this.remAddress;
    data['remBranchAddress'] = this.remBranchAddress;
    return data;
  }
}

class RedemptionMerchantLocations {
  int createdAt;
  String createdBy;
  String updatedAt;
  String updatedBy;
  int rmlId;
  int rmlMerNo;
  String rmlLocation;

  RedemptionMerchantLocations(
      {this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.rmlId,
      this.rmlMerNo,
      this.rmlLocation});

  RedemptionMerchantLocations.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
    rmlId = json['rmlId'];
    rmlMerNo = json['rmlMerNo'];
    rmlLocation = json['rmlLocation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
    data['rmlId'] = this.rmlId;
    data['rmlMerNo'] = this.rmlMerNo;
    data['rmlLocation'] = this.rmlLocation;
    return data;
  }
}
