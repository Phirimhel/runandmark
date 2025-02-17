import 'package:flutter/material.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  bool isSwiched = false;
  bool? isCheked = false;
  double sliderValue = 0.0;
  String? menuItem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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

          Container(
            padding: EdgeInsets.all(20.0),
            child: InkWell(
                splashColor: Colors.red,
                onTap: () => print("object"),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.white10,
                )),
          ),

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
                    DropdownMenuItem(value: null, child: CloseButton()),
                  ],
                  onChanged: (value) {
                    setState(() {
                      menuItem = value;
                    });
                  })
            ],
          )
        ],
      )),
    );
  }
}
