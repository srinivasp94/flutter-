import 'dart:convert';

class Promos {
  int prmId;
  int prmMerchantNo;
  String prmName;
  String prmShortDescription;
  String prmLongDescription;
  String prmMoreDetails;
  int prmImage;
  int prmTargetedOption;
  int prmSegmentId;
  int prmCoalitionId;
  int prmRewardCurrency;
  double prmRewardUnits;
  int prmExpiryOption;
  String prmExpiryDate;
  int prmClaimExpiryDays;
  int prmMaxResponses;
  String prmUserAction;
  String prmBroadcastOption;
  int prmNumPromotes;
  int prmNumResponses;
  int prmNumViews;
  String prmSmsContent;
  String prmEmailSubject;
  String prmEmailContent;
  String prmImagePath;
  List<Null> links;

  Promos(
      {this.prmId,
        this.prmMerchantNo,
        this.prmName,
        this.prmShortDescription,
        this.prmLongDescription,
        this.prmMoreDetails,
        this.prmImage,
        this.prmTargetedOption,
        this.prmSegmentId,
        this.prmCoalitionId,
        this.prmRewardCurrency,
        this.prmRewardUnits,
        this.prmExpiryOption,
        this.prmExpiryDate,
        this.prmClaimExpiryDays,
        this.prmMaxResponses,
        this.prmUserAction,
        this.prmBroadcastOption,
        this.prmNumPromotes,
        this.prmNumResponses,
        this.prmNumViews,
        this.prmSmsContent,
        this.prmEmailSubject,
        this.prmEmailContent,
        this.prmImagePath,
        this.links});

  Promos.fromJson(Map<String, dynamic> json) {
    prmId = json['prmId'];
    prmMerchantNo = json['prmMerchantNo'];
    prmName = json['prmName'];
    prmShortDescription = json['prmShortDescription'];
    prmLongDescription = json['prmLongDescription'];
    prmMoreDetails = json['prmMoreDetails'];
    prmImage = json['prmImage'];
    prmTargetedOption = json['prmTargetedOption'];
    prmSegmentId = json['prmSegmentId'];
    prmCoalitionId = json['prmCoalitionId'];
    prmRewardCurrency = json['prmRewardCurrency'];
    prmRewardUnits = json['prmRewardUnits'];
    prmExpiryOption = json['prmExpiryOption'];
    prmExpiryDate = json['prmExpiryDate'];
    prmClaimExpiryDays = json['prmClaimExpiryDays'];
    prmMaxResponses = json['prmMaxResponses'];
    prmUserAction = json['prmUserAction'];
    prmBroadcastOption = json['prmBroadcastOption'];
    prmNumPromotes = json['prmNumPromotes'];
    prmNumResponses = json['prmNumResponses'];
    prmNumViews = json['prmNumViews'];
    prmSmsContent = json['prmSmsContent'];
    prmEmailSubject = json['prmEmailSubject'];
    prmEmailContent = json['prmEmailContent'];
    prmImagePath = json['prmImagePath'];
  /*  if (json['links'] != null) {
      links = new List<Null>();
      json['links'].forEach((v) {
        links.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prmId'] = this.prmId;
    data['prmMerchantNo'] = this.prmMerchantNo;
    data['prmName'] = this.prmName;
    data['prmShortDescription'] = this.prmShortDescription;
    data['prmLongDescription'] = this.prmLongDescription;
    data['prmMoreDetails'] = this.prmMoreDetails;
    data['prmImage'] = this.prmImage;
    data['prmTargetedOption'] = this.prmTargetedOption;
    data['prmSegmentId'] = this.prmSegmentId;
    data['prmCoalitionId'] = this.prmCoalitionId;
    data['prmRewardCurrency'] = this.prmRewardCurrency;
    data['prmRewardUnits'] = this.prmRewardUnits;
    data['prmExpiryOption'] = this.prmExpiryOption;
    data['prmExpiryDate'] = this.prmExpiryDate;
    data['prmClaimExpiryDays'] = this.prmClaimExpiryDays;
    data['prmMaxResponses'] = this.prmMaxResponses;
    data['prmUserAction'] = this.prmUserAction;
    data['prmBroadcastOption'] = this.prmBroadcastOption;
    data['prmNumPromotes'] = this.prmNumPromotes;
    data['prmNumResponses'] = this.prmNumResponses;
    data['prmNumViews'] = this.prmNumViews;
    data['prmSmsContent'] = this.prmSmsContent;
    data['prmEmailSubject'] = this.prmEmailSubject;
    data['prmEmailContent'] = this.prmEmailContent;
    data['prmImagePath'] = this.prmImagePath;
    return data;
  }
}