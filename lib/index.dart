// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:frefresh/frefresh.dart';
// import 'package:bot_toast/bot_toast.dart';
// import 'package:provider/provider.dart';
//
// import 'package:flutter_irap_wms/styles/colors.dart';
// import 'package:flutter_irap_wms/widgets/common/loading.dart';
// import 'package:flutter_irap_wms/api/inventory.dart';
// import 'package:flutter_irap_wms/util/struct/api/inventory.dart';
// import 'package:flutter_irap_wms/util/struct/api/stock.dart';
// import 'package:flutter_irap_wms/model/global_stock_data.dart';
// import 'detail.dart';
//
// class InventoryIndex extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _InventoryIndexState();
// }
//
// class _InventoryIndexState extends State<InventoryIndex> {
//   TabController _tabController;
//
//   final List<String> _tabValues = ['全部','未盘点','盘点中','已盘点'];
//
//   FRefreshController _refreshController = FRefreshController();
//
//   String _labelCode = '';
//   int pageType;
//   String countId = '';
//   List _dataList = [];
//   int currentTab;
//   /// 页索引
//   int _pageIndex = 1;
//
//   /// 总数
//   int _total = 0;
//
//   /// 区域，货架
//   List areaShelvesList = [];
//
//   /// 库房信息
//   MdmStock _stock = MdmStock(id: '');
//
//   FocusNode _inputFocus = FocusNode();
//
//   @override
//   void initState() {
//
//     super.initState();
//     _tabController = TabController(vsync: ScrollableState(), length: 4);
//     _refreshController = FRefreshController();
//
//     /// 获取全局库房信息
//     final GlobalStockData stockData =
//     Provider.of<GlobalStockData>(context, listen: false);
//     this._stock = stockData.currentStock;
//
//     Timer(Duration(milliseconds: 100), () {
//       _refreshController.refresh();
//       FocusScope.of(context).requestFocus(_inputFocus);
//       _getAreaShelves();
//       setState(() {
//         this.pageType = ModalRoute.of(context).settings.arguments;
//         _createCountList();
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(this.pageType == 0 ? '物理盘点' : '循环盘点'),
//       ),
//       body: WillPopScope(
//         onWillPop: () async {
//           print('退出');
//           return _showQuitDialog();
//         },
//         child: Container(
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 60.0,
//                 // padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border(
//                         bottom: BorderSide(
//                             width: 1,
//                             color: Color.fromRGBO(221, 221, 221, 1)
//                         )
//                     )
//                 ),
//                 child: FlatButton(
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text('全部区域，货架'),
//                       ),
//                       Container(
//                         margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
//                         child: Icon(
//                           Icons.arrow_forward_ios,
//                           color: AppColor.textTip,
//                           size: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                   onPressed: () {
//                     this._showAreaShelves();
//                   },
//                 )
//               ),
//               Container(
//                 width: double.infinity,
//                 height: 60.0,
//                 color: Colors.white,
//                 child: TabBar(
//                   controller: _tabController,
//                   labelColor: Colors.blue,
//                   unselectedLabelColor: Color.fromRGBO(48, 48, 48, 1),
//                   tabs: _tabValues.map((f) {
//                     return Text(f);
//                   }).toList(),
//                   onTap: (index) {
//                     setState(() {
//                       _dataList = [];
//                       // this.currentTab = index;
//                     });
//                     // this._refreshController.refresh();
//                     _fetchInventoryList(true, index == 0 ? null : index-1);
//                   },
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 width: double.infinity,
//                 height: 60.0,
//                 padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                 color: Color.fromRGBO(239, 239, 244, 1.0),
//                 child: TextField(
//                   textAlignVertical: TextAlignVertical.center,
//                   textInputAction: TextInputAction.search,
//                   autofocus: true,
//                   focusNode: _inputFocus,
//                   decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     filled: true,
//                     hintText: '输入库位代码',
//                   ),
//                   onSubmitted: (value) {
//                     setState(() {
//                       this._labelCode = value;
//                       this._dataList = [];
//                     });
//                     _fetchInventoryList(true, null);
//                   },
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   width: double.infinity,
//                   height: screenSize.height - 340,
//                   // color: Colors.white,
//                   // padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                   child: TabBarView(
//                     controller: _tabController,
//                     children: _tabValues.map((f) {
//                       return Center(
//                         child: _getListContent(f),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//         bottomSheet: Container(
//           width: double.infinity,
//           height: 80.0,
//           color: Colors.white,
//           padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
//           child: Row(
//             children: [
//               SizedBox(
//                   width: screenSize.width / 2 - 30,
//                   height: 60.0,
//                   child: Container(
//                     child: FlatButton(
//                       shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                               width: 1,
//                               color: Color.fromRGBO(221, 221, 221, 1)),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Text('绑定库位'),
//                       color: Colors.white,
//                       onPressed: () {
//                         FocusScope.of(context).requestFocus(_inputFocus);
//                         // _inputFocus.unfocus();
//                       },
//                     ),
//                   )
//               ),
//               SizedBox(
//                   width: screenSize.width / 2 - 10,
//                   height: 60.0,
//                   child: Container(
//                     margin: EdgeInsets.only(left: 20.0),
//                     child: FlatButton(
//                       shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                               width: 1,
//                               color: Color.fromRGBO(221, 221, 221, 1)),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Text('完成盘点'),
//                       color: Color.fromRGBO(16, 142, 233, 1),
//                       textColor: Colors.white,
//                       onPressed: () {
//                         print('完成盘点');
//                         _showInventoryDialog();
//                       },
//                     ),
//                   )
//               )
//             ],
//           ),
//         ),
//       );
//   }
//
//   /// 选择区域货架
//   _showAreaShelves() {
//     showGeneralDialog(
//         context: context,
//         barrierDismissible:true,
//         barrierColor: Colors.black.withOpacity(.5),
//         barrierLabel: '',
//         transitionDuration: Duration(milliseconds: 200),
//         pageBuilder: (BuildContext context, Animation<double> animation,
//             Animation<double> secondaryAnimation) {
//           return Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 height: 60.0,
//                 color: Colors.white,
//                 margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
//                 padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         '选择区域、货架',
//                         style: TextStyle(
//                             fontSize: 16,
//                             color: Color.fromRGBO(0, 0, 0, 0.85),
//                             decoration: TextDecoration.none
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Divider(height: 0,),
//               Expanded(
//                 child: Container(
//                   color: Colors.white,
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     child: _areaShelvesContent(),
//                   ),
//                 )
//               ),
//               Divider(height: 0,),
//               Container(
//                 width: double.infinity,
//                 height: 60.0,
//                 color: Colors.white,
//                 // margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
//                 padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: FlatButton(
//                         shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                                 width: 1,
//                                 color: Color.fromRGBO(221, 221, 221, 1))),
//                         color: Color.fromRGBO(255, 255, 255, 1),
//                         child: Text(
//                           '取消',
//                           style: TextStyle(
//                               fontSize: 16,
//                               color: Color.fromRGBO(0, 0, 0, 1),
//                               decoration: TextDecoration.none
//                           ),
//                         ),
//                         onPressed: (){
//                           Navigator.pop(context, true);
//                         },
//                       ),
//                     ),
//                     Expanded(
//                       child: FlatButton(
//                         color: Color.fromRGBO(16, 142, 233, 1),
//                         textColor: Colors.white,
//                         child: Text(
//                           '确定',
//                           style: TextStyle(
//                               fontSize: 16,
//                               // color: Colors.blue,
//                               decoration: TextDecoration.none
//                           ),
//                         ),
//                         onPressed: (){
//                           Navigator.pop(context, true);
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           );
//         }
//     );
//   }
//
//   Widget _areaShelvesContent() {
//     return ListView.builder(
//       itemCount: areaShelvesList == null ? 0 : areaShelvesList.length,
//       itemBuilder: (context, index) {
//         return ExpansionPanelList(
//           expansionCallback: (index, isExpanded) {
//             setState(() {
//               this.areaShelvesList[index].isExpanded = !this.areaShelvesList[index].isExpanded;
//             });
//             // print(this.areaShelvesList[index].isExpanded);
//           },
//           children: areaShelvesList.map((item){
//             return ExpansionPanel(
//               // isExpanded: true,
//               canTapOnHeader: true,
//               isExpanded: areaShelvesList[index].isExpanded,
//               headerBuilder: (context, isExpanded) {
//                 print(isExpanded);
//                 return ListTile(
//                   title: Text('[${item.code}]${item.name}'),
//                   onTap: () {
//                     print(item.isExpanded);
//                     setState(() {
//                       item.isExpanded = !item.isExpanded;
//                     });
//                   },
//                 );
//               },
//               body: ListTile(
//                 title: Text(areaShelvesList[index].isExpanded.toString()),
//               ),
//             );
//           }).toList()
//         );
//       });
//   }
//
//   /// 退出盘点
//   _showQuitDialog() {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text('确定退出${this.pageType == 0 ? '物理盘点' : '循环盘点'}?'),
//         content: Text(
//           '退出后当前盘点信息将丢失',
//           style: TextStyle(color: AppColor.textTip),
//         ),
//         actions: [
//           FlatButton(
//             child: Text(
//               '取消',
//               style: TextStyle(color: Colors.black),
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           FlatButton(
//             child: Text(
//               '确定',
//             ),
//             onPressed: () async {
//               // Navigator.pop(context);
//               bool isSuccess = await this._quitInventory();
//               if (isSuccess){
//                 Navigator.pop(context);
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// 确定退出
//   _quitInventory() async {
//     bool isSuccess = false;
//     try {
//       List arr = [];
//       this._dataList.map((e) => arr.add(e.id)).toList();
//       final params = {
//         'countId': this.countId,
//         'countDetailIds': arr
//       };
//       final response = await ApiInventory.quitInventory(params);
//       if(response['code'] == 200){
//         isSuccess = true;
//         // Navigator.pop(context);
//         Navigator.pop(context);
//         // Navigator.pushNamed(context, '/HomeIndex');
//       }else{
//         BotToast.showText(text: response['message']);
//       }
//     }catch(err){
//       throw err;
//     }
//     return isSuccess;
//   }
//
//
//   /// 完成盘点
//   _showInventoryDialog() {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text('确定完成盘点？'),
//         content: Text(
//           '部分库位未完成盘点',
//           style: TextStyle(color: AppColor.textTip),
//         ),
//         actions: [
//           FlatButton(
//             child: Text(
//               '取消',
//               style: TextStyle(color: Colors.black),
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           FlatButton(
//             child: Text(
//               '确定',
//             ),
//             onPressed: () async {
//               this._finishInventory();
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// 确定完成盘点
//   _finishInventory() async {
//     try {
//       final params = {
//         'countId': this.countId,
//       };
//       final response = await ApiInventory.finishInventory(params);
//       if(response['code'] == 200){
//         Navigator.pop(context);
//         Navigator.pushNamed(context, '/index');
//       }else{
//         BotToast.showText(text: response['message']);
//       }
//     }catch(err){
//       throw err;
//     }
//   }
//
//   /// 获取区域货架
//   _getAreaShelves() async {
//     try {
//       final params = {
//         'stockId': this._stock.id,
//       };
//       final response = await ApiInventory.getAreasAndShelves(params);
//       if(response['code'] == 200){
//         final List<AreaShelves> list = response['data']
//             .map<AreaShelves>((json) => AreaShelves.fromJson(json))
//             .toList();
//         print(list);
//         list.map((item){
//           item.isExpanded = false;
//           return item;
//         }).toList();
//         setState(() {
//           this.areaShelvesList = list;
//         });
//       }else{
//         BotToast.showText(text: response['message']);
//       }
//     } catch (err) {
//       throw err;
//     }
//   }
//
//   /// 创建循环盘点单
//   _createCountList() async {
//     try {
//       final params = {
//         'stockId': this._stock.id,
//         'countType': this.pageType
//       };
//       final response = await ApiInventory.createCountList(params);
//       if(response['code'] == 200){
//         setState(() {
//           this.countId = response['data'];
//         });
//       }else{
//         BotToast.showText(text: response['message']);
//       }
//     } catch (err) {
//       throw err;
//     }
//   }
//
//   /// 获取列表数据
//   _fetchInventoryList(isRefresh, tabIndex) async {
//     try {
//       final params = {
//         'search': {
//           'countId': this.countId,
//           'stockId': this._stock.id,
//           'locationCode': '',
//           'countStatus': tabIndex,
//           'keyWords': this._labelCode,
//         },
//         'pageIndex': this._pageIndex,
//         'pageSize': 100,
//         'sortField': 'id',
//         'sortType': 'desc',
//       };
//       final response = await ApiInventory.getCountList(params);
//       if (response['code'] == 200) {
//         final List<InventoryList> list = response['data']['datas']
//             .map<InventoryList>((json) => InventoryList.fromJson(json))
//             .toList();
//         final total = response['data']['records'] as int;
//         if (isRefresh) {
//           setState(() {
//             this._dataList = list;
//           });
//         } else {
//           setState(() {
//             this._dataList.addAll(list);
//           });
//         }
//         if (total != this._total) {
//           setState(() {
//             this._total = total;
//           });
//         }
//         _refreshController.finishRefresh();
//         _refreshController.finishLoad();
//       } else {
//         BotToast.showText(text: response['message']);
//       }
//     } catch (err) {
//       throw err;
//     }
//   }
//
//   /// 跳转到详情页
//   _toInventoryDetail(InventoryList row) async {
//     final bool isSuccess = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => InventoryDetail(inventoryItem: row, countId: this.countId),
//       ),
//     );
//     if (isSuccess == true) {
//       // 操作成功，刷新列表
//       this._refreshController.refresh();
//     }
//   }
//
//   /// 列表内容
//   Widget _getListContent(tab) {
//     final screenSize = MediaQuery.of(context).size;
//     int tabIndex;
//     if(tab == '全部'){
//       tabIndex = null;
//     }else if(tab == '未盘点'){
//       tabIndex = 0;
//     }else if(tab == '盘点中'){
//       tabIndex = 1;
//     }else if(tab == '已盘点'){
//       tabIndex = 2;
//     }
//     return FRefresh(
//       controller: _refreshController,
//       child: Container(
//         height: screenSize.height,
//         child: ListView.builder(
//           itemCount: _dataList.length,
//           physics: NeverScrollableScrollPhysics(),
//           itemBuilder: (BuildContext context, int index) {
//             if(this._dataList.length > 0) {
//               final data = this._dataList[index];
//               return PullItem(
//                 data: data,
//                 onTap: (row) => this._toInventoryDetail(row),
//               );
//             } else {
//               return Text('暂无数据');
//             }
//           },
//         ),
//       ),
//       header: Loading.circularProgress(),
//       footer: Loading.linearProgress(),
//       footerHeight: 4,
//       onRefresh: () {
//         setState(() {
//           this._pageIndex = 1;
//         });
//         this._fetchInventoryList(true, tabIndex);
//         _refreshController.finishRefresh();
//       },
//       onLoad: () async {
//         setState(() {
//           this._pageIndex += 1;
//         });
//         await this._fetchInventoryList(false, tabIndex);
//         _refreshController.finishLoad();
//       },
//     );
//   }
// }
//
// /// 列表行组件
// class PullItem extends StatelessWidget{
//   final data;
//   final onTap;
//   PullItem({@required this.data, @required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     final content = Container(
//       padding: EdgeInsets.all(8),
//       // margin: EdgeInsets.fromLTRB(0, 0, 8, 0),
//       width: double.infinity,
//       child:Row(
//         children: [
//           Expanded(
//             child: Text(data.locationCode),
//           ),
//           Container(
//             alignment: Alignment.center,
//             width: 60,
//             height: 30,
//             child: Text(
//               data.countStatusText,
//               style: TextStyle(color: data.countStatusText == '未盘点' ? Color.fromRGBO(37, 37, 37, 1) : (data.countStatusText == '盘点中' ? Color.fromRGBO(24, 144, 255, 1) : Color.fromRGBO(82, 196, 26, 1)),),
//             ),
//             decoration: BoxDecoration(
//               border: Border.all(
//                   color: data.countStatusText == '未盘点' ? Color.fromRGBO(216, 216, 216, 1) : (data.countStatusText == '盘点中' ? Color.fromRGBO(145, 213, 255, 1) : Color.fromRGBO(183, 235, 143, 1)),
//                   width: 2
//               ),
//               color: data.countStatusText == '未盘点' ? Color.fromRGBO(249, 249, 249, 1) : (data.countStatusText == '盘点中' ? Color.fromRGBO(230, 247, 255, 1) : Color.fromRGBO(246, 255, 237, 1)),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
//             child: Icon(
//               Icons.arrow_forward_ios,
//               color: AppColor.textTip,
//               size: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//     return Container(
//       margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
//       child: FlatButton(
//         color: Colors.white,
//         child: content,
//         onPressed: () {
//           this.onTap(data);
//         },
//       ),
//     );
//   }
//
//
// }
