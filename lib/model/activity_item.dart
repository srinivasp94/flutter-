class ActivityItem {
  int cuaId;
  int cuaMerchantNo;
  String cuaLoyaltyId;
  int cuaActivityType;
  String cuaDate;
  String cuaTime;
  String cuaRemarks;
  String cuaParams;
  List<Null> links;

  ActivityItem(
      {this.cuaId,
        this.cuaMerchantNo,
        this.cuaLoyaltyId,
        this.cuaActivityType,
        this.cuaDate,
        this.cuaTime,
        this.cuaRemarks,
        this.cuaParams,
        this.links});

  ActivityItem.fromJson(Map<String, dynamic> json) {
    cuaId = json['cuaId'];
    cuaMerchantNo = json['cuaMerchantNo'];
    cuaLoyaltyId = json['cuaLoyaltyId'];
    cuaActivityType = json['cuaActivityType'];
    cuaDate = json['cuaDate'];
    cuaTime = json['cuaTime'];
    cuaRemarks = json['cuaRemarks'];
    cuaParams = json['cuaParams'];
   /* if (json['links'] != null) {
      links = new List<Null>();
      json['links'].forEach((v) {
        links.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cuaId'] = this.cuaId;
    data['cuaMerchantNo'] = this.cuaMerchantNo;
    data['cuaLoyaltyId'] = this.cuaLoyaltyId;
    data['cuaActivityType'] = this.cuaActivityType;
    data['cuaDate'] = this.cuaDate;
    data['cuaTime'] = this.cuaTime;
    data['cuaRemarks'] = this.cuaRemarks;
    data['cuaParams'] = this.cuaParams;
   /* if (this.links != null) {
      data['links'] = this.links.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}
