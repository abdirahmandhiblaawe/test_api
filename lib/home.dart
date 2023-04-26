import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapi/model/provider.dart';
import 'package:testapi/model/provider_type.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Provider> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Api test')),
      ),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
      body: ListView.builder(
        
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          final name = user.name;
          final phone = user.phone;
          final address = user.address;
          final providerTypeName = user.type.name;
          // final color = user.gender=='male'? Colors.blue:Colors.green;
          return ListTile(
            //leading: Text('${index + 1}'),

            title: providerTypeName == 'Electaronics' ? Text(name) : Text('data'),
            // subtitle: Text(phone),
            trailing: Text(providerTypeName),
            // tileColor: color,
          );
        },
      ),
    );
  }


  void fetchUsers() async {
    print('fetchUsers Called');
    const url = 'http://192.168.100.24:9000/api/get-all-provider';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['data'] as List<dynamic>;
    final transformed = result.map((e) {
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
    setState(() {
      users = transformed;
    });
    // print(json);
    print('fetchUsers Completed');
  }
}
