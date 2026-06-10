package com.devhjs.isa.image_search_app

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "devhjs.com/photos"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getPhotos") {
                result.success(getPhotos())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getPhotos(): List<String> {
        return listOf(
            """
            {
      "id": 5668882,
      "pageURL": "https://pixabay.com/photos/chrysanthemum-garden-chrysanthemums-5668882/",
      "type": "photo",
      "tags": "chrysanthemum, beautiful flowers, garden chrysanthemums, flower, blossom, bloom, yellow, petals, yellow flowers, yellow flower, flower background, flora, floriculture, horticulture, flower wallpaper, botany, nature, up close",
      "previewURL": "https://cdn.pixabay.com/photo/2020/10/19/19/58/chrysanthemum-5668882_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL": "https://pixabay.com/get/gd67c61072bffc8ace35226acf49c2085c7395c2639ed013fb62a7252434eecb8730b8c5c1ea9f50c7ca7271c6159f8ee8b42fb708020b7387b64bd7e397c2d94_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL": "https://pixabay.com/get/gba045922eb97205e77c682c7b63cb9275db32723d4192a5d37f291fe2eeb6349270a970921fcffaf8c0a66497598febbafc2e427fca085d4cfe7d1a4e93e71ee_1280.jpg",
      "imageWidth": 3864,
      "imageHeight": 2576,
      "imageSize": 1293394,
      "views": 23030,
      "downloads": 16223,
      "collections": 142,
      "likes": 203,
      "comments": 100,
      "user_id": 12752456,
      "user": "mariya_m",
      "userImageURL": "https://cdn.pixabay.com/user/2025/12/16/06-16-12-556_250x250.jpeg",
      "noAiTraining": true,
      "isAiGenerated": false,
      "isGRated": true,
      "isLowQuality": false,
      "userURL": "https://pixabay.com/users/12752456/",
      "name": "chrysanthemum, beautiful flowers, garden chrysanthemums"
    }
        """.trimIndent(),
            """
                {
      "id": 6162613,
      "pageURL": "https://pixabay.com/photos/yellow-rose-rose-flower-cereal-6162613/",
      "type": "photo",
      "tags": "yellow rose, rose, flower, cereal, yellow flower, garden, nature, beautiful flowers, flower wallpaper, closeup, plants, flora, fragrant, flower background, plant, floral, blossomed, light yellow, beautiful, flowers, roses, rose flower, soft",
      "previewURL": "https://cdn.pixabay.com/photo/2021/04/08/18/59/yellow-rose-6162613_150.jpg",
      "previewWidth": 150,
      "previewHeight": 100,
      "webformatURL": "https://pixabay.com/get/g2de95f91763be918d69a44119c2cb139023490d2f7fbcbbdb111c0e9587d8d795cdb65dba9cfb9966d2cfdec3e1ac12fd60477fe69f305119879ef2a8f421e5b_640.jpg",
      "webformatWidth": 640,
      "webformatHeight": 427,
      "largeImageURL": "https://pixabay.com/get/gd3b7ab25ef4ab48d4b0373f880a0497bc72aa91b0b5d55a8cac09800efb154546a82b5b92e8632d70e9394721eb97ea0163bdf7b04aaea8800547ebb35a72de0_1280.jpg",
      "imageWidth": 4240,
      "imageHeight": 2832,
      "imageSize": 2389361,
      "views": 71979,
      "downloads": 54512,
      "collections": 165,
      "likes": 324,
      "comments": 204,
      "user_id": 9363663,
      "user": "Nowaja",
      "userImageURL": "https://cdn.pixabay.com/user/2020/09/15/15-16-12-52_250x250.jpg",
      "noAiTraining": false,
      "isAiGenerated": false,
      "isGRated": true,
      "isLowQuality": false,
      "userURL": "https://pixabay.com/users/9363663/",
      "name": "yellow rose, rose, flower"
    }
            """.trimIndent()
        )
    }

}