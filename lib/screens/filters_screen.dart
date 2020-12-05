import '../widgets/drawer_item.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  final Map<String, bool> currentFilters;
  final Function saveFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters["gluten"];
    _lactoseFree = widget.currentFilters["lactose"];
    _vegetarian = widget.currentFilters["vegetarian"];
    _vegan = widget.currentFilters["vegan"];

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildColumn(),
      drawer: DrawerItem(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      actions: [buildIconButton()],
      title: Text("Filters"),
    );
  }

  IconButton buildIconButton() {
    return IconButton(
      icon: Icon(Icons.save),
      onPressed: () {
        final selectedFilters = {
          "gluten": _glutenFree,
          "lactose": _lactoseFree,
          "vegetarian": _vegetarian,
          "vegan": _vegan,
        };
        widget.saveFilters(selectedFilters);
      },
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        buildContainer(),
        buildExpanded(),
      ],
    );
  }

  Container buildContainer() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text("Adjust Your Meal Selection"),
    );
  }

  Expanded buildExpanded() {
    return Expanded(
      child: ListView(children: [
        _buildSwitchListTile("Gluten-Free", "Only Include Gluten-Free Meals", _glutenFree, (value) {
          setState(() {
            _glutenFree = value;
          });
        }),
        _buildSwitchListTile("Lactose-Free", "Only Include Lactose-Free Meals", _lactoseFree, (value) {
          setState(() {
            _lactoseFree = value;
          });
        }),
        _buildSwitchListTile("Vegeterian", "Only Include Vegeterian Meals", _vegetarian, (value) {
          setState(() {
            _vegetarian = value;
          });
        }),
        _buildSwitchListTile("Vegan", "Only Include Vegan Meals", _vegan, (value) {
          setState(() {
            _vegan = value;
          });
        }),
      ]),
    );
  }
}
