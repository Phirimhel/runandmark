import 'package:flutter/material.dart';
import 'package:runandmark/data/notifiers.dart';
import 'package:runandmark/views/pages/home_page.dart';
import 'package:runandmark/views/pages/library_page.dart';
import 'package:runandmark/views/pages/profile_page.dart';
import 'package:runandmark/views/widgets/app_bar_widget.dart';
import 'package:runandmark/views/widgets/navbar_widget.dart';

List<Widget> pages = [
  HomePage(),
  ProfilePage(),
  LibraryPage(),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: ValueListenableBuilder(
          valueListenable: selectedPageNotifier,
          builder: (context, selectedPage, child) {
            return pages.elementAt(selectedPage);
          }),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
