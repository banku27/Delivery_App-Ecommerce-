// import 'package:ecommerce/data/api/repositories/popular_product_repo.dart';
// import 'package:ecommerce/models/popular_products_models.dart';
// import 'package:get/get.dart';

// class PopularProductController extends GetxController {
//   final PopularProductRepo popularProductRepo;

//   PopularProductController({required this.popularProductRepo});

//   List<dynamic> _popularProductList = [];

//   List<dynamic> get popularProductList => _popularProductList;

//   Future<void> getPopularProductList() async {
//     final response = await popularProductRepo.getPopularProductList();

//     if (response.statusCode == 200) {
//       print('got products');
//       _popularProductList = [];
//       _popularProductList.addAll(Product.fromJson(response.body).products);
//       print(_popularProductList);
//       update();
//     } else {}
//   }
// }
