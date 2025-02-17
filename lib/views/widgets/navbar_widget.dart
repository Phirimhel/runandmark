import 'package:flutter/material.dart';
import 'package:runandmark/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return NavigationBar(
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.house),
                label: 'home',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_2_rounded),
                label: 'profile',
              ),
            ],
            onDestinationSelected: (int index) =>
                {selectedPageNotifier.value = index},

            //! just save the state of icons bar.
            selectedIndex: selectedPage,
          );
        });
  }
}
