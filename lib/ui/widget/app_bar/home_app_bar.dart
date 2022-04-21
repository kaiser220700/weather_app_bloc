import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/location_cubit.dart';
import 'package:weather_app_bloc/model/menus/item_menu.dart';
import 'package:weather_app_bloc/ui/manage_locations/manage_location_screen.dart';
import 'package:weather_app_bloc/ui/settings/settings_screen.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

final GlobalKey _menuKey = GlobalKey();

class _HomeAppBarState extends State<HomeAppBar> {
  late final LocationCubit _cubit;
  @override
  void initState() {
    _cubit = BlocProvider.of<LocationCubit>(context);
    super.initState();
    _cubit.init();
  }

  void choiceAction(String choice) {
    if (choice == Menus.setting) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _menu = PopupMenuButton<String>(
      child: GestureDetector(
          child: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onTap: () {
            dynamic state = _menuKey.currentState;
            state.showButtonMenu();
          }),
      key: _menuKey,
      itemBuilder: (_) {
        return Menus.choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
      onSelected: choiceAction,
    );

    return BlocConsumer<LocationCubit, LocationState>(
        bloc: _cubit,
        listenWhen: (prev, current) => prev.loadStatus != current.loadStatus,
        listener: (context, state) {},
        buildWhen: (prev, current) => prev.loadStatus != current.loadStatus,
        builder: (context, state) {
          return Row(
            children: [
              const SizedBox(width: 18),
              GestureDetector(
                child: const Icon(
                  Icons.add_outlined,
                  color: Colors.white,
                  size: 33,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ManageLocationScreen()),
                  );
                },
              ),
              const SizedBox(width: 110),
              Column(
                children: [
                  Text(
                    "${state.location?.name}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5.0),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.0,
                            color: Colors.white,
                          ),
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        margin: const EdgeInsets.only(right: 5.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 1.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(width: 110),
              _menu,
            ],
          );
        });
  }
}
