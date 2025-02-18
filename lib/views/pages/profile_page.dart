import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:runandmark/data/notifiers.dart';
import 'package:runandmark/views/pages/auth/onboardings/welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Профиль"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(133, 0, 27, 25),
      ),
      body: Stack(
        children: [
          /// 🎬 **Фоновая анимация**
          Positioned.fill(
            child: ClipRect(
              // 🔹 Обрезает выходящие за границы части
              child: Transform.rotate(
                angle: -1.2,
                child: Lottie.asset(
                  'assets/lotties/welcome.json',
                  fit: BoxFit.cover, // ✅ Чтобы анимация оставалась в границах
                ),
              ),
            ),
          ),

          /// 🔹 **Контент профиля**
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                /// 🔵 **Аватар**
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage("assets/images/avatar.png"), // Путь к аватарке
                ),
                SizedBox(height: 16),

                /// 📝 **Имя пользователя**
                Text(
                  "Имя Фамилия",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 16),

                /// ✉ **Email**
                Text(
                  "email@example.com",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                SizedBox(height: 20),

                /// ✏ **Кнопка редактирования профиля**
                ElevatedButton.icon(
                  onPressed: () {
                    // Логика редактирования профиля
                  },
                  icon: Icon(Icons.edit),
                  label: Text("Редактировать профиль"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white10,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
                SizedBox(height: 400),

                /// 🚪 **Кнопка выхода**
                ElevatedButton.icon(
                  onPressed: () {
                    selectedPageNotifier.value = 0;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          loadingMainImageNotifier.value = false;
                          return WelcomePage();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.logout),
                  label: Text("Выйти"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 106, 25, 13),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
