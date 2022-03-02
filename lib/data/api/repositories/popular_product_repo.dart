import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/utils/constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({
    required this.apiClient,
  });

  Future<Response> getPopularProductList() async {
    final response = await apiClient.getData("/api/v1/products/popular");
    return response;
  }
}
