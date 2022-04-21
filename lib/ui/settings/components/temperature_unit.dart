import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_bloc/model/menus/item_temperature_unit.dart';

class TemperatureUnitRow extends StatefulWidget {
  const TemperatureUnitRow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TemperatureUnitRowState();
}


class _TemperatureUnitRowState extends State<TemperatureUnitRow> {
  final GlobalKey _menuKey = GlobalKey();
  SharedPreferences? _prefs;

  String temp = TempUnit.celsius;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _prefs = await SharedPreferences.getInstance();
      setState(() {
        temp = _prefs?.getString("Unit Temperature") ?? TempUnit.celsius;
      });
     });
  }

  @override
  Widget build(BuildContext context) {
    
    final _temp = PopupMenuButton<String>(
      child: GestureDetector(
          child: Container(
            width: 120,
            alignment: Alignment.centerRight,
            child: Text(
              "°" + temp,
              style: const TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ),
          onTap: () {
            dynamic state = _menuKey.currentState;
            state.showButtonMenu();
          }),
      key: _menuKey,
      itemBuilder: (_) {
        return TempUnit.choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
      onSelected: choiceAction,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Temperature unit',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        _temp,
      ],
    );
  }

  void choiceAction(String choice) async {
      setState(() {
        switch (choice) {
          case TempUnit.fahrenheit:
            {
              temp = choice;
              _prefs?.setString("Unit Temperature", "F");
            }
            break;
          default:
            {
              temp = choice;
           _prefs?.remove("Unit Temperature");   
            }
        }
      });
    }
}
