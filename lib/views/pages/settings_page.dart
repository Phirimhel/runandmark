import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isSwiched = false;

  bool? isCheked = false;

  double sliderValue = 0.0;

  String? menuItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
                child: Column(
              children: [
                // ?switch
                SwitchListTile(
                  title: Text("switcher"),
                  value: isSwiched,
                  onChanged: (bool value) => {
                    setState(() {
                      isSwiched = value;
                    }),
                  },
                ),
                // ??checkbox
                CheckboxListTile(
                  tristate: true,
                  title: Text('checkbox'),
                  value: isCheked,
                  onChanged: (bool? value) {
                    setState(() {
                      isCheked = value;
                    });
                  },
                ),
                // some spaceA
                Slider.adaptive(
                    value: sliderValue,
                    onChanged: (double value) => setState(() {
                          sliderValue = value;
                        })),

                // Container(
                //   padding: EdgeInsets.all(20.0),
                //   child: InkWell(
                //     onTap: () => print('taped'),
                //     child: Image.network(
                //         'https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg'),
                //   ),
                // ),

                InkWell(
                    splashColor: Colors.red,
                    onTap: () => print("object"),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.white10,
                    )),
                Divider(),
                Wrap(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('button'),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: Text('button'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('button'),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('button'),
                    ),
                    CloseButton(),
                    BackButton(),
                    DropdownButton(
                        value: menuItem,
                        items: [
                          DropdownMenuItem(
                            value: 'el 1',
                            child: Text('element 1'),
                          ),
                          DropdownMenuItem(
                            value: 'el 2',
                            child: Text('element 2'),
                          ),
                          DropdownMenuItem(
                            value: 'el 3',
                            child: Text('element 3'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            menuItem = value;
                          });
                        })
                  ],
                ),
                Divider(),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('snakbar'),
                        duration: Duration(seconds: 5),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: Text('Open Snakbar'),
                ),
                Divider(),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Alert title'),
                            content: Text('Alert Contrnt'),
                            actions: [
                              CloseButton(),
                              FilledButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('clouse'))
                            ],
                          );
                        });
                  },
                  child: Text('Alert'),
                ),
              ],
            )),
          ),
        ));
  }
}
