class hahaha {
  String id;
  String username;
  String password;
  String accountNumber;
  String nickName;
  String phone;

  hahaha(
      {this.id,
        this.username,
        this.password,
        this.accountNumber,
        this.nickName,
        this.phone});

  hahaha.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    accountNumber = json['accountNumber'];
    nickName = json['nickName'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['accountNumber'] = this.accountNumber;
    data['nickName'] = this.nickName;
    data['phone'] = this.phone;
    return data;
  }
}
