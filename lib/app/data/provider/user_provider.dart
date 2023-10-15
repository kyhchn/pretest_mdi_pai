import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pretest_mdi_pai/app/data/model/bulk_user.dart';
import 'package:pretest_mdi_pai/app/data/model/user.dart';

class UserProvider {
  final dio = Dio();
  final String _baseUrl = "https://dummyjson.com/users";
  final String bulkUserQuery = 'select=firstName,age,image,lastName,email';
  Future<List<BulkUser>?> getUsers(int limit) async {
    try {
      print('$_baseUrl/&?limit=$limit&$bulkUserQuery');
      final response = await dio.get('$_baseUrl?limit=$limit&$bulkUserQuery');
      if (response.data != null) {
        return (response.data['users'] as List)
            .map((e) => BulkUser.fromJson(e))
            .toList();
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }

  Future<List<BulkUser>?> searchUsers(String name, int limit) async {
    try {
      final response =
          await dio.get('$_baseUrl/search?q=$name&limit=$limit&$bulkUserQuery');
      if (response.data != null) {
        return (response.data['users'] as List)
            .map((e) => BulkUser.fromJson(e))
            .toList();
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }

  Future<User?> getUser(int id) async {
    try {
      final response = await dio.get('$_baseUrl/$id');
      if (response.data != null) {
        return User.fromJson(response.data);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
    return null;
  }
}
