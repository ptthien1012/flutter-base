abstract class BaseApiService {
  Future<dynamic> getResponse(
    String url, {
    header,
    String? function,
  });

  Future<dynamic> getResponseByID(
    String url, {
    header,
    String? function,
    id,
  });

  Future<dynamic> postResponse(
    String url, {
    header,
    String? function,
    body,
  });

  Future<dynamic> putResponse(
    String url, {
    header,
    String? function,
    id,
    body,
  });

  Future<dynamic> deleteResponse(
    String url, {
    header,
    id,
    body,
  });

  // Future<dynamic> uploadListFiles(
  //   String url, {
  //   required header,
  //   String? function,
  //   required List<String> filePath,
  // });

  Future<dynamic> uploadFile(
    String url, {
    header,
    String? function,
    required String filePath,
  });

  // Future<dynamic> downloadFile(
  //   String url, {
  //   required header,
  //   id,
  //   String? function,
  // });

  // Future<dynamic> downloadListFiles(
  //   String url, {
  //   required header,
  //   List<dynamic> listId,
  //   String? function,
  // });
}
