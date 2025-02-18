import 'package:flutter/material.dart';
import 'package:runandmark/data/notifiers.dart';
import 'package:runandmark/views/widget_tree.dart';

class LoginCardWidget extends StatelessWidget {
  const LoginCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)), // ✅ Скругленные углы
      child: Padding(
        padding: const EdgeInsets.all(20.0), // ✅ Добавил отступы внутри карты
        child: Column(
          mainAxisSize: MainAxisSize.min, // ✅ Высота по контенту
          crossAxisAlignment:
              CrossAxisAlignment.start, // ✅ Выравнивание текста влево
          children: [
            Text(
              'RUN AND MARK',
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

                // ✅ Легкая прозрачность
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none, // ✅ Без рамки
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 12),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              ),
              style: TextStyle(color: Colors.white),
            ),

            SizedBox(height: 20),

            /// 🔘 **Кнопка Login**
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white10, // ✅ Белый фон кнопки
                  foregroundColor: Colors.teal, // ✅ Цвет текста
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
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
    );
  }
}
