import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pet_finder_app/core/api/dio_consumer.dart';
import 'package:pet_finder_app/core/api/api_interceptors.dart';
import 'package:pet_finder_app/core/api/endpoints.dart';

// ---- Mock Classes ----
class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

void main() {
  late MockDio mockDio;
  late DioConsumer dioConsumer;

  setUp(() {
    mockDio = MockDio();
    mockDio.options = BaseOptions(); // <-- this fixes the Null error
    dioConsumer = DioConsumer(dio: mockDio);
  });

  group('ApiInterceptor', () {
    test('adds API key to request headers', () {
      final interceptor = ApiInterceptor();
      final options = RequestOptions(path: '/test');
      final handler = RequestInterceptorHandler();

      // manually invoke
      interceptor.onRequest(options, handler);

      expect(options.headers[ApiKeys.apiKey], EndPoints.myApiKey);
    });
  });

  group('DioConsumer', () {
    test('get() returns response data on success', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(path: '/breeds'),
        data: {'status': 'ok'},
      );

      when(
        () => mockDio.get(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => mockResponse);

      final result = await dioConsumer.get('/breeds');

      expect(result, {'status': 'ok'});
      verify(
        () => mockDio.get('/breeds', data: null, queryParameters: null),
      ).called(1);
    });

    test('post() returns response data on success', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(path: '/favourites'),
        data: {'added': true},
      );

      when(
        () => mockDio.post(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenAnswer((_) async => mockResponse);

      final result = await dioConsumer.post('/favourites', data: {'id': 1});

      expect(result, {'added': true});
    });

    test('delete() handles DioException properly', () async {
      when(
        () => mockDio.delete(
          any(),
          data: any(named: 'data'),
          queryParameters: any(named: 'queryParameters'),
        ),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/delete'),
          type: DioExceptionType.badResponse,
          response: Response(
            requestOptions: RequestOptions(path: '/delete'),
            statusCode: 400,
          ),
        ),
      );

      // Should not throw (you handle it internally)
      final result = await dioConsumer.delete('/delete');
      expect(result, isNull); // since you don’t return on exception
    });
  });
}
