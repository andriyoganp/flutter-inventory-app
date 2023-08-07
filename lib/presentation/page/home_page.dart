import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../data/database/inventory_database.dart';
import '../../di/injection.dart';
import 'dashboard_page.dart';
import 'friend_list_page.dart';
import 'tool_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = 'home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _exampleChild = <Widget>[
    const DashboardPage(),
    const FriendListPage(),
    const ToolListPage(),
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _exampleChild.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Tools',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final InventoryDatabase db = getIt<InventoryDatabase>();
          Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (BuildContext context) => DriftDbViewer(db)));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.dataset),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
