import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  static const screenRoute = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSummer = false;
  var _isInWinter = false;
  var _IsForFamily = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filtring",
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  "Summer Trips",
                  "Show trips in summer only",
                  _isInSummer,
                  (newValue) {
                    setState(
                      () {
                        _isInSummer = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  "Winter Trips",
                  "Show trips in Winter only",
                  _isInWinter,
                  (newValue) {
                    setState(
                      () {
                        _isInWinter = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  "For Family",
                  "Show trips for family only",
                  _IsForFamily,
                  (newValue) {
                    setState(
                      () {
                        _IsForFamily = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSwitchListTile(String title, String subtitle, var currentValue,
      void Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }
}
