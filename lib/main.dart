//-----------------------------------------------------------------------------------------------------------------------------
//? Fill in the following information
//
// SCSJ3623 Mobile Application Programming
// Exercise 3 - HTTP and JSON
//
// Pair Programming
// Member 1's Name: Yad Saeed    Matric:______________       Location: ____________ (i.e. where are you currently located)
// Member 2's Name: Varin Karwan    Matric:______________       Location: ____________
// Date and time (s): 1/15/2022  (Date and time you conducted the pair programming sessions)
//-----------------------------------------------------------------------------------------------------------------------------
//? This file is fully given.

import 'package:flutter/material.dart';

import 'router.dart';

void main() => runApp(
      MaterialApp(
        title: 'MAP Exercise 4',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        onGenerateRoute: createRoute,
      ),
    );
