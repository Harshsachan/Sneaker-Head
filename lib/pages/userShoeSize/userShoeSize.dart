import 'package:flutter/material.dart';

import '../memory/shoeSizePrefernce.dart';

class UserShoeSize extends StatefulWidget {
  const UserShoeSize({Key? key}) : super(key: key);

  @override
  State<UserShoeSize> createState() => _UserShoeSizeState();
}

class _UserShoeSizeState extends State<UserShoeSize> {
  final ShoeSizePreferences shoeSizePreferences = ShoeSizePreferences();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
