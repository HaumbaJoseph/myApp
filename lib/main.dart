import 'package:flutter/material.dart';
import 'package:bottompage/home_screen.dart' as home;  
import 'package:bottompage/setting_screen.dart' as setting;


void main() {
  runApp(MyApp());

}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: MainScreen());
  }

  
}

// ignore: use_key_in_widget_constructors
class MainScreen extends StatefulWidget{
  @override
  _MainPageState createState()=> _MainPageState(); // we created a state and associate it with the class we are going to use
}


class _MainPageState extends State<MainScreen> //we manage the state in the ui
{
  int selectedItem = 0;// to fix the list not to change
  final List<Widget>_pages = [home.HomeScreen(),
  setting.SettingScreen()]; //all the items going to display at the bottom of the screen

  void onTappedItem(int index)//we create a function with the index 
  {
    setState((){
      selectedItem = index;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(body: _pages[selectedItem],
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: selectedItem,
        onTap: onTappedItem,
          items: const[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
      ),
    );
  }
  
}
//how to use a scroll widget