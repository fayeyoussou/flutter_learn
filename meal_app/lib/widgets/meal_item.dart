import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

///  Created by youssouphafaye on 8/24/22.
class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  @override
  Widget build(BuildContext context) {


    void selectMeal(){

    }
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15) // set rounded corner on the card
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child:
        Column(children: [
          Stack(children: [
            ClipRRect( //clipRect will be use because borderRadius cannot be set on Image
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)
              ),
              child: Image.network(
                  imageUrl,height: 250,
                  width: double.infinity, // will take all the width that it can get
                  fit: BoxFit.cover, // resize and re-crop the image
                // so that it can fit into the container
              ), //for local image we use Image.asset
            ),
            Positioned(
              bottom: 20,
              right : 10,
              child: Container(
                width: 300,
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                child: Text(
                  title,style: const TextStyle(fontSize: 26,color: Colors.white),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            )
          ],)
        ],),
      ),
    );
  }

  const MealItem(this.title, this.imageUrl, this.duration, this.complexity,
      this.affordability, Key? key) : super(key: key);
}
