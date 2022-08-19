import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Championnat {
  final String id;
  final String nom;
  final Color color;
  const Championnat(
    {
      required this.id, 
      required this.nom, 
      this.color = Colors.cyan
      }
  );
}
