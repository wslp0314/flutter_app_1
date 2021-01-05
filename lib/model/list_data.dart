class ListData {
  ResultInfo resultInfo;

  ListData({this.resultInfo});

  ListData.fromJson(Map<String, dynamic> json) {
    resultInfo = json['resultInfo'] != null
        ? new ResultInfo.fromJson(json['resultInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.resultInfo != null) {
      data['resultInfo'] = this.resultInfo.toJson();
    }
    return data;
  }
}

class ResultInfo {
  Null data;
  int type;
  int messageCode;
  String message;
  Null details;
  Null loginSysUser;
  Null lastUrl;
  int index;
  Sysdata sysdata;
  bool success;

  ResultInfo(
      {this.data,
        this.type,
        this.messageCode,
        this.message,
        this.details,
        this.loginSysUser,
        this.lastUrl,
        this.index,
        this.sysdata,
        this.success});

  ResultInfo.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    type = json['type'];
    messageCode = json['messageCode'];
    message = json['message'];
    details = json['details'];
    loginSysUser = json['loginSysUser'];
    lastUrl = json['lastUrl'];
    index = json['index'];
    sysdata =
    json['sysdata'] != null ? new Sysdata.fromJson(json['sysdata']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['type'] = this.type;
    data['messageCode'] = this.messageCode;
    data['message'] = this.message;
    data['details'] = this.details;
    data['loginSysUser'] = this.loginSysUser;
    data['lastUrl'] = this.lastUrl;
    data['index'] = this.index;
    if (this.sysdata != null) {
      data['sysdata'] = this.sysdata.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Sysdata {
  int total;
  List<JobInfo> list;

  Sysdata({this.total, this.list});

  Sysdata.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['list'] != null) {
      list = new List<JobInfo>();
      json['list'].forEach((v) {
        list.add(new JobInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobInfo {
  String id;
  int nameData;
  int salaryData;
  int postProvince;
  int postCity;
  int workExperienceType;
  int educationType;
  String jobResponsibilities;
  String jobRequirements;
  String workAddress;
  String jobTag;
  int status;
  int userStatus;
  String createUserId;
  int createTime;
  String updateUserId;
  int updateTime;
  String name;
  String salaryName;
  String postProvinceName;
  String postCityName;
  List<String> jobTags;

  JobInfo(
      {this.id,
        this.nameData,
        this.salaryData,
        this.postProvince,
        this.postCity,
        this.workExperienceType,
        this.educationType,
        this.jobResponsibilities,
        this.jobRequirements,
        this.workAddress,
        this.jobTag,
        this.status,
        this.userStatus,
        this.createUserId,
        this.createTime,
        this.updateUserId,
        this.updateTime,
        this.name,
        this.salaryName,
        this.postProvinceName,
        this.postCityName,
        this.jobTags});

  JobInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameData = json['nameData'];
    salaryData = json['salaryData'];
    postProvince = json['postProvince'];
    postCity = json['postCity'];
    workExperienceType = json['workExperienceType'];
    educationType = json['educationType'];
    jobResponsibilities = json['jobResponsibilities'];
    jobRequirements = json['jobRequirements'];
    workAddress = json['workAddress'];
    jobTag = json['jobTag'];
    status = json['status'];
    userStatus = json['userStatus'];
    createUserId = json['createUserId'];
    createTime = json['createTime'];
    updateUserId = json['updateUserId'];
    updateTime = json['updateTime'];
    name = json['name'];
    salaryName = json['salaryName'];
    postProvinceName = json['postProvinceName'];
    postCityName = json['postCityName'];
    jobTags = json['jobTags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameData'] = this.nameData;
    data['salaryData'] = this.salaryData;
    data['postProvince'] = this.postProvince;
    data['postCity'] = this.postCity;
    data['workExperienceType'] = this.workExperienceType;
    data['educationType'] = this.educationType;
    data['jobResponsibilities'] = this.jobResponsibilities;
    data['jobRequirements'] = this.jobRequirements;
    data['workAddress'] = this.workAddress;
    data['jobTag'] = this.jobTag;
    data['status'] = this.status;
    data['userStatus'] = this.userStatus;
    data['createUserId'] = this.createUserId;
    data['createTime'] = this.createTime;
    data['updateUserId'] = this.updateUserId;
    data['updateTime'] = this.updateTime;
    data['name'] = this.name;
    data['salaryName'] = this.salaryName;
    data['postProvinceName'] = this.postProvinceName;
    data['postCityName'] = this.postCityName;
    data['jobTags'] = this.jobTags;
    return data;
  }
}
