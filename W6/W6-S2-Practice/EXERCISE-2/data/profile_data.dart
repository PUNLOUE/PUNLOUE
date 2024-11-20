import 'package:flutter/material.dart';
import 'package:my_project/W6/EXERCISE-2/model/profile_tile_model.dart';


// Sample ProfileData instance
ProfileData punloueProfile = ProfileData(
  name: "Punloue",
  position: "Flutter Developer",
  avatarUrl: 'assets/w5-s2/profile.jpg',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+999 999 999"),
    TileData(icon: Icons.location_on, title: "Address", value: "855 Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "punloue.pich@student.cadt.edu.kh"),
  ],
);
