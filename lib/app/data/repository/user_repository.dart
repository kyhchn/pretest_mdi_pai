import 'package:pretest_mdi_pai/app/data/model/bulk_user.dart';
import 'package:pretest_mdi_pai/app/data/model/user.dart';
import 'package:pretest_mdi_pai/app/data/provider/user_provider.dart';

class UserRepository {
  final provider = UserProvider();

  /// Retrieves id, name, age, and image of users from the API.
  ///
  /// Parameters:
  /// - [limit]: The number of users to retrieve max 100. default 0/max
  Future<List<BulkUser>?> getUsers({int limit = 0}) async {
    return await provider.getUsers(limit);
  }

  /// Retrieves id, name, age, and image of users from the API.
  ///
  /// Parameters:
  /// - [name]: The name of the user to retrieve.
  /// - [limit]: The number of users to retrieve max 100. default 0/max
  Future<List<BulkUser>?> searchUsers(String name, {int limit = 0}) async {
    return await provider.searchUsers(name, limit);
  }

  /// Retrieves snapshot of user from the API.
  ///
  /// Parameters:
  /// - [id]: The id of the user to retrieve.
  Future<User?> getUser(int id) async {
    return await provider.getUser(id);
  }
}
