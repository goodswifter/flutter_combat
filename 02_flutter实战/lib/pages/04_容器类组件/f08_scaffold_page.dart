///
/// Author       : zhongaidong
/// Date         : 2022-03-07 21:47:08
/// Description  :
///

import 'package:flutter/material.dart';

import 'widgets/drawer_page.dart';

class ScaffoldPage01 extends StatefulWidget {
  const ScaffoldPage01({Key? key}) : super(key: key);

  @override
  State<ScaffoldPage01> createState() => _ScaffoldPage01State();
}

class _ScaffoldPage01State extends State<ScaffoldPage01> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue, backgroundColor: Colors.white),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('练习Demo'),
          // leading: Builder(
          //   builder: (BuildContext context) => IconButton(
          //     icon: const Icon(Icons.menu),
          //     onPressed: () => Scaffold.of(context).openDrawer(),
          //     tooltip: MaterialLocalizations.of(context)
          //         .openAppDrawerTooltip, // 长按提示
          //   ),
          // ),
          actions: [
            IconButton(
                onPressed: () => print('分享'), icon: const Icon(Icons.share))
          ],
        ),
        drawer: const DrawerPage(),
        bottomNavigationBar: BottomNavigationBar(
          // 底部导航
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.business), label: 'Business'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
            onPressed: () => print(11), child: const Icon(Icons.add)),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
