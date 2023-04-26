import 'package:flutter/material.dart';
import 'package:testapi/model/provider_type.dart';

class Provider {
  final String delivery;
  // final String identity;
  // final String profile;
  // final String cover;
  final String address;
  final String id;
  final String name;
  final String status;
  final String isVarified;
  final String phone;
  final ProviderType type;
  Provider({
    required this.id,
    required this.name,
    required this.address,
    required this.delivery,
    // required this.identity,
    // required this.profile,
    // required this.cover,
    required this.status,
    required this.isVarified,
    required this.phone,
    required this.type
  });
}
