import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  void initState() {
    _summer = widget.currentFilters["summer"] ?? false;
    _winter = widget.currentFilters["winter"] ?? false;
    _family = widget.currentFilters["family"] ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Filtring",
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                "summer": _summer,
                "winter": _winter,
                "family": _family,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const AppDrawer(),
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
                  _summer,
                  (newValue) {
                    setState(
                      () {
                        _summer = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  "Winter Trips",
                  "Show trips in Winter only",
                  _winter,
                  (newValue) {
                    setState(
                      () {
                        _winter = newValue;
                      },
                    );
                  },
                ),
                buildSwitchListTile(
                  "For Family",
                  "Show trips for family only",
                  _family,
                  (newValue) {
                    setState(
                      () {
                        _family = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
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
