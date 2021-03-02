import 'package:flutter/material.dart';

class PreventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget contains({String image,String content,}){
      return  Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [Color(0xFFf46b45),Color(0xFFeea849)]
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0),
                )]
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(image),
                width: 50,
                height: 50,
              ),
              Text(
               content,
                style: TextStyle(
                  fontSize: 12,color: Colors.white
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
    }
    return Container(
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        children: [
         contains(
           image: "assets/wash.png",
           content: "Wash your hands frequently using soap and water or an alcohol-based hand rub"
         ),
          contains(
            image: "assets/cover.png",
            content: "Cover mouth and nose with flexed elbow or tissue when coughing or sneezing.Dispose of used tissue immediately"
          ),
          contains(
            image: "assets/avoid.png",
            content: "Avoid close contact with anyone who has cold or flu-like symptoms"
          ),
          contains(
            image: "assets/seek.png",
            content: "Seek medical care early if you or your child has a fever ,cough or difficulty breathing"
          )
        ],
      ),
    );
  }
}
