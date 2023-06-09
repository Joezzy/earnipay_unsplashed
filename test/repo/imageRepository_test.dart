import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unsplashed/data/imageData.dart';
import 'package:unsplashed/network/dioClient.dart';
import 'package:unsplashed/network/endpoint.dart';
import 'package:unsplashed/repo/imageRepository.dart';

class MockDio extends Mock implements DioClient {}
class MockPhotoData extends Mock implements PhotoData {}

void main() {
  MockDio mockDio = MockDio();
  // MockDB mockDB = MockDB();
  late ImageRepo imageRepository;

  setUp(() {
    imageRepository = ImageRepo(mockDio);
  });

  test('Get image_list-Success case', () async {

    when( ()=> mockDio.get(
      any(),
      // data: any(named:"data"),
    )).thenAnswer(
          (inv) => Future.value(
              Response(
        statusCode: 200,
        data: List<MockPhotoData>,
        requestOptions: RequestOptions(path: ''),
      )),
    );

    final result=await imageRepository.getImageApi(Endpoints.getPhotoUrl(1));
    expect(result.statusCode, 200);
  });


  test('Get image_list-Failed case', () async {
    when( ()=> mockDio.get(
      any(),
    )).thenAnswer(
          (inv) => Future.value(Response(
        statusCode: 400,
        data: 'Not found',
        requestOptions: RequestOptions(path: ''),
      )),
    );

    final result=await imageRepository.getImageApi(Endpoints.baseUrl);
    expect( result.statusCode, 400);
  });
}

