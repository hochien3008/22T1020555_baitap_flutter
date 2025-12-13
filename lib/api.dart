import 'package:dio/dio.dart';
import 'package:hoctap1/model/product.dart';

class API {
  Future<List<Product>> getAllProducts() async {
    const url = 'https://fakestoreapi.com/products';
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200 && response.data is List) {
        final list = response.data as List;
        return list.map((json) => Product.fromJson(json)).toList();
      } else {
        print('Loi API: status ${response.statusCode}, data: ${response.data}');
        return [];
      }
    } on DioException catch (e) {
      print('DioException: ${e.message} - status ${e.response?.statusCode}');
      return [];
    } catch (e) {
      print('Loi khong xac dinh: $e');
      return [];
    }
  }
}
