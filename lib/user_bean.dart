class UserBean {
  String name;
  String address;
  bool isExpanded;
  UserBean({this.name,this.address,this.isExpanded = true});
  @override
  String toString() {
    // TODO: implement toString
    return "UserBean{name:$name,address:$address}";
  }




}


