import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

buildAppBar() {
  final icon = Icons.menu;
  final icona = Icons.arrow_back;
  final iconb = Icons.arrow_forward;
  final iconc = Icons.settings_outlined;

  return Container(
      height: 45,
      color: Colors.red[900],
      child: WindowTitleBarBox(
        child: MoveWindow(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  size: 20,
                  color: Colors.green,
                ),
              ),
              SizedBox(width: 150),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  icona,
                  size: 20,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  iconb,
                  size: 20,
                  color: Colors.green,
                ),
              ),
              // SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  iconc,
                  size: 20,
                  color: Colors.green,
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 18,
                  maxWidth: 350.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  cursorHeight: 16,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 15,
                      color: Colors.green,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: Colors.green,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.green,
                    isDense: true,
                    //border: InputBorder.none,
                  ),
                ),
              ),

              WindowsButton()
            ],
          ),
        ),
      ));
}

class WindowsButton extends StatelessWidget {
  const WindowsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = WindowButtonColors(
      mouseOver: Color(0xFFD32F2F),
      mouseDown: Color(0xFFB71C1C),
      iconNormal: Colors.green,
      iconMouseOver: Colors.white,
    );
    return Row(children: [
      MinimizeWindowButton(colors: colors),
      MaximizeWindowButton(
        colors: colors,
      ),
      CloseWindowButton(
        colors: colors,
      )
    ]);
  }
}
