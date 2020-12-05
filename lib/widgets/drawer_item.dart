import 'package:MealsApp/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function onTap) {
    return ListTile(
      leading: buildListTileIcon(icon),
      title: buildListTileText(title),
      onTap: onTap,
    );
  }

  Icon buildListTileIcon(IconData icon) {
    return Icon(
      icon,
      size: 26,
    );
  }

  Text buildListTileText(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: buildColumn(context),
    );
  }

  Column buildColumn(BuildContext context) {
    return Column(
      children: [
        buildContainer(),
        SizedBox(height: 20),
        buildListTile(
          "Meals",
          Icons.restaurant,
          () => Navigator.of(context).pushReplacementNamed("/"),
        ),
        buildListTile(
          "Filters",
          Icons.settings,
          () => Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName),
        ),
      ],
    );
  }

  Container buildContainer() {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.blue,
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: buildContainerText(),
    );
  }

  Text buildContainerText() {
    return Text(
      "Cooking Up!",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
