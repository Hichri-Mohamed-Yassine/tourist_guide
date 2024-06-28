import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  static const screenRoute = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("filtring"),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text("ggggggggggggggg"),
      ),
    );
  }
}
