import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/screen/ProfileScreen.dart';
import 'package:wisata_candi/screen/favorite_screen.dart';
import 'package:wisata_candi/screen/home_screen.dart';
import 'package:wisata_candi/screen/search_screen.dart';
import 'package:wisata_candi/screen/detail_screen.dart';
import 'package:wisata_candi/screen/sign_in_screen.dart';
import 'package:wisata_candi/screen/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      title: 'Wisata Candi',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.deepPurple),
          titleTextStyle: TextStyle(
            color: Colors.deepPurple,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        ),
        colorScheme:
        ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: Colors.deepPurple,
          surface: Colors.deepPurple[50],
        ),
        useMaterial3: true,
      ),
      //home: DetailScreen(),
      // home: SignInScreen(),
      // home: SignUpScreen(),
      //home: SearchScreen(),
      // home: HomeScreen(),
      home: MainScreen(),
    );
  }

}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // TODO: 1 Deklarasikan variabel
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2 Buat properti body berupa widget yang ditampilkan
      body: _children[_currentIndex],
      // TODO: 3 Buat properti BottomNavigationBar dengan nilai Theme
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.deepPurple[50]
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.deepPurple),
                  label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.deepPurple),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: Colors.deepPurple),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.deepPurple),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.deepPurple[100],
            showUnselectedLabels: true,
            showSelectedLabels: true,
          ),
      ),
      // TODO: 4 Buat data dan child dari Theme

    );
  }
}
