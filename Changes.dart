import 'dart:ui';
import 'package:flutter/material.dart';
import 'Swords.dart';
import 'Bosses.dart';

class Changes {

  static List<Swords> userSwords() {
    var list = List<Swords>();
    list.add(Swords("Hands", 0.0, 0, false, 'assets/images/hands.png'));
    list.add(Swords("Stick", 1.0, 0, false, 'assets/images/stick.png'));
    list.add(Swords("Sword", 2.5, 100, false, 'assets/images/sword.png'));
    list.add(Swords("Shotgun", 4.0, 500, false, 'assets/images/shotgun.png'));
   /* list.add(Swords("Lightsaber", 6.5, 2500, false));
    list.add(Swords("Buster Sword", 9.3, 4000, false));
    list.add(Swords("Soul Edge", 13.8, 8000, false)); */
    return list;
  }


  static List<Bosses> theBoss() {
    var list = List<Bosses>();
    list.add(Bosses("Demon", 100.0, 'assets/images/demon1.png', false));
    list.add(Bosses("Wings of Despair", 250, 'assets/images/demon2.png', false));
    list.add(Bosses("Barbarian", 300, 'assets/images/barbarian.png', false));
    list.add(Bosses("Madara Uchiha", 400, 'assets/images/madara.png', false));
    list.add(Bosses("Nicki Minaj", 600, 'assets/images/nicki.png',false));
    list.add(Bosses("Darth Jar Jar Binks", 800, 'assets/images/pngbarn.png', false));


    return list;
    }

  }
