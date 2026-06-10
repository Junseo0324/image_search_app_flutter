import 'dart:convert';

import 'package:image_search_app/data/data_source/photo_data_source.dart';
import 'package:image_search_app/data/data_source/photo_response.dart';

import 'package:http/http.dart' as http;


class PixabayPhotoDataSourceImpl implements PhotoDataSource {
  final http.Client _client;
  final String _apiKey;

  final String _baseUrl = "https://pixabay.com/api/";

  PixabayPhotoDataSourceImpl({http.Client? client, required String apiKey})
      : _client = client ?? http.Client(),
        _apiKey = apiKey;

  @override
  Future<PhotoResponse> fetchPhotos(String query) async {
    final response = await _client.get(
      Uri.parse('$_baseUrl?key=$_apiKey&q=$query&image_type=photo'),
    );

    return PhotoResponse(statusCode: response.statusCode, body: response.body);
  }


}