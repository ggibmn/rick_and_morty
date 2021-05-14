import 'package:flutter/material.dart';
import 'package:rick_and_morty/Rick_and_Morty/episode.dart';
import 'package:rick_and_morty/Rick_and_Morty/location.dart';
import 'package:rick_and_morty/Rick_and_Morty/settings.dart';
import 'Rick_and_Morty/characters.dart';
import 'configs/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;


  final _pages = [
    RMCharacters(),
    RMLocation(),
    RMEpisode(),
    RMSettings()
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/images/character_selected.png",
                width: 24,
                height: 24,
              ),
              icon: Image.asset(
                "assets/images/character.png",
                width: 24,
                height: 24,
              ),
              title: Text('Персонажи'),
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/images/location_selected.png",
                width: 24,
                height: 24,
              ),
              icon: Image.asset(
                "assets/images/location.png",
                width: 24,
                height: 24,
              ),
              title: Text('Локации'),
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/images/episode_selected.png",
                width: 24,
                height: 24,
              ),
              icon: Image.asset(
                "assets/images/episode.png",
                width: 24,
                height: 24,
              ),
              title: Text('Эпизоды'),
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                "assets/images/settings_selected.png",
                width: 24,
                height: 24,
              ),
              icon: Image.asset(
                "assets/images/settings.png",
                width: 24,
                height: 24,
              ),
              title: Text('Настройки'),
            ),
          ],
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppTheme.controller,
          currentIndex: _selectedIndex,
          unselectedItemColor: AppTheme.additionalText,
          selectedItemColor: AppTheme.green,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 24,
          onTap: _onItemTapped,
          showUnselectedLabels: true,
          elevation: 5),
    );
  }
}
