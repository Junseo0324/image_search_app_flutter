class PhotoResponse {
  final int statusCode;
  final Map<String, String> header;
  final String body;

  PhotoResponse({
    required this.statusCode,
    Map<String, String>? header,
    required this.body,
  }) : header = header ?? <String,String>{};
}
