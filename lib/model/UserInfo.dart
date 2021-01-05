import 'package:flutter_app_1/HttpUtil/dio_util.dart';

class UserInfo {
  String id;
  String username;
  String password;
  String accountNumber;
  String nickName;
  String phone;
  int organization;
  String realName;
  String headImgUrl;
  int status;
  int createTime;
  int updateTime;
  String updateId;
  String job;
  String company;
  int country;
  String countryName;
  int province;
  String provinceName;
  int city;
  String cityName;
  String address;
  String userNumber;
  String brandName;
  int fakePhone;
  bool concerned;
  bool concernMe;
  bool reported;
  bool blocked;
  bool blockedMe;
  bool dial;
  String privacyPolicyVersionNo;
  int privacyPolicyStatus;
  String termsOfServiceVersionNo;
  int termsOfServiceStatus;
  String noticeForCancelNo;
  int persionalAuthenticationStatus;
  String persionalAuthenticationStatusName;
  String idCardName;
  String idCardNumber;
  int faceAuthenticationStatus;
  String faceAuthenticationImg;
  int faceAuthenticationCheckTime;
  int businessAuthenticationStatus;
  String businessAuthenticationStatusName;
  String corporateName;
  String socialCreditCode;
  String businessLicense;
  String businessAuthenticationCheckId;
  int businessAuthenticationCheckTime;
  int businessAuthenticationApplyTime;
  String organizationName;
  String associationId;
  Association association;
  int organizationAuthenticationStatus;
  String organizationAuthenticationStatusName;
  String organizationAuthenticationCheckId;
  int organizationAuthenticationCheckTime;
  int organizationAuthenticationApplyTime;
  int travelAuthenticationStatus;
  int noticeReminder;
  String youthModePassword;
  int videoLabelNumber;
  int imStatus;
  String imPassword;
  String imReginfo;

  UserInfo(
      {this.id,
        this.username,
        this.password,
        this.accountNumber,
        this.nickName,
        this.phone,
        this.organization,
        this.realName,
        this.headImgUrl,
        this.status,
        this.createTime,
        this.updateTime,
        this.updateId,
        this.job,
        this.company,
        this.country,
        this.countryName,
        this.province,
        this.provinceName,
        this.city,
        this.cityName,
        this.address,
        this.userNumber,
        this.brandName,
        this.fakePhone,
        this.concerned,
        this.concernMe,
        this.reported,
        this.blocked,
        this.blockedMe,
        this.dial,
        this.privacyPolicyVersionNo,
        this.privacyPolicyStatus,
        this.termsOfServiceVersionNo,
        this.termsOfServiceStatus,
        this.noticeForCancelNo,
        this.persionalAuthenticationStatus,
        this.persionalAuthenticationStatusName,
        this.idCardName,
        this.idCardNumber,
        this.faceAuthenticationStatus,
        this.faceAuthenticationImg,
        this.faceAuthenticationCheckTime,
        this.businessAuthenticationStatus,
        this.businessAuthenticationStatusName,
        this.corporateName,
        this.socialCreditCode,
        this.businessLicense,
        this.businessAuthenticationCheckId,
        this.businessAuthenticationCheckTime,
        this.businessAuthenticationApplyTime,
        this.organizationName,
        this.associationId,
        this.association,
        this.organizationAuthenticationStatus,
        this.organizationAuthenticationStatusName,
        this.organizationAuthenticationCheckId,
        this.organizationAuthenticationCheckTime,
        this.organizationAuthenticationApplyTime,
        this.travelAuthenticationStatus,
        this.noticeReminder,
        this.youthModePassword,
        this.videoLabelNumber,
        this.imStatus,
        this.imPassword,
        this.imReginfo});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    accountNumber = json['accountNumber'];
    nickName = json['nickName'];
    phone = json['phone'];
    organization = json['organization'];
    realName = json['realName'];
    headImgUrl = json['headImgUrl'];
    status = json['status'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    updateId = json['updateId'];
    job = json['job'];
    company = json['company'];
    country = json['country'];
    countryName = json['countryName'];
    province = json['province'];
    provinceName = json['provinceName'];
    city = json['city'];
    cityName = json['cityName'];
    address = json['address'];
    userNumber = json['userNumber'];
    brandName = json['brandName'];
    fakePhone = json['fakePhone'];
    concerned = json['concerned'];
    concernMe = json['concernMe'];
    reported = json['reported'];
    blocked = json['blocked'];
    blockedMe = json['blockedMe'];
    dial = json['dial'];
    privacyPolicyVersionNo = json['privacyPolicyVersionNo'];
    privacyPolicyStatus = json['privacyPolicyStatus'];
    termsOfServiceVersionNo = json['termsOfServiceVersionNo'];
    termsOfServiceStatus = json['termsOfServiceStatus'];
    noticeForCancelNo = json['noticeForCancelNo'];
    persionalAuthenticationStatus = json['persionalAuthenticationStatus'];
    persionalAuthenticationStatusName =
    json['persionalAuthenticationStatusName'];
    idCardName = json['idCardName'];
    idCardNumber = json['idCardNumber'];
    faceAuthenticationStatus = json['faceAuthenticationStatus'];
    faceAuthenticationImg = json['faceAuthenticationImg'];
    faceAuthenticationCheckTime = json['faceAuthenticationCheckTime'];
    businessAuthenticationStatus = json['businessAuthenticationStatus'];
    businessAuthenticationStatusName = json['businessAuthenticationStatusName'];
    corporateName = json['corporateName'];
    socialCreditCode = json['socialCreditCode'];
    businessLicense = json['businessLicense'];
    businessAuthenticationCheckId = json['businessAuthenticationCheckId'];
    businessAuthenticationCheckTime = json['businessAuthenticationCheckTime'];
    businessAuthenticationApplyTime = json['businessAuthenticationApplyTime'];
    organizationName = json['organizationName'];
    associationId = json['associationId'];
    association = json['association'] != null
        ? new Association.fromJson(json['association'])
        : null;
    organizationAuthenticationStatus = json['organizationAuthenticationStatus'];
    organizationAuthenticationStatusName =
    json['organizationAuthenticationStatusName'];
    organizationAuthenticationCheckId =
    json['organizationAuthenticationCheckId'];
    organizationAuthenticationCheckTime =
    json['organizationAuthenticationCheckTime'];
    organizationAuthenticationApplyTime =
    json['organizationAuthenticationApplyTime'];
    travelAuthenticationStatus = json['travelAuthenticationStatus'];
    noticeReminder = json['noticeReminder'];
    youthModePassword = json['youthModePassword'];
    videoLabelNumber = json['videoLabelNumber'];
    imStatus = json['imStatus'];
    imPassword = json['imPassword'];
    imReginfo = json['imReginfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['accountNumber'] = this.accountNumber;
    data['nickName'] = this.nickName;
    data['phone'] = this.phone;
    data['organization'] = this.organization;
    data['realName'] = this.realName;
    data['headImgUrl'] = this.headImgUrl;
    data['status'] = this.status;
    data['createTime'] = this.createTime;
    data['updateTime'] = this.updateTime;
    data['updateId'] = this.updateId;
    data['job'] = this.job;
    data['company'] = this.company;
    data['country'] = this.country;
    data['countryName'] = this.countryName;
    data['province'] = this.province;
    data['provinceName'] = this.provinceName;
    data['city'] = this.city;
    data['cityName'] = this.cityName;
    data['address'] = this.address;
    data['userNumber'] = this.userNumber;
    data['brandName'] = this.brandName;
    data['fakePhone'] = this.fakePhone;
    data['concerned'] = this.concerned;
    data['concernMe'] = this.concernMe;
    data['reported'] = this.reported;
    data['blocked'] = this.blocked;
    data['blockedMe'] = this.blockedMe;
    data['dial'] = this.dial;
    data['privacyPolicyVersionNo'] = this.privacyPolicyVersionNo;
    data['privacyPolicyStatus'] = this.privacyPolicyStatus;
    data['termsOfServiceVersionNo'] = this.termsOfServiceVersionNo;
    data['termsOfServiceStatus'] = this.termsOfServiceStatus;
    data['noticeForCancelNo'] = this.noticeForCancelNo;
    data['persionalAuthenticationStatus'] = this.persionalAuthenticationStatus;
    data['persionalAuthenticationStatusName'] =
        this.persionalAuthenticationStatusName;
    data['idCardName'] = this.idCardName;
    data['idCardNumber'] = this.idCardNumber;
    data['faceAuthenticationStatus'] = this.faceAuthenticationStatus;
    data['faceAuthenticationImg'] = this.faceAuthenticationImg;
    data['faceAuthenticationCheckTime'] = this.faceAuthenticationCheckTime;
    data['businessAuthenticationStatus'] = this.businessAuthenticationStatus;
    data['businessAuthenticationStatusName'] =
        this.businessAuthenticationStatusName;
    data['corporateName'] = this.corporateName;
    data['socialCreditCode'] = this.socialCreditCode;
    data['businessLicense'] = this.businessLicense;
    data['businessAuthenticationCheckId'] = this.businessAuthenticationCheckId;
    data['businessAuthenticationCheckTime'] =
        this.businessAuthenticationCheckTime;
    data['businessAuthenticationApplyTime'] =
        this.businessAuthenticationApplyTime;
    data['organizationName'] = this.organizationName;
    data['associationId'] = this.associationId;
    if (this.association != null) {
      data['association'] = this.association.toJson();
    }
    data['organizationAuthenticationStatus'] =
        this.organizationAuthenticationStatus;
    data['organizationAuthenticationStatusName'] =
        this.organizationAuthenticationStatusName;
    data['organizationAuthenticationCheckId'] =
        this.organizationAuthenticationCheckId;
    data['organizationAuthenticationCheckTime'] =
        this.organizationAuthenticationCheckTime;
    data['organizationAuthenticationApplyTime'] =
        this.organizationAuthenticationApplyTime;
    data['travelAuthenticationStatus'] = this.travelAuthenticationStatus;
    data['noticeReminder'] = this.noticeReminder;
    data['youthModePassword'] = this.youthModePassword;
    data['videoLabelNumber'] = this.videoLabelNumber;
    data['imStatus'] = this.imStatus;
    data['imPassword'] = this.imPassword;
    data['imReginfo'] = this.imReginfo;
    return data;
  }

  Future <UserInfo> getUserInfo () async {
    // http://do.tongye.ren/hwjt-news-user/users-anon/appUser/findAppUserById?id=5f8029634b83e338c1f8e9b1
    var result = await DioUtils.post("hwjt-news-user/users-anon/appUser/findAppUserById",parameters: {"id":"5f8029634b83e338c1f8e9b1"});
    if (result ==null) return null;
    UserInfo temp = UserInfo.fromJson(result);
    print(temp.id);
    return temp;
  }
}

class Association {
  String id;
  int type;
  String name;
  String logo;
  Null introduction;
  Null constitution;
  Null leaderInformation;
  Null organizationStructure;
  Null contactUs;
  int memberUploadStatus;
  int country;
  String countryName;
  int province;
  String provinceName;
  int city;
  String cityName;
  int status;
  String corporateName;
  String socialCreditCode;
  String license;
  String createId;
  int createTime;
  String updateId;
  int updateTime;
  Null url;
  Null flashCount;
  Null memberCount;

  Association(
      {this.id,
        this.type,
        this.name,
        this.logo,
        this.introduction,
        this.constitution,
        this.leaderInformation,
        this.organizationStructure,
        this.contactUs,
        this.memberUploadStatus,
        this.country,
        this.countryName,
        this.province,
        this.provinceName,
        this.city,
        this.cityName,
        this.status,
        this.corporateName,
        this.socialCreditCode,
        this.license,
        this.createId,
        this.createTime,
        this.updateId,
        this.updateTime,
        this.url,
        this.flashCount,
        this.memberCount});

  Association.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    logo = json['logo'];
    introduction = json['introduction'];
    constitution = json['constitution'];
    leaderInformation = json['leaderInformation'];
    organizationStructure = json['organizationStructure'];
    contactUs = json['contactUs'];
    memberUploadStatus = json['memberUploadStatus'];
    country = json['country'];
    countryName = json['countryName'];
    province = json['province'];
    provinceName = json['provinceName'];
    city = json['city'];
    cityName = json['cityName'];
    status = json['status'];
    corporateName = json['corporateName'];
    socialCreditCode = json['socialCreditCode'];
    license = json['license'];
    createId = json['createId'];
    createTime = json['createTime'];
    updateId = json['updateId'];
    updateTime = json['updateTime'];
    url = json['url'];
    flashCount = json['flashCount'];
    memberCount = json['memberCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['introduction'] = this.introduction;
    data['constitution'] = this.constitution;
    data['leaderInformation'] = this.leaderInformation;
    data['organizationStructure'] = this.organizationStructure;
    data['contactUs'] = this.contactUs;
    data['memberUploadStatus'] = this.memberUploadStatus;
    data['country'] = this.country;
    data['countryName'] = this.countryName;
    data['province'] = this.province;
    data['provinceName'] = this.provinceName;
    data['city'] = this.city;
    data['cityName'] = this.cityName;
    data['status'] = this.status;
    data['corporateName'] = this.corporateName;
    data['socialCreditCode'] = this.socialCreditCode;
    data['license'] = this.license;
    data['createId'] = this.createId;
    data['createTime'] = this.createTime;
    data['updateId'] = this.updateId;
    data['updateTime'] = this.updateTime;
    data['url'] = this.url;
    data['flashCount'] = this.flashCount;
    data['memberCount'] = this.memberCount;
    return data;
  }


}




