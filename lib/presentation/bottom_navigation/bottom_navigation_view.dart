import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationProvider>(
      builder: (context, model, _) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildNavItem(CupertinoIcons.home, 0, model),
              buildNavItem(CupertinoIcons.search, 1, model),
              buildNavItem(CupertinoIcons.bookmark, 2, model),
              buildNavItem(CupertinoIcons.person, 3, model),
            ],
          ),
        );
      },
    );
  }

  Widget buildNavItem(
      IconData icon, int index, BottomNavigationProvider model) {
    return GestureDetector(
      onTap: () {
        model.setIndex(index);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: model.currentIndex == index
              ? Colors.blue.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          color: model.currentIndex == index ? Colors.blue : Colors.grey,
          size: 24,
        ),
      ),
    );
  }
}
