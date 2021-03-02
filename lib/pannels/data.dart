import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';



class FIrstpannel extends StatelessWidget {

  final Color textColor;
  final Color countColor;
  final String title;
  final String count;


  const FIrstpannel(
      {Key key,  this.textColor, this.title, this.count,this.countColor})
      :super(key: key);
@override
  Widget build(BuildContext context) {



    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 5),
      child: Container(
        width: 200,
         // padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFf46b45),Color(0xFFeea849)]
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0), // shadow direction: bottom right
          )
        ],
      ),

        // decoration: BoxDecoration(
        //   // image: DecorationImage(
        //   //   image: AssetImage("assets/backgr.jpg")
        //   // )
        // ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: textColor),
            ),
            Text(
              count,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.bold, color: countColor),
            )
          ],
        ),
      ),
    );
  }
  }
class CountryPannel extends StatelessWidget {
  final Color titleColor;
  final Color countColor;
  final Color deathColor;
  final String countryname;
  final String cases;
  final String today;
  final String deathstotal;
  final String todaydeath;
  final String recovered;
  final String active;

  const CountryPannel({
      Key key, this.titleColor, this.countryname, this.cases,this.countColor,this.today,this.recovered,this.active,this.deathstotal,this.todaydeath,this.deathColor})
      :super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width/2,
        height: 150,

      decoration: BoxDecoration(
      gradient: LinearGradient(
      colors: [Color(0xFFf46b45),Color(0xFFeea849)]
      ),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
      BoxShadow(
      color: Colors.black,
      blurRadius: 2.0,
      spreadRadius: 0.0,
      offset: Offset(2.0, 2.0), // shadow direction: bottom right
      )
      ],
      ),
        // alignment: Alignment.centerLeft,
        // padding: EdgeInsets.all(10),
        // margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        // height: 150,
        // decoration: BoxDecoration(
        //     // image: DecorationImage(
        //     //   fit: BoxFit.cover,
        //     //     image: AssetImage("assets/back.jpg",)
        //     // ),
        //     borderRadius: BorderRadius.all(Radius.circular(20)),
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   colors: [Color(0xFF00C9FF),Color(0xFF92FE9D)],
          // )
        // child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(

            children: <Widget>[
              Text(countryname, textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: titleColor,),
              ),
              Text(
                cases,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, color: countColor),
              ),
              Text(
                today,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, color: countColor),
              ),
              Text(
                deathstotal,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, color: deathColor),
              ),
              Text(
                todaydeath,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, color: deathColor,
                ),
              ),
              Text(
                recovered,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, color: countColor),
              ),
              Text(
                active,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.bold, color: countColor),
              )

            ],
          ),
        ),
    );
  }
}
