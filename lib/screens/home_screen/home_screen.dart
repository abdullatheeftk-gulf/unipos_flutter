import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unipos_flutter/screens/dashboard/dashboard.dart';
import 'package:unipos_flutter/screens/entries/entries.dart';
import 'package:unipos_flutter/screens/home_screen/cubit/home_cubit.dart';
import 'package:unipos_flutter/screens/profile/profile.dart';
import 'package:unipos_flutter/screens/reports/reports.dart';
import 'package:unipos_flutter/util/log_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screens = [
    Dashboard(),
    Entries(),
    Reports(),
    Profile(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (prev, cur) {
            return cur.maybeWhen(
              orElse: () => false,
              onScreenChanged: (value) => true,
            );
          },
          builder: (context, state) {
            state.mapOrNull(onScreenChanged: (value) {
              currentIndex = value.index;
            });
                  infoLog("index: $currentIndex");

            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'Entries',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.bar_chart),
                    label: 'Reports',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profile',
                  ),
                ],
                unselectedItemColor: Colors.grey,
                unselectedLabelStyle: const TextStyle(color: Colors.grey),
                showUnselectedLabels: true,
                currentIndex: currentIndex,
                selectedItemColor: Colors.amber[800],
                onTap: (index) {
                  context.read<HomeCubit>().changeScreen(index);
                },
              ),
              body: screens[currentIndex],
            );
          },
        ));
  }
}
