library http_requests;

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

late http.Response _kresponse;
dynamic _url ;
dynamic param;
class HttpRequests {

  static Future def(var val) async{
    _kresponse = val;
    Response _kponse  = Response() ;
    return _kponse;
  }  
  static post(String url ,{dynamic headers , dynamic data}) async{
    _url = Uri.parse(url);
    dynamic _param = data ?? {};
    Map<String,String> tempHeader = {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.7113.93'
    };
    Map<dynamic,dynamic> _head = headers ?? tempHeader;
    Map<String, String> _header =  _head as Map<String, String> ;
    http.Response response = await http.post(_url, body: _param , headers: _header);
    return await def(response);
  }
  static get(String url , {dynamic headers}) async{
    var _url = Uri.parse(url);
    Map<String,String> tempHeader = {
      'User-Agent': 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.7113.93'
    };
    Map<dynamic,dynamic> _head = headers ?? tempHeader;

    Map<String, String> _header =  _head as Map<String, String> ;

    http.Response response = await http.get(_url, headers: _header);
    return await def(response);
  }  
}


class Response{
  test(){
    return "test !";
  }  
  bool get hasError => (400 <= _kresponse.statusCode) && (_kresponse.statusCode < 600);
  bool get success => !hasError;
  get status =>  _kresponse.statusCode ;
  String get url =>  _url;
  String get contentType => _kresponse.headers['content-type'] ?? "unknow";
  String get content=>convert.utf8.decode(bytes, allowMalformed: true);
  Map<String, dynamic> get json =>  convert.jsonDecode(_kresponse.body) as Map<String, dynamic>;
  // ignore: unnecessary_cast
  get headers => _kresponse.headers as Map<String, dynamic>;
  get response => _kresponse.body;
  get contentLength => _kresponse.contentLength;
  get isRedirect => _kresponse.isRedirect;
  List<int> get bytes => _kresponse.bodyBytes;
  void throwForStatus() {
      if (!success) {
        throw HTTPException(
            'Invalid HTTP status code ${_kresponse.statusCode} for url $url', _kresponse);
      }
    }
}




class HTTPException implements Exception {
  final String message;
  final http.Response response;
  HTTPException(this.message, this.response);
}