import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Expensive";
        break;
      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: buildCard(),
    );
  }

  Card buildCard() {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: buildColumn(),
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        buildStack(),
        buildPadding(),
      ],
    );
  }

  Stack buildStack() {
    return Stack(
      children: [
        buildClipRRect(),
        buildPositioned(),
      ],
    );
  }

  ClipRRect buildClipRRect() {
    return ClipRRect(
      borderRadius: buildBorderRadius(),
      child: buildImage(),
    );
  }

  BorderRadius buildBorderRadius() {
    return BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    );
  }

  Image buildImage() {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      height: 250,
      width: double.infinity,
    );
  }

  Positioned buildPositioned() {
    return Positioned(
      bottom: 20,
      right: 10,
      child: buildPositionedContainer(),
    );
  }

  Container buildPositionedContainer() {
    return Container(
      color: Colors.black54,
      padding: buildEdgeInsets(),
      width: 300,
      child: buildContainerText(),
    );
  }

  EdgeInsets buildEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 5,
    );
  }

  Text buildContainerText() {
    return Text(
      title,
      overflow: TextOverflow.fade,
      softWrap: true,
      style: TextStyle(
        color: Colors.white,
        fontSize: 26,
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: buildRow(),
    );
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildScheduleRow(),
        buildWorkRow(),
        buildMoneyRow(),
      ],
    );
  }

  Row buildScheduleRow() {
    return Row(
      children: [
        Icon(Icons.schedule),
        SizedBox(width: 5),
        Text("$duration Min"),
      ],
    );
  }

  Row buildWorkRow() {
    return Row(
      children: [
        Icon(Icons.work),
        SizedBox(width: 5),
        Text(complexityText),
      ],
    );
  }

  Row buildMoneyRow() {
    return Row(
      children: [
        Icon(Icons.attach_money),
        SizedBox(width: 5),
        Text(affordabilityText),
      ],
    );
  }
}
