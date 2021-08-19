class LoginUser {
  int usrUserNo;
  String usrLoginId;
  String usrMobile;
  String usrFName;
  String usrLName;
  int usrStatus;
  int usrProfilePic;
  String profilePic;
  int usrLocation;
  String merchantName;
  int usrMerchantNo;
  String usrPassword;
  int usrUserType;
  int usrThirdPartyVendorNo;
  int usrRegisterStatus;
  String merchantLogo;

  LoginUser({this.usrUserNo,
    this.usrLoginId,
    this.usrMobile,
    this.usrFName,
    this.usrLName,
    this.usrStatus,
    this.usrProfilePic,
    this.profilePic,
    this.usrLocation,
    this.merchantName,
    this.usrMerchantNo,
    this.usrPassword,
    this.usrUserType,
    this.usrThirdPartyVendorNo,
    this.usrRegisterStatus,
    this.merchantLogo});

  LoginUser.fromJson(Map<String, dynamic> json) {
    usrUserNo = json['usrUserNo'];
    usrLoginId = json['usrLoginId'];
    usrMobile = json['usrMobile'];
    usrFName = json['usrFName'];
    usrLName = json['usrLName'];
    usrStatus = json['usrStatus'];
    usrProfilePic = json['usrProfilePic'];
    profilePic = json['profilePic'];
    usrLocation = json['usrLocation'];
    merchantName = json['merchantName'];
    usrMerchantNo = json['usrMerchantNo'];
    usrPassword = json['usrPassword'];
    usrUserType = json['usrUserType'];
    usrThirdPartyVendorNo = json['usrThirdPartyVendorNo'];
    usrRegisterStatus = json['usrRegisterStatus'];
    merchantLogo = json['merchantLogo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usrUserNo'] = this.usrUserNo;
    data['usrLoginId'] = this.usrLoginId;
    data['usrMobile'] = this.usrMobile;
    data['usrFName'] = this.usrFName;
    data['usrLName'] = this.usrLName;
    data['usrStatus'] = this.usrStatus;
    data['usrProfilePic'] = this.usrProfilePic;
    data['profilePic'] = this.profilePic;
    data['usrLocation'] = this.usrLocation;
    data['merchantName'] = this.merchantName;
    data['usrMerchantNo'] = this.usrMerchantNo;
    data['usrPassword'] = this.usrPassword;
    data['usrUserType'] = this.usrUserType;
    data['usrThirdPartyVendorNo'] = this.usrThirdPartyVendorNo;
    data['usrRegisterStatus'] = this.usrRegisterStatus;
    data['merchantLogo'] = this.merchantLogo;
    return data;
  }
}