import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapi/model/provider.dart';
import 'package:testapi/model/provider_type.dart';
class ProviderApi{
static Future<List<Provider>> fetchUsers() async {

    const url = 'http://192.168.100.24:9000/api/get-all-provider';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['data'] as List<dynamic>;
    final providers = result.map((e) {
      final type = ProviderType(
        id: e['type']['_id'],
        name: e['type']['name'],
        description: e['type']['description'],
      );
      return Provider(
        id: e['_id'],
        name: e['name'],
        phone: e['phone'],
        address: e['address'],
        // cover: e['cover'],
        delivery: e['delivery'],
        // identity: e['identity'],
        isVarified: e['isVarified'],
        // profile: e['profile'],
        status: e['status'],
        type: type
      );
    }).toList();
    return providers;

  }
}