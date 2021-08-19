class CardBalance {
  double rwdBalance;
  String rwdName;
  int rwdCurrencyId;
  double cashbackValue;

  CardBalance({this.rwdBalance, this.rwdName, this.rwdCurrencyId, this.cashbackValue});

  CardBalance.fromJson(Map<String, dynamic> json) {
    rwdBalance = json['rwd_balance'];
    rwdName = json['rwd_name'];
    rwdCurrencyId = json['rwd_currency_id'];
    cashbackValue = json['cashback_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rwd_balance'] = this.rwdBalance;
    data['rwd_name'] = this.rwdName;
    data['rwd_currency_id'] = this.rwdCurrencyId;
    data['cashback_value'] = this.cashbackValue;
    return data;
  }
}