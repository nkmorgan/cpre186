import 'dart:ui';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Swords.dart';
import 'Bosses.dart';
import 'Changes.dart';

void main() => runApp(Game());

class Game extends StatefulWidget {
  @override
  _Game createState() => _Game();
}

double damage = 0.0;
var coins = 0;
var sword = Changes.userSwords();
var boss = Changes.theBoss();
var bossNum = 0;
var bossMult = 1;
var bossCoins = 30;
var currentWeapon = "nothing";
var x;
var y;
var counter = 0;
var weaponNum = 0;

class _Game extends State<Game> {

  void update(int which) {
    setState(() {
      weaponNum = which;
      currentWeapon = sword[which].name;
      damage = 20 * sword[which].damage;
      sword[which].hasBought = true;
      coins -= sword[which].price;
    });
    print(sword[which].name);
  }

  void hitBoss() {
   setState(() {
     boss[bossNum].health = max(boss[bossNum].health - damage, 0.0);
     if(boss[bossNum].health == 0) {
       boss[bossNum].died = true;
       coins += bossCoins * bossMult;
       ++bossNum;
       ++bossMult;
     }
   });
   counter++;
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/hell.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),


        //blood splatter
        Align(
          alignment: Alignment(new Random().nextInt(3).toDouble() - 1, (new Random().nextDouble() * -1) + 0.5),
          child:
          Container(
            height: 100,
            child: (!(counter == 0)) ? Image.asset('assets/images/blood.png') : null,
          ),
        ),

        //damage done on screen
        Align(
          alignment: Alignment(new Random().nextInt(3).toDouble() - 1, (new Random().nextDouble() * -1) + 0.5),
          child:
          Container(
            height: 100,
            child: (!(counter == 0)) ? Text('-' + damage.toString(),
              style: TextStyle(
                fontSize: 60,
                color: Colors.red,
                fontFamily: 'Cinzel',
                fontWeight: FontWeight.w700,
              ),
            ): null,
          ),
        ),

        //weapon
        Align(
          alignment: Alignment(0.0, 0.6),
          child: Container(
            height: 250,
            child: Image.asset(sword[weaponNum].assets),
          ),
        ),


        //weapons list
        Align(
          alignment: Alignment.bottomCenter,
           child: Container(
        height: 200,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
              onPressed: !sword[1].hasBought && coins >= sword[1].price ? () => update(1) : null,
              color: Colors.black,
              disabledColor: Colors.white30,
              child: Center(child: Text(
                sword[1].name + '   ' + sword[1].price.toString() + ' coins',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Cinzel',
              ),
              ),
            ),
            ),
            RaisedButton(
              onPressed: !sword[2].hasBought && coins >= sword[2].price ? () => update(2) : null,
              color: Colors.black,
              disabledColor: Colors.white30,
              child: Text(
                sword[2].name + '   ' + sword[2].price.toString() + ' coins',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Cinzel',
                ),
              ),
            ),
            RaisedButton(
              onPressed: !sword[3].hasBought && coins >= sword[3].price ? () => update(3) : null,
              color: Colors.black,
              disabledColor: Colors.white30,
              child: Text(
                sword[3].name + '   ' + sword[3].price.toString() + ' coins',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontFamily: 'Cinzel',
                ),
              ),
            ),
          ],
        ),
        ),
          ),

        //current weapon and coins bar
        Align(
          alignment: Alignment(0.0, 0.57),
          child: Container(
            color: Colors.red,
            child: Text('Current Weapon: ' + currentWeapon + '  ' + coins.toString() + ' coins',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'Cinzel',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),


        //boss
        Align(
          alignment: Alignment(0.0, -0.2),
          child: Container(
            height: 400,
          width: 300,
          child: Center(
            child: Column(children: [
              InkWell(
                onTap: hitBoss,
                child: Image.asset(boss[bossNum].assets),
              )
            ],
            ),
          ),
        ),
        ),

        //Boss name and health
        Align(
          alignment: Alignment(0.0, -0.9),
          child: Container(
                child: Text(boss[bossNum].name + '\n' + 'Health: ' + boss[bossNum].health.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontFamily: 'Cinzel',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
    ],
      ),
    ),
    );
  }
}