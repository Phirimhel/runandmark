import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:runandmark/data/constants.dart';
import 'package:runandmark/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: Transform.rotate(
                  angle: 2.2,
                  child: Lottie.asset('assets/lotties/welcome.json',
                      fit: BoxFit.cover // ✅ Чтобы анимация не искажалась
                      )),
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                borderRadius: BorderRadius.circular(
                                    50), // Ensures ripple effect is round
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white10,
                                    shape: BoxShape.circle, // Makes it round
                                    // image: DecorationImage(
                                    //   image: AssetImage(imagePath),
                                    //   fit: BoxFit.cover, // Ensures the image fills the circle
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
                                'balance: 29338 RUN',
                                style: KtexStyle.tokensText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity, // Makes button full-width
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12), // Adjust padding
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Align text left & icon right
                      children: [
                        Text('Play like a runner !'), // Left side text
                        Icon(
                            Icons.arrow_forward_ios_rounded), // Right side icon
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  // Makes button full-width
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12), // Adjust padding
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Align text left & icon right
                      children: [
                        Text('Play like the "Point Master"!'), // Left side text
                        Icon(
                            Icons.arrow_forward_ios_rounded), // Right side icon
                      ],
                    ),
                  ),
                ),
                HeroWidget()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
