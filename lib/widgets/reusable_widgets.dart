import 'package:flutter/material.dart';

String? errorMessage = 'error';

Widget _errorMessage() {
  return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
}
