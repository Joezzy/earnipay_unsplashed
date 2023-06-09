import 'dart:convert';
import 'dart:developer';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_x;
import 'package:unsplashed/data/imageData.dart';
import 'package:unsplashed/network/dioClient.dart';
import 'package:unsplashed/network/endpoint.dart';
import 'package:unsplashed/repo/imageRepository.dart';
import 'package:unsplashed/util/dialog.dart';
import 'package:unsplashed/util/dioException.dart';

class PhotoController extends get_x.GetxController {
  DioClient dioClient = DioClient();
  late ImageRepo imageRepo;

  PhotoController() {
    imageRepo = ImageRepo(dioClient);
  }

  final apiCacheManager = APICacheManager();

  // PhotoController(this.dioClient)
  var isLoading = true.obs;
  var imageList = <PhotoData>[].obs;
  int page = 1;

  Future getImageFunc(context) async {
    if (page == 1) isLoading.value = true;
    bool isCachedExist =
        await apiCacheManager.isAPICacheKeyExist(Endpoints.getPhotoUrl(page));

    try {
      final response = await imageRepo.getImageApi(Endpoints.getPhotoUrl(page));
      List<PhotoData> data = photoDataFromJson(json.encode(response.data));
      if (!isCachedExist) {
        try {
          if (response.statusCode == 200) {
            APICacheDBModel cacheDBModel = APICacheDBModel(
                key: Endpoints.getPhotoUrl(page),
                syncData: json.encode(response.data));
            await apiCacheManager.addCacheData(cacheDBModel);
          }
          // data!.forEach((element) {
          //   imageList.add(element);
          // });

          for (var i = 0; i < data.length; i++) {
            imageList.add(data[i]);
          }

          log(json.encode(response.data));
          return response;
        } catch (e) {
          rethrow;
        }
      } else {
        var cacheData =
            await apiCacheManager.getCacheData(Endpoints.getPhotoUrl(page));
        List<PhotoData> data = photoDataFromJson(cacheData.syncData);
        for (var i = 0; i < data.length; i++) {
          imageList.add(data[i]);
        }
      }

      isLoading.value = false;
      page++;
    } on DioError catch (e) {
      isLoading.value = false;
      final errorMessage = DioExceptions.fromDioError(e).toString();
      // print("ERROR");
      print(errorMessage);
      Dialogs.alertBox(
          context, 'Ovaloop', errorMessage.toString(), DialogType.error);
    }
  }
}
