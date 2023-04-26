import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapi/model/provider.dart';
import 'package:testapi/model/provider_type.dart';
import 'package:flutter/material.dart';
import 'package:testapi/services/provider_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Provider> providers = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    // final provider = providers[1];
    // final name = provider.name;
    // final providerTypeName = provider.type.name;
    // print(providers);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Api test')),
        ),

        // body:Padding(
        //   padding: const EdgeInsets.only(top: 90),
        //   child: Column(
        //     children: [

        //       Center(child:providerTypeName == 'service' ? Text(name) : Text('Sorry'),)
        //     ],
        //   ),
        // )

        body: ListView.builder(
          itemCount: providers.length,
          itemBuilder: (context, index) {
            final provider = providers[index];
            print(provider.type.description);
            final name = provider.name;
            final phone = provider.phone;
            final address = provider.address;
            final providerTypeName = provider.type.name;
            //  print(providerTypeName);
            // final color = user.gender=='male'? Colors.blue:Colors.green;
            if (providerTypeName=='service') {
             
              return ListTile(
                //leading: Text('${index + 1}'),

                title: Text(name),
                subtitle: Text(phone),
                trailing: Text(providerTypeName),
                // tileColor: color,
              );
            }
          },
        ),
      ),
    );
  }

  void fetchUsers() async {
    final response = await ProviderApi.fetchUsers();
    setState(() {
      providers = response;
    });
  }

  // void fetchUsers() async {
  //   print('fetchUsers Called');
  //   const url = 'http://192.168.100.24:9000/api/get-all-provider';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final result = json['data'] as List<dynamic>;
  //   final transformed = result.map((e) {
  //     final type = ProviderType(
  //       id: e['type']['_id'],
  //       name: e['type']['name'],
  //       description: e['type']['description'],
  //     );
  //     return Provider(
  //       id: e['_id'],
  //       name: e['name'],
  //       phone: e['phone'],
  //       address: e['address'],
  //       // cover: e['cover'],
  //       delivery: e['delivery'],
  //       // identity: e['identity'],
  //       isVarified: e['isVarified'],
  //       // profile: e['profile'],
  //       status: e['status'],
  //       type: type
  //     );
  //   }).toList();
  //   setState(() {
  //     users = transformed;
  //   });
  //   // print(json);
  //   print('fetchUsers Completed');
  // }
}
