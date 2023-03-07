abstract class BaseApiService {
  Future<dynamic> getResponse(
    String url, {
    required header,
    String? function,
  });

  Future<dynamic> getResponseByID(
    String url, {
    required header,
    String? function,
    id,
  });

  Future<dynamic> postResponse(
    String url, {
    required header,
    String? function,
  });

  Future<dynamic> putResponse(
    String url, {
    required header,
    String? function,
    id,
    body,
  });

  Future<dynamic> deleteResponse(
    String url, {
    required header,
    id,
    body,
  });

  // Return task ID
  Future<dynamic> upload(
    String url, {
    required header,
    String? function,
    required String filePath,
  });
}
