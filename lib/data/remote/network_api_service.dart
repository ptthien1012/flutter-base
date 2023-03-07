import 'package:flutter_base/data/remote/base_api_service.dart';
import 'package:flutter_uploader/flutter_uploader.dart';

class NetworkApiService extends BaseApiService {
  NetworkApiService({required FlutterUploader uploader}) : _uploader = uploader;

  final FlutterUploader _uploader;
  @override
  Future deleteResponse(String url, {required header, id, body}) {
    // TODO: implement deleteResponse
    throw UnimplementedError();
  }

  @override
  Future getResponse(String url, {required header, String? function}) {
    // TODO: implement getResponse
    throw UnimplementedError();
  }

  @override
  Future getResponseByID(String url, {required header, String? function, id}) {
    // TODO: implement getResponseByID
    throw UnimplementedError();
  }

  @override
  Future postResponse(String url, {required header, String? function}) {
    // TODO: implement postResponse
    throw UnimplementedError();
  }

  @override
  Future putResponse(String url,
      {required header, String? function, id, body}) {
    // TODO: implement putResponse
    throw UnimplementedError();
  }

  @override
  Future upload(String url,
      {required header, String? function, required String filePath}) {
    // TODO: implement upload
    throw UnimplementedError();
  }
}
