

import 'package:dio/dio.dart';
import 'package:unsplashed/network/dioClient.dart';


class ImageRepo {
   DioClient dioClient=DioClient();
 ImageRepo(this.dioClient);

  Future<Response> getImageApi(url) async {
       try {
         final Response response = await dioClient.get(
           url,
         );
         return response;
       } catch (e) {
         rethrow;
       }

  }


}
