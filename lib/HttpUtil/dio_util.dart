import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_1/Comment/Global.dart';
import 'package:flutter_app_1/HttpUtil/shared_preferences_util.dart';
import 'package:flutter_app_1/HttpUtil/toast.dart';
// import 'package:news_app/custom_widgets/toast.dart';
// import 'package:news_app/util/functions.dart';
// import 'package:news_app/util/global.dart';
import 'package:safemap/safemap.dart';

class DioUtils {
  /// global dio object提交git
  static Dio dio;

  static var token;

  /// default options
  static const int CONNECT_TIMEOUT = 60000;
  static const int RECEIVE_TIMEOUT = 60000;
  static const String BASE_URL = "http://do.tongye.ren/";

  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';
  static const String PUT = 'put';
  static const String PATCH = 'patch';
  static const String DELETE = 'delete';

  /// 创建 dio 实例对象
  static Dio createInstance({
    connectTimeout = CONNECT_TIMEOUT,
  }) {
    if (dio == null) {
      BaseOptions options = BaseOptions(
        connectTimeout: connectTimeout,
        receiveTimeout: RECEIVE_TIMEOUT,
        baseUrl: BASE_URL,
      );
      dio = new Dio(options);
      if (!kReleaseMode) {
        //debug模式
        dio.interceptors.add(_getInterceptor());
      }
    }
    if(connectTimeout != CONNECT_TIMEOUT || dio.options.connectTimeout != connectTimeout) {
      dio.options.connectTimeout = connectTimeout;
    }
    return dio;
  }

  /*
   * error统一处理
   */
  static formatError(DioError e, String url, [bool errorHandle = true]) async {
    print('请求错误-$url：${e.response.toString()}');
    int statusCode;
    try {
      statusCode = e.response.statusCode;
    } catch (e) {
      statusCode = 0;
    }
    print('状态码：$statusCode');
    // 错误不处理
    if (!errorHandle) return;
    if (e.response == null) {
      // Toast.show('与服务器连接断开');
      return;
    }
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      Toast.show('连接超时');
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      Toast.show('请求超时');
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      Toast.show('响应超时');
    } else if (statusCode == 404 || statusCode == 500 || statusCode == 502) {
      // 接口问题临时禁用
      if (url.indexOf('appUserfindNewsFlashById') > -1) {
        return;
      }
      Toast.show('服务器产生内部错误，错误码：$statusCode');
    } else if (statusCode == 402 && url.contains('/sys/login')) {
      Toast.show('手机号有误');
    } else if (statusCode == 401 && !url.contains('login')) {
      // token失效
      if (Global.timesOf401 == 0) {
        // 非首次进入
        // var isFirstEnter = await SharedPreferencesUtil.get('isFirstEnter');
        // if (isFirstEnter != null) {
        //   Toast.show('您尚未登录或者登录信息已经超时，请重新登录！');
        // }
        Global.timesOf401++;
        // 跳转到登录页
        // jumpToLoginPage();
        log("后端返回  401  根据项目需求  做出专门的判断");
      }
    } else {
      var msg;
      var resData = e.response.data;
      if (!(resData is Map)) return;
      msg = resData['message'] ?? null; // 错误信息
      msg = msg ?? SafeMap(resData)['resultInfo']['message'].value;
      int messageCode = SafeMap(resData)['resultInfo']['messageCode'].value;
      if (msg != null && msg != '') {
        // 状态码是900的后台消息不予展示，通常表示重复点赞关注之类用户无需展示
        if (messageCode != 900) {
          Toast.show(msg);
        }
      }
    }
  }

  /// 清空 dio 对象
  static clear() {
    dio = null;
  }

  /// Get请求
  static Future get<T>(
      String url, {
        Map<String, dynamic> parameters,
        Function(T) onSuccess,
        Function(String error) onError,
        Function(dynamic error) onCatch,
        int connectTimeout,
      }) async {
    ///定义请求参数
    parameters = parameters ?? {};
    //参数处理
    parameters.forEach((key, value) {
      if (url.indexOf(key) != -1) {
        url = url.replaceAll(':$key', value.toString());
      }
    });

    try {
      Response response;
      Dio dio;
      if (connectTimeout == null) {
        dio = createInstance();
      } else {
        dio = createInstance(connectTimeout: connectTimeout);
      }
      // await Future.delayed(Duration(milliseconds: 1000));
      var token = await SharedPreferencesUtil.get('token');
      log('$token', name: 'token');
      log('$BASE_URL$url', name: '请求url');
      log(parameters.toString(), name: '请求数据');
      // await Future.delayed(Duration(milliseconds: 1000));
      response = await dio.get(url,
          queryParameters: parameters,
          options:
          Options(contentType: Headers.formUrlEncodedContentType, headers: {
            'Authorization': token,
          }));
      var responseData = response.data;
      try {
        if (json.encode(responseData).length > 2000) {
          log('===========字符长度超出2000已被折叠===========', name: '$url 响应数据：');
        } else {
          log(json.encode(responseData), name: '$url 响应数据：');
        }
      } catch (e) {
        log('null', name: '$url 响应数据：');
      }
      // log(responseData.toString(), name: '');
      // print('响应数据：' + response.toString());
      return responseData;
    } catch (e) {
      if (onCatch != null) onCatch(e);
      formatError(e, url);
      return null;
    }
  }

  /// Post请求
  static Future post<T>(
      String url, {
        parameters,
        bool isUpload = false,
        bool withoutToken = false, // 个别接口不需要token
        bool uploadTokenRequired = false,
        bool responseWithError = false, // 是否需要返回错误信息
        bool errorHandle = true, // 是否处理error
        Function(T) onSuccess,
        Function(String error) onError,
        Function(dynamic error) onCatch,
        // DataModel dataModel,
        int connectTimeout, // 超时时长
      }) async {
    // 定义请求参数
    parameters = parameters ?? {};
    if (!isUpload) {
      // 参数处理
      parameters.forEach((key, value) {
        if (url.indexOf(key) != -1) {
          url = url.replaceAll(':$key', value.toString());
        }
      });
    }

    try {
      Response response;
      Dio dio;
      if (connectTimeout == null) {
        dio = createInstance();
      } else {
        dio = createInstance(connectTimeout: connectTimeout);
      }
      var token = await SharedPreferencesUtil.get('token');
      Options options;
      // 上传默认不需要token，但个别接口需要单独处理
      if (isUpload) {
        options = uploadTokenRequired
            ? Options(
            headers: token == null
                ? {}
                : {
              'Authorization': token,
            })
            : Options();
      } else {
        options = withoutToken
            ? Options(
          contentType: Headers.formUrlEncodedContentType,
        )
            : Options(
            contentType: Headers.formUrlEncodedContentType,
            headers: token == null
                ? {}
                : {
              'Authorization': token,
            });
      }
      log('$token', name: 'token');
      log('$BASE_URL$url', name: '$url');
      log(parameters.toString(), name: '$url 请求');
      // await Future.delayed(Duration(milliseconds: 1000));
      response = await dio.post(url, data: parameters, options: options);
      var responseData = response.data;
      try {
        if (json.encode(responseData).length > 2000) {
          log('===========字符长度超出2000已被折叠===========', name: '$url 响应');
        } else {
          log(json.encode(responseData), name: '$url 响应');
        }
      } catch (e) {
        log('null', name: '$url 响应');
      }

      return responseData;
    } catch (e) {
      if (onCatch != null) onCatch(e);
      // if (dataModel != null) dataModel.toError(e);

      formatError(e, url, errorHandle);
      return responseWithError ? e : null;
    }
  }

  /*
   * url 请求链接
   * parameters 请求参数
   * method 请求方式
   * onSuccess 成功回调
   * onError 失败回调
   */
  static Future requestHttp<T>(String url,
      {parameters,
        method,
        Function(T t) onSuccess,
        Function(String error) onError}) async {
    parameters = parameters ?? {};
    method = method ?? 'GET';

    if (method == DioUtils.GET) {
      return await get(
        url,
        parameters: parameters,
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (error) {
          onError(error);
        },
      );
    } else if (method == DioUtils.POST) {
      return await post(
        url,
        parameters: parameters,
        onSuccess: (data) {
          onSuccess(data);
        },
        onError: (error) {
          onError(error);
        },
      );
    }
  }

  // 获取二进制文件流
  static Future<Response> getFileBytes(String url) async {
    try {
      Response response = await Dio()
          .get(url, options: Options(responseType: ResponseType.bytes));
      return response;
    } catch (e) {
      formatError(e, url);
      return null;
    }
  }

  //输出log日志
  static Interceptor _getInterceptor() {
    String flag = "okflutter-";
    return InterceptorsWrapper(onRequest: (RequestOptions options) {
      print(
          "\n=======$flag========================== 请求数据 =================================");
      print("${flag}method = ${options.method.toString()}");
      print("${flag}url = ${options.uri.toString()}");
      print("${flag}headers = ${options.headers}");
      print("${flag}params = ${options.queryParameters}");
      print("${flag}data = ${options.data}");
    }, onResponse: (Response response) {
      print("\n==$flag==响应数据开始==${response.request.uri.toString()}==");
      print("${flag}code = ${response.statusCode}");
      print("${flag}data = ${response.data}");
      print(
          "=============$flag==================== 响应数据结束 =================================\n");
    }, onError: (DioError e) {
      print(
          "\n=============$flag====================错误响应数据 =================================");
      print("${flag}type = ${e.type}");
      print("${flag}message = ${e.message}");
      print("${flag}stackTrace = ${e.error}");
      print("\n");
    });
  }



}
