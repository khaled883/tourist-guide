// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:tarveling_app/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  //const FiltersScreen({super.key});

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);
  // the previous two lines is how we pass the _changeFilters method from the main to the filters_screen
  static const screenRoute = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _winter = false;
  var _summer = false;
  var _family = false;

  @override
  void initState() {
    _summer = widget.currentFilters['summer'] as bool;
    _winter = widget.currentFilters['winter'] as bool;
    _family = widget.currentFilters['family'] as bool;
    super.initState();
  }

  buildSwitchListTilte(String title, String subtitle, dynamic currentValue,
      Function updateValue) {
    //this is a build method so we dont repeae the code many times and to be easy to edit
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الفلترة'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilters = {
                    'summer': _summer,
                    'winter': _winter,
                    'family': _family,
                  };
                  widget.saveFilters(selectedFilters); //widget with small w
                })
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: Text('الرحلات الصيفية'),
                    subtitle: Text('اظهار الرحلات الصيفية فقط'),
                    value: _summer,
                    onChanged: (newValue) {
                      setState(
                        () {
                          _summer = newValue;
                        },
                      );
                    },
                  ),
                  SwitchListTile(
                    title: Text('الرحلات الشتوية'),
                    subtitle: Text('اظهار الرحلات الشتوية فقط'),
                    value: _winter,
                    onChanged: (newValue) {
                      setState(
                        () {
                          _winter = newValue;
                        },
                      );
                    },
                  ),
                  SwitchListTile(
                    title: Text('الرحلات العائلية'),
                    subtitle: Text('اظهار الرحلات الخاصة بالعائلات فقط'),
                    value: _family,
                    onChanged: (newValue) {
                      setState(
                        () {
                          _family = newValue;
                        },
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
