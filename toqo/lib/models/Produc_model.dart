import 'package:flutter/material.dart';

class Product {
  final double productId;
  final String prodImgUrl;
  final String prodTitle;
  final double cateogryId;

  Product({required this.productId,required this.cateogryId,required this.prodImgUrl, required this.prodTitle}):super();
}