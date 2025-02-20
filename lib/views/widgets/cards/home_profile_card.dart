import 'package:flutter/material.dart';
import 'package:runandmark/data/constants.dart';
import 'package:runandmark/data/notifiers.dart';

class HomeProfileCardWidget extends StatelessWidget {
  const HomeProfileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    selectedPageNotifier.value = 1;
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 100,
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 40,
              child: Center(
                child: Text(
                  'balance: 293 RUN',
                  style: KtexStyle.tokensText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
