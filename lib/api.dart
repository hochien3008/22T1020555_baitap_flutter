import 'package:dio/dio.dart';
import 'package:hoctap1/model/product.dart';

class API {
  Future<List<Product>> getAllProducts() async {
    var url = 'https://fakestoreapi.com/products';
    var dio = Dio();
    var response = await dio.request(url);
    List<Product> listProduct = [];
    if (response.statusCode == 200) {
      List list = response.data;
      listProduct = list.map((json) => Product.fromJson(json)).toList();
      print('Lay data thanh cong');
    } else {
      print('loi API');
    }
    return listProduct;
  }
}
