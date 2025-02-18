import 'package:flutter/material.dart';
import 'package:runandmark/views/pages/runner_page.dart';
import 'package:runandmark/views/widgets/buttons/buttons_winged.dart';
import 'package:runandmark/views/widgets/cards/home_profile_card.dart';
import 'package:runandmark/views/widgets/style/back_animation_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(
          children: [
            BackAnimationWidget(),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: HomeProfileCardWidget(),
                ),
                SizedBox(height: 16),
                ButtonsListWidget.buttonType(
                  chosenButton: ChosenButton.playLikeARunner,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RunnerPage();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                ButtonsListWidget.buttonType(
                  chosenButton: ChosenButton.playLikePointMaster,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
