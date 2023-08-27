
import 'package:flutter/material.dart';
 

import 'package:switiban/screens/views.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _myPage = [
    const CalPage(),
    const Cam(),
    const SugarPhotoPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: _myPage[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade800,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            label: 'Callories',
            icon: Icon(
              Icons.calculate,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Camera',
            icon: Icon(
              Icons.camera,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Gallery',
            icon: Icon(
              Icons.browse_gallery,
            ),
          ),
        ],
      ),
    );
  }
}
// Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: () => cam(),
//               // ignore: prefer_const_constructors
//               child: ImageContainer(
//                   imgUrl: 'assets/images/cam.png', sizeH: 110, sizeW: 120),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             GestureDetector(
//               onTap: (() {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const SugarPhotoPage()),
//                 );
//               }),
//               child: const ImageContainer(
//                   imgUrl: 'assets/images/sweet.png', sizeH: 120, sizeW: 120),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             GestureDetector(
//               child: const ImageContainer(
//                   imgUrl: 'assets/images/scale.png', sizeH: 160, sizeW: 160),
//             ),
//           ],
//         ),
//       ),