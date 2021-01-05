
// 全局保存数据
class Global {
  static int index = 0; // 记录401次数
  static int timesOf401 = 0; // 记录401次数



}
//
// // 全局保存数据
// class Global {
//   static var context;
//   static PageController pageController = PageController(
//     initialPage: 0,
//     keepPage: true,
//   );
//   static bool appleFirstSign = false; // 苹果首次登录标识
//   static int timesOf401 = 0; // 记录401次数
//   static Timer splashTimer; // 闪屏页的timer
//   static Function startSplashTimer = _startSplashTimer; // 开始定时器
//   static Function stopSplashTimer = _stopSplashTimer; // 结束定时器
//   static Function navigateToIndexPage = _navigateToIndexPage; // 跳转到主页面
//   static bool isInVideoPage = false; // 当前页面是video时为true
//   static Map location = {}; // 当前位置
//   static String wechatAccessToken = ''; // 微信登录时临时保存
//   static VideoPlayerController homePagePlayer;
//   static bool homePlayerTempState;
//   static VideoPlayerController player;
//   static bool tempState; // 临时记录视频的状态
//   // 记录app运行状态，默认在前台
//   static AppLifecycleState appLifecycleState = AppLifecycleState.resumed;
//   static bool versionIcon = true; // 控制版本更新后的红点隐藏显示
//   static String downLoadUrl; // 版本更新地址
//   static bool isInitAlipush = false; // 每次阿里云推送只绑定一次
//   static AliPush aliPush = AliPush(); // 阿里云推送
//   static VideoListController publicVideoController; // 公共视频controller
//   static VideoListController recommandVideoController; // 推荐视频controller
//   static VideoListController focusVideoController; // 推荐视频controller
//   static bool isTokenNnll; // 判断当前token是否为空
//   static List productTypeList; // 产品类型数据
//   static bool isInLoginPage = false; // 是否在登录页，在登录前点击需要权限的页面跳转时置为true
//   static bool inHomeChildPage = false; // 在主页面的子页面
//   static int homeTabIndex = 1; // 推荐1，关注0
//   static int bottomAppBarIndex = 0;
//   static bool isHaveAcitive = false; //当前是否有活动
//   static bool incidentlyTriggerLifeState = false;
//   static bool isRetrunHome = false;
//   static List<CameraDescription> cameras = [];
//   static List<String> discoverTabs = ['热门', '产品', '卫视', '资讯'];
//   static List<String> unInitializedsSources = [];
//   static Timer getMessageCountTimer; // 获取消息数量定时器
//   static Timer setTeenagerCountTimer;
//   static bool isShowedHUD = false;
//   static Timer getTeenagerCountTimer; // 定时器
//   //added by jiamuc
//   static bool routeCtrlVideoPlay = true;
//   static bool lifeCtrlVideoPlay = true;
//   static List<bool> userCtrlVideoPlay = [true, true];
//
//   static int home2TabIndex = 1;
//   static int activePageIndex = 0; //底部bar选中的index
//   //列表中的视频播放
//   static bool routeCtrlListVideoPlay = true;
//   static bool userCtrlListVideoPlay = true;
//
//   //作者个人主页中的视频播放
//   static bool routeCtrlAuthorVideoPlay = true;
//   static bool userCtrlAuthorVideoPlay = true;
//
//   //综合搜索页视频控制
//   static bool routeCtrlSearchVideoPlay = true;
//   static bool routeCtrlSearchListVideoPlay = true;
//
//   static List<bool> userCtrlSearchVideoPlay = [true, false, false];
//   static bool userCtrlSearchListVideoPlay = true;
//
//   static int searchTabIndex = 0;
//   //个人主页动态
//   static int timeLineTabIndex = 0;
//   static bool routeCtrlTimeLineVideoPlay = true;
//   static List<bool> userCtrlTimeLineVideoPlay = [true, false, false];
//
//   static Map<String, dynamic> stsInfo = {};
//   static int videoType = 2; // 2:vid, 1:url
//   static String definition = "FD"; //清晰度
//   static ValueNotifier<bool> hideWhenScrollProgressBar =
//   ValueNotifier<bool>(false); //首页是否显示视频进度条
//   static List<ValueNotifier<bool>> showHomeProgressBar = [
//     ValueNotifier<bool>(false),
//     ValueNotifier<bool>(false)
//   ]; //首页是否显示视频进度条
//   static List<bool> keepHomeProgressBarStatus = [true, true];
//   static ValueNotifier<int> tabHomeProgressBar = ValueNotifier<int>(1);
//   static List<aliListPlayer.VideoPlayerController> vpcList = [null, null];
//
//   static String phoneCode = 'unknown';
//   static String userId = 'unknown';
//   static Uint8List musicLive;
// //added end
//   // 解决首次进入app获取位置loading和列表页loading冲突
//   static bool listHasLoadedOnce = false;
//   // 微信登录是否可用
//   static bool isWechatAvailable = false;
//   // 登录过来之后
//   static bool isFromLogin = false;
//
//   static String token; // 保存登录token
//
// //记录分享到微信的  页面type
//   static int shareToWechatPageType;
//   static Map saveShareInfo;
//   static bool isShowing;
//   static String idStr;
//   static String mySelfCopyClipboardText = ''; //自己复制剪切板的信息
// }
// //ValueNotifier<Completer>gMoveToCompleter = ValueNotifier<Completer>(Completer());
//
// // 开始倒计时
// _startSplashTimer() async {
//   var splashSecondsProvide =
//   Provider.of<SplashSecondsProvide>(Global.context, listen: false);
//   if (splashSecondsProvide.seconds == 0) {
//     await Future.delayed(Duration(milliseconds: 1000));
//     _navigateToIndexPage();
//     return;
//   }
//   // 间隔
//   var _duration = Duration(seconds: 1);
//   Timer(_duration, () {
//     // 1秒等待
//     Global.splashTimer = Timer.periodic(Duration(milliseconds: 1000), (v) {
//       splashSecondsProvide.changeSeconds(--splashSecondsProvide.seconds);
//       if (splashSecondsProvide.seconds == 0) {
//         _navigateToIndexPage();
//       }
//     });
//     return Global.splashTimer;
//   });
// }
//
// // 暂停定时器
// _stopSplashTimer() async {
//   Global.splashTimer?.cancel();
// }
//
// // 跳转页面
// void _navigateToIndexPage() {
//   Global.splashTimer?.cancel();
//   Global.splashTimer = null;
//   Navigator.of(Global.context).pushReplacementNamed('home');
//   Provider.of<SplashSecondsProvide>(Global.context, listen: false)
//       .changeSeconds(0);
// }
