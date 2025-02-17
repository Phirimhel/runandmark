import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:runandmark/data/notifiers.dart';
import 'package:runandmark/views/widget_tree.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          /// 🎬 **Фоновая Lottie-анимация**
          Positioned.fill(
            child: Transform.rotate(
                angle: 2.7,
                child: Lottie.asset(
                  'assets/lotties/welcome.json',
                  fit: BoxFit.fill, // ✅ Чтобы анимация не искажалась
                )),
          ),

          /// 🟢 **Карта с формой логина**
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Opacity(
                opacity: 0.9,
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // 🔹 Высота только по контенту
                  children: [
                    Text(
                      'RUN',
                      style: TextStyle(
                        fontSize: 60,
                        letterSpacing: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    /// 🆙 **Текст над карточкой**
                    Wrap(
                      children: [
                        Text(
                          'AND',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                        Text(
                          'MARK',
                          style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 30.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10), // 🔹 Отступ перед карточкой
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(20)), // ✅ Скругленные углы
                      child: Padding(
                        padding: const EdgeInsets.all(
                            20.0), // ✅ Добавил отступы внутри карты
                        child: Column(
                          mainAxisSize:
                              MainAxisSize.min, // ✅ Высота по контенту
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // ✅ Выравнивание текста влево
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 16),

                            /// 📩 **Логин**
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Enter your email",
                                hintStyle: TextStyle(color: Colors.white70),
                                filled: true,
                                fillColor: Colors.white
                                    .withOpacity(0.2), // ✅ Легкая прозрачность
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide.none, // ✅ Без рамки
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 12),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 16),

                            /// 🔒 **Пароль**
                            TextField(
                              obscureText: true, // ✅ Скрытие пароля
                              decoration: InputDecoration(
                                hintText: "Enter your password",
                                hintStyle: TextStyle(color: Colors.white70),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.2),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 12),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),

                            SizedBox(height: 20),

                            /// 🔘 **Кнопка Login**
                            Align(
                              alignment: Alignment.topRight,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.white10, // ✅ Белый фон кнопки
                                  foregroundColor: Colors.teal, // ✅ Цвет текста
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 12),
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        loadingMainImageNotifier.value = true;
                                        return WidgetTree();
                                      },
                                    ),
                                  );
                                },
                                child: Text("Login"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10), // 🔹 Отступ после карточки

                    /// 🆗 **Текст под карточкой**
                    Text(
                      'Create an account or reset password',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
