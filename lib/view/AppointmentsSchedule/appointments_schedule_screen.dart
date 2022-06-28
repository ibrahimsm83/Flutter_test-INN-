import 'package:flutter/material.dart';
import 'package:innovative/utils/color_manager.dart';
import 'package:innovative/utils/strings_manager.dart';
import 'package:innovative/view/AppointmentsSchedule/doctot_list_screen.dart';
import 'package:innovative/widget/custome_appbar.dart';

class AppointmentsScheduleView extends StatefulWidget {
  const AppointmentsScheduleView({Key? key}) : super(key: key);

  @override
  State<AppointmentsScheduleView> createState() =>
      _AppointmentsScheduleViewState();
}

class _AppointmentsScheduleViewState extends State<AppointmentsScheduleView> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DoctorListView(),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        title: AppStrings.appointmentsSchedule,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManager.darkblue, ColorManager.blue.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            stops: [0.0, 0.8],
            tileMode: TileMode.clamp,
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          //showSelectedLabels: false,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          unselectedIconTheme: const IconThemeData(color: Colors.grey),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_add),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
